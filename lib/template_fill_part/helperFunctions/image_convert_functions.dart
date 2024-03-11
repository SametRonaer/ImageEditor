import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

mixin ImageConvertFunctions {
  Future<ui.Image> convertBase64ToUiImage(String imageData) async {
    Uint8List imageBytes = base64Decode(imageData);
    ui.Image image = await decodeImageFromList(imageBytes);
    return image;
  }
}
