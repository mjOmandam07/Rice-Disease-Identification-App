import 'dart:io';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:image/image.dart' as img;
import 'package:collection/collection.dart';

class Classifier {
  Classifier();

  late Interpreter interpreter;
  late List<int> _inputShape;
  late List<int> _outputShape;

  late TensorImage _inputImage;
  late TensorBuffer _outputBuffer;

  late TfLiteType _inputType;
  late TfLiteType _outputType;

  late var _probabilityProcessor;




  classifyImage(var image, var model, var label) async {
    print("classifier ran");
    var inputImage = File(image.path);
    img.Image imageInput = img.decodeImage(inputImage.readAsBytesSync())!;


    try {
      interpreter = await Interpreter.fromAsset(
          "${model}", options: InterpreterOptions());
      _inputShape = interpreter
          .getInputTensor(0)
          .shape;
      _outputShape = interpreter
          .getOutputTensor(0)
          .shape;
      _inputType = interpreter
          .getInputTensor(0)
          .type;
      _outputType = interpreter
          .getOutputTensor(0)
          .type;
      // interpreter.run(tensorImage.buffer, probabilityBuffer.buffer);
      _outputBuffer = TensorBuffer.createFixedSize(_outputShape, _outputType);
      _probabilityProcessor =
          TensorProcessorBuilder().add(NormalizeOp(0, 255))
              .add(DequantizeOp(0, 1 / 255.0))
              .build();
      print("\n\ninput shape: ${_inputShape}\n"
          "output shape: ${_outputShape}\n"
          "input type: ${_inputType}\n"
          "output type: ${_outputType}\n\n");
      print("Interpreter Loaded Successfully");
    } catch (e) {
      print('error loading or running model: ${e}');
    }

    _inputImage = TensorImage(_inputType);
    _inputImage.loadImage(imageInput);



    ImageProcessor imageProcessor = ImageProcessorBuilder()
        .add(ResizeOp(
        _inputShape[1], _inputShape[2], ResizeMethod.NEAREST_NEIGHBOUR))
        .add(NormalizeOp(0, 255))
        .build();

    _inputImage = imageProcessor.process(_inputImage);

    try {
      print("interpreter run");
      interpreter.run(_inputImage.buffer, _outputBuffer.getBuffer());
      print("interpretation success!");
    } catch (e) {
      print("Interpreter run error:${e}");
    }


    List<String> labels = await FileUtil.loadLabels("assets/${label}");
    print('labels loaded');

    Map<String, double> labeledProb = TensorLabel.fromList(
        labels, _probabilityProcessor.process(_outputBuffer))
        .getMapWithFloatValue();
    var pred = getTopProbability(labeledProb);

    // print(pred);
    interpreter.close();
    return pred;


  }



}


getTopProbability(Map<String, double> labeledProb) {
  var pq = PriorityQueue<MapEntry<String, double>>(compare);
  pq.addAll(labeledProb.entries);
  var queue = pq.toList();
  var len = queue.length;
  var results = [];
  var result = {};
  var top_three;
  print(queue);
  for (var i = 0; i<len; i++ ){
    result = {'disease': queue[i].key, 'confidence': (queue[i].value * 100).toStringAsFixed(3)};
    results.add(result);
  };
  top_three = results.take(3).toList();

  return top_three;
}

int compare(MapEntry<String, double> e1, MapEntry<String, double> e2) {
  if (e1.value > e2.value) {
    return -1;
  } else if (e1.value == e2.value) {
    return 0;
  } else {
    return 1;
  }
}