// // ignore_for_file: public_member_api_docs, sort_constructors_first

// import 'package:flutter/material.dart';
// import 'dart:ui' as ui show Image;

// import 'package:storio/data/design_document_model.dart';
// import 'package:storio/data/design_object_model.dart';
// import 'package:storio/helperFunctions/relative_value_functions_mixin.dart';
// import 'package:storio/helpers/image_picker_manager.dart';

// class DemoPainter extends CustomPainter with RelativeValueFunctions {
//   //final DesignDocumentModel designDocument =
//   //    ImagePickerManager.instance.designDocument!;
//   final BuildContext context;

//   int imageCount = 0;
//   DemoPainter({
//     required this.context,
//   }) {}

//   Size get screenSize => MediaQuery.of(context).size;

//   @override
//   void paint(Canvas canvas, Size size) {
//     setCanvasConfig(canvas);
//     drawDesignElements(canvas);
//     //canvas.drawRect(Rect.fromPoints(10, b), paint)
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }

//   drawDesignElements(Canvas canvas) {
//     // List<DesignObjectModel> elements = designDocument.elements;
//     // for (var element in elements) {
//     //   elementsFactory(canvas, element);
//     // }
//   }

//   elementsFactory(Canvas canvas, DesignObjectModel element) {
//     if (element.id.contains("Rect")) {
//       if (element.id.contains("Border")) {
//         drawBorderedRect(canvas, element);
//       } else {
//         drawRect(canvas, element);
//       }
//     } else if (element.id.contains("Text")) {
//       drawText(canvas, element);
//     } else if (element.id.contains("Alpha")) {
//       drawAlphaImage(canvas, element);
//     }
//   }

//   drawRect(Canvas canvas, DesignObjectModel element) {
//     Size elementPosition =
//         getRelativePositionOfDesignElement(designDocument, element, screenSize);
//     Size elementSize =
//         getRelativeSizeOfDesignElement(designDocument, element, screenSize);

//     print("Apect ratio is");
//     print(elementSize.width / elementSize.height);

//     Offset firstCord = Offset(elementPosition.width, elementPosition.height);
//     Offset secondCord = Offset(elementPosition.width + elementSize.width,
//         elementPosition.height + elementSize.height);

//     Paint paint = Paint()
//       ..color = hexToColor(element.color ?? "#ffffff")
//       ..style = PaintingStyle.fill;
//     //final radians = 1 * pi / 180;

//     //canvas.rotate(radians);
//     canvas.drawRect(
//       Rect.fromPoints(firstCord, secondCord),
//       paint,
//     );
//   }

//   drawAlphaImage(Canvas canvas, DesignObjectModel element) async {
//     Size elementPosition =
//         getRelativePositionOfDesignElement(designDocument, element, screenSize);
//     Size elementSize =
//         getRelativeSizeOfDesignElement(designDocument, element, screenSize);

//     Offset firstCord = Offset(elementPosition.width, elementPosition.height);
//     Offset secondCord = Offset(elementPosition.width + elementSize.width,
//         elementPosition.height + elementSize.height);

//     Paint paint = Paint()
//       ..color = hexToColor(element.color ?? "#ffffff")
//       ..style = PaintingStyle.fill;

//     ui.Image selectedImage =
//         ImagePickerManager.instance.selectedImages[element.id]!;
//     canvas.drawImage(selectedImage, firstCord, paint);
//   }

//   setCanvasConfig(Canvas canvas) {
//     Color backgroundColor = hexToColor(designDocument.backgroundColor);
//     Paint backGroundPaint = Paint()
//       ..color = backgroundColor
//       ..style = PaintingStyle.fill;
//     canvas.drawPaint(backGroundPaint);
//   }

//   Color hexToColor(String code) {
//     return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
//   }

//   void drawBorderedRect(Canvas canvas, DesignObjectModel element) {
//     Size elementPosition =
//         getRelativePositionOfDesignElement(designDocument, element, screenSize);
//     Size elementSize =
//         getRelativeSizeOfDesignElement(designDocument, element, screenSize);
//     print("Apect ratio is");
//     print(elementSize.width / elementSize.height);

//     Offset firstCord = Offset(elementPosition.width, elementPosition.height);
//     Offset secondCord = Offset(elementPosition.width + elementSize.width,
//         elementPosition.height + elementSize.height);

//     Paint paint = Paint()
//       ..color = hexToColor(element.strokeColor ?? "#000000")
//       ..strokeWidth = element.strokeWidth?.toDouble() ?? 2
//       ..style = PaintingStyle.stroke;
//     //final radians = 1 * pi / 180;

//     //canvas.rotate(radians);
//     canvas.drawRect(
//       Rect.fromPoints(firstCord, secondCord),
//       paint,
//     );
//   }

//   void drawText(Canvas canvas, DesignObjectModel element) {
//     Size elementPosition =
//         getRelativePositionOfDesignElement(designDocument, element, screenSize);

//     Offset firstCord = Offset(elementPosition.width, elementPosition.height);
//     Color textColor = hexToColor(element.color ?? "#ffffff");

//     final textStyle = TextStyle(
//       color: textColor,
//       fontSize: element.fontSize!.toDouble(),
//     );
//     final textSpan = TextSpan(
//       text: element.text ?? "",
//       style: textStyle,
//     );
//     final textPainter = TextPainter(
//       text: textSpan,
//       textDirection: TextDirection.ltr,
//     );
//     textPainter.layout(
//       minWidth: 0,
//       maxWidth: 500,
//     );
//     final offset = firstCord;
//     textPainter.paint(canvas, offset);
//   }
// }
