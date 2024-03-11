import 'package:flutter/material.dart';

import '../data/design_document_model.dart';
import '../data/design_object_model.dart';
import '../data/user_image_layer_model.dart';

mixin RelativeValueFunctions {
  getRelativeSizeOfDesignElement(
    DesignDocumentModel doc,
    DesignObjectModel element,
    Size size,
  ) {
    double canvasWidth = doc.canvasWidth.toDouble();
    double canvasHeigth = doc.canvasHeight.toDouble();
    double elementHeightScale = element.height! / canvasHeigth;
    double elementWidthScale = element.width! / canvasWidth;
    double relativeWidth = size.width * elementWidthScale;
    double relativeHeight = size.height * elementHeightScale;
    return Size(relativeWidth, relativeHeight);
  }

  getRelativePositionOfDesignElement(
    DesignDocumentModel doc,
    DesignObjectModel element,
    Size size,
  ) {
    double canvasWidth = doc.canvasWidth.toDouble();
    double canvasHeigth = doc.canvasHeight.toDouble();
    double elementTopScale = element.top! / canvasHeigth;
    double elementLeftScale = element.left! / canvasWidth;
    double relativeLeft = size.width * elementLeftScale;
    double relativeTop = size.height * elementTopScale;
    return Size(relativeLeft, relativeTop);
  }

  // New Version Methods

  getRelativeSizeOfLayer({
    required DesignDocumentModel doc,
    required UserImageLayerModel imageLayer,
    required Size size,
  }) {
    double canvasWidth = doc.canvasWidth.toDouble();
    double canvasHeigth = doc.canvasHeight.toDouble();
    double elementHeightScale = imageLayer.height / canvasHeigth;
    double elementWidthScale = imageLayer.width / canvasWidth;
    double relativeWidth = size.width * elementWidthScale;
    double relativeHeight = size.height * elementHeightScale;
    return Size(relativeWidth, relativeHeight);
  }

  getRelativePositionOfLayer({
    required UserImageLayerModel imageLayer,
    required DesignDocumentModel doc,
    required Size size,
  }) {
    double canvasWidth = doc.canvasWidth.toDouble();
    double canvasHeigth = doc.canvasHeight.toDouble();
    double elementTopScale = imageLayer.top / canvasHeigth;
    double elementLeftScale = imageLayer.left / canvasWidth;
    double relativeLeft = size.width * elementLeftScale;
    double relativeTop = size.height * elementTopScale;
    return Size(relativeLeft, relativeTop);
  }

  getRelativeCanvasSize(BuildContext context, Size templateSize) {
    Size screenSize = MediaQuery.of(context).size;
    double screenAspectRatio = screenSize.height / screenSize.width;
    print("Screen height: ${screenSize.height}");
    print("Screen width: ${screenSize.width}");
    print("Screen aspect ratio: $screenAspectRatio");
    double templateAspectRatio = templateSize.height / templateSize.width;
    print("Template aspect ratio: $templateAspectRatio");
    print(
        "Current height: ${screenSize.height} Required height: ${screenSize.width * templateAspectRatio}");
  }
}
