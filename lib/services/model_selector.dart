import 'dart:io';
import 'package:rice_disease_detection/services/classifier.dart';


class modelType {
  modelType();
  final Classifier classifier = Classifier();
  var model;
  var outputs;
  var output_1;
  var output_2;

  runKagglemodel(image) async {
    outputs = await classifier.classifyImage(image, 'kaggle_model.tflite', 'kaggle_labels.txt');

    return outputs;
  }

  runPHmodel(image) async {
    outputs = await classifier.classifyImage(image, 'ph_model.tflite', 'ph_labels.txt');
    model = 'Philippine Model';

    return outputs;
  }

  runBoth (image) async {
    output_1 = await classifier.classifyImage(image, 'kaggle_model.tflite', 'kaggle_labels.txt');
    output_2 = await classifier.classifyImage(image, 'ph_model.tflite', 'ph_labels.txt');
    outputs = [output_1, output_2];

    return outputs;
  }

  }

