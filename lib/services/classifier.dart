import 'dart:io' as io;
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as img;

class Classifier {
  Classifier();

  classifyImage(PickedFile image) async {
    var _file = io.File(image.path);
    img.Image? imageTemp = img.decodeImage(_file.readAsBytesSync());
    img.Image resizedImg = img.copyResize(imageTemp!, height: 28, width: 28);
    var imgBytes = resizedImg.getBytes();
    var imgAsList = imgBytes.buffer.asUint8List();

    return getPred(imgAsList);
  }

  getPred(Uint8List imgAsList) async{
    List resultBytes = List.filled(28*28, null, growable: false);

    var input = resultBytes.reshape([1, 28, 28, 1]);
    var output = List.filled(1*10, null, growable: false).reshape([1,10]);

    InterpreterOptions interpreterOptions = InterpreterOptions();

    try{
      Interpreter interpreter = await Interpreter.fromAsset('model.tflite', options: interpreterOptions);
    } catch(e) {}
  }

}