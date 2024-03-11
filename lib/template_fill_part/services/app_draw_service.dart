// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../data/design_document_model.dart';
import '../data/layer_model.dart';
import '../data/painter_object_interface.dart';
import '../data/user_image_layer_model.dart';
import '../helperFunctions/size_setter_functions.dart';
import 'current_template_service.dart';

class AppDrawService extends CustomPainter with SizeSetterFunctions {
  BuildContext context;
  Size? canvasSize;

  AppDrawService({
    required this.context,
    this.canvasSize,
  });
  DesignDocumentModel? designDoc;
  List<PainterObject> designObjects = [];
  @override
  void paint(Canvas canvas, Size size) {
    designDoc = CurrentTemplateService.instance.currentDesignDocument;
    designObjects = CurrentTemplateService.instance.getOrderedPainterObjects();

    // Color backgroundColor = hexToColor(designDoc!.backgroundColor);
    // Paint backgroundPaint = Paint()
    //   ..color = backgroundColor
    //   ..style = PaintingStyle.fill;
    // canvas.drawPaint(backgroundPaint);
    paintDesignObjects(canvas);
  }

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  paintDesignObjects(Canvas canvas) {
    for (var element in designObjects) {
      if (element is LayerModel) {
        drawStandartLayer(element, canvas);
      } else if (element is UserImageLayerModel) {
        drawUserImageLayer(element, canvas);
      }
    }
  }

  drawStandartLayer(LayerModel layer, Canvas canvas) async {
    if (layer.image != null) {
      paintImage(
          canvas: canvas,
          fit: BoxFit.fitHeight,
          rect: Rect.fromLTWH(
              0, 0, canvasSize?.width ?? 100, canvasSize?.height ?? 100),
          image: layer.image!);
    }
  }

  drawUserImageLayer(UserImageLayerModel imageLayer, Canvas canvas) {
    if (imageLayer.image == null) {
      return;
    }
    Size position = calculateUserImagePosition(imageLayer);
    Size imageSize = calculateUserImageSize(imageLayer);

    paintImage(
        fit: BoxFit.fill,
        canvas: canvas,
        rect: Rect.fromLTWH(
          position.width,
          position.height,
          imageSize.width,
          imageSize.height,
        ),
        image: imageLayer.image!);
  }
}
