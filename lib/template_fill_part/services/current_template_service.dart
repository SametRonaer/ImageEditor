import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;
import '../data/design_document_model.dart';
import '../data/layer_model.dart';
import '../data/painter_object_interface.dart';
import '../data/user_image_layer_model.dart';
import '../helperFunctions/image_convert_functions.dart';
import '../helperFunctions/relative_value_functions_mixin.dart';

class CurrentTemplateService
    with ImageConvertFunctions, RelativeValueFunctions {
  CurrentTemplateService._init();

  static CurrentTemplateService instance = CurrentTemplateService._init();

  DesignDocumentModel? currentDesignDocument;
  List<LayerModel> layers = [];
  List<UserImageLayerModel> imageLayers = [];
  BuildContext? context;

  Size get canvasSize => Size(currentDesignDocument!.canvasWidth.toDouble(),
      currentDesignDocument!.canvasHeight.toDouble());

  Size? deviceSize;

  setCurrentDesignDocument(String? templateData) {
    if (templateData == null) {
      currentDesignDocument = null;
      return;
    }
    currentDesignDocument = DesignDocumentModel.fromJson(templateData);
    layers = currentDesignDocument!.layers;
    imageLayers = currentDesignDocument!.images;
  }

  getOrderedPainterObjects() {
    List<PainterObject> painterObjects = [
      ...currentDesignDocument!.layers,
      ...currentDesignDocument!.images
    ];
    painterObjects.sort((a, b) => a.depth.compareTo(b.depth));
    return painterObjects;
  }

  renderLayerImages() async {
    await Future.forEach(layers, (element) async {
      element.image = await convertBase64ToUiImage(element.layerData);
    });
  }

  Future<void> setRotatedImages(
      {required UserImageLayerModel userImage}) async {
    var pictureRecorder = ui.PictureRecorder();
    Canvas canvas = Canvas(pictureRecorder);

    ui.Image image = userImage.image!;
    final double r =
        sqrt(image.width * image.width + image.height * image.height) / 2;
    final alpha = atan(image.height / image.width);
    final beta = alpha + userImage.angle;
    final shiftY = r * sin(beta);
    final shiftX = r * cos(beta);
    final translateX = image.width / 2 - shiftX;
    final translateY = image.height / 2 - shiftY;
    canvas.translate(translateX, translateY);
    canvas.rotate(userImage.angle.toDouble());
    canvas.drawImage(image, Offset.zero, Paint());

    ui.Image rotatedImage =
        await pictureRecorder.endRecording().toImage(image.width, image.height);
    userImage.image = rotatedImage;
  }

  setScaleOfUserImages(BuildContext context) async {
    this.context = context;
    await Future.forEach(imageLayers, (element) async {
      Size elementPosition = getRelativePositionOfLayer(
          size: MediaQuery.of(context).size,
          imageLayer: element,
          doc: currentDesignDocument!);
      Size elementSize = getRelativeSizeOfLayer(
          doc: currentDesignDocument!,
          imageLayer: element,
          size: MediaQuery.of(context).size);
      element.relativeSize = elementSize;
      element.relativePosition = elementPosition;
    });
  }
}
