import 'dart:ui';

import '../data/user_image_layer_model.dart';
import '../services/current_template_service.dart';

mixin SizeSetterFunctions {
  calculateDeviceCanvasSize() {
    double width = CurrentTemplateService.instance.deviceSize!.width;
    double height = CurrentTemplateService.instance.deviceSize!.height;

    double canvasWidth = CurrentTemplateService.instance.canvasSize.width;
    double canvasHeight = CurrentTemplateService.instance.canvasSize.height;

    double canvasRatio = canvasHeight / canvasWidth;
    double deviceCanvasHeight = canvasRatio * width;
    if (deviceCanvasHeight < height) {
      print("Ok");
      return Size(width, deviceCanvasHeight);
    } else {
      canvasRatio = canvasWidth / canvasHeight;
      double deviceCanvasWidth = height * canvasRatio;
      print("Nope");

      return Size(deviceCanvasWidth, height);
    }
  }

  calculateUserImagePosition(UserImageLayerModel layer) {
    Size deviceCanvas = calculateDeviceCanvasSize();
    Size originalCanvas = CurrentTemplateService.instance.canvasSize;
    //Top
    double topRatio = layer.top.toDouble() / originalCanvas.height;
    double deviceTopCord = topRatio * deviceCanvas.height;
    //Left
    double leftRatio = layer.left.toDouble() / originalCanvas.width;
    double deviceLeftCord = leftRatio * deviceCanvas.width;
    return Size(deviceLeftCord, deviceTopCord);
  }

  calculateUserImageSize(UserImageLayerModel layer) {
    Size deviceCanvas = calculateDeviceCanvasSize();
    Size originalCanvas = CurrentTemplateService.instance.canvasSize;
    //Height
    double heightRatio = layer.height.toDouble() / originalCanvas.height;
    double deviceImageHeight = heightRatio * deviceCanvas.height;
    //Width
    double widthRatio = layer.width.toDouble() / originalCanvas.width;
    double deviceImageWidth = widthRatio * deviceCanvas.width;
    return Size(deviceImageWidth, deviceImageHeight);
  }
}
