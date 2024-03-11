// import 'package:flutter/material.dart';

// import 'model/text_area_config.dart';

// class TextArea extends StatefulWidget {
//   TextArea({
//     super.key,
//     required this.setActive,
//     required this.mainW,
//     required this.notifier,
//   });

//   ValueSetter<TextArea> setActive;
//   Widget mainW;
//   ValueNotifier<TextAreaConfig> notifier;
//   TextEditingController controller = TextEditingController();
//   FocusNode focusNode = FocusNode();
//   @override
//   State<TextArea> createState() => _TextAreaState();
// }

// class _TextAreaState extends State<TextArea> {
//   int currentRotation = 0;
//   double widgetSize = 100;

//   Widget mainScreenWidget = SizedBox();
//   @override
//   Widget build(BuildContext context) {
//     return FloatingDraggableWidget(
//       floatingWidgetHeight: widgetSize,
//       floatingWidgetWidth: widgetSize,
//       //mainScreenWidget: mainScreenWidget,
//       mainScreenWidget: widget.mainW, //mainScreenWidget,
//       floatingWidget: [
//         _myFloatingWidget(),
//         _myFloatingWidget(),
//       ],
//     );
//   }

//   Widget _myFloatingWidget() {
//     return ValueListenableBuilder(
//       valueListenable: widget.notifier,
//       builder: (context, value, child) {
//         return RotatedBox(
//           quarterTurns: currentRotation,
//           child: Stack(
//             children: [
//               Container(
//                 margin: const EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                 ),
//                 child: Container(
//                   margin: const EdgeInsets.all(15),
//                   height: 50,
//                   width: 150,
//                   child: TextField(
//                     maxLines: 20,
//                     style: value.textStyle.copyWith(color: value.color),
//                     controller: widget.controller,
//                     focusNode: widget.focusNode,
//                     onTap: () {
//                       widget.setActive(widget);
//                     },
//                   ),
//                 ),
//               ),
//               TapRegion(
//                 child: GestureDetector(
//                   behavior: HitTestBehavior.opaque,
//                   onTap: rotate,
//                   child: const CircleAvatar(
//                     radius: 15,
//                     child: Icon(Icons.crop_rotate),
//                   ),
//                 ),
//               ),
//               const Align(
//                 alignment: Alignment.topRight,
//                 child: CircleAvatar(
//                   radius: 15,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   rotate() {
//     currentRotation += 1;
//     setState(() {});
//   }
// }
