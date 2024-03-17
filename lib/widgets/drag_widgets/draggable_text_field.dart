import 'package:drag_training/model/text_area_config.dart';
import 'package:drag_training/services/drag_area_service.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DraggableTextField extends StatelessWidget {
  DraggableTextField({
    super.key,
    required this.config,
  }) {
    DragAreaService.shared.activeAreaConfig.addListener(() async {
      if (DragAreaService.shared.activeAreaConfig.value == null) {
        config.value.isActive = false;
        config.notifyListeners();
      }
      if (DragAreaService.shared.activeAreaConfig.value?.id ==
          config.value.id) {
        if (!config.value.focusNode.hasFocus && !config.value.isActive) {
          config.value.focusNode.requestFocus();
        }
        config.value.isActive = true;
        config.notifyListeners();
      } else if (config.value.isActive) {
        config.value.isActive = false;
        print("inini");
        config.notifyListeners();
        if (config.value.focusNode.hasFocus &&
            DragAreaService.shared.activeAreaConfig.value == null) {
          config.value.focusNode.unfocus();
        }
      }
    });
  }

  ValueNotifier<TextAreaConfig> config;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: config,
      builder: (context, value, child) {
        textEditingController.text = value.text ?? "";
        return Positioned(
          top: config.value.top,
          left: config.value.left,
          child: GestureDetector(
            onTap: () {
              //Not triggered
              if (value.isActive) {
                // activeTextField.value = this;
                // activeTextField.notifyListeners();
              }
            },
            onVerticalDragStart: (details) {
              // activeTextField.value = this;
              // activeTextField.notifyListeners();
            },
            onVerticalDragUpdate: (details) {
              config.value.top = details.globalPosition.dy - 130;
              config.value.left = details.globalPosition.dx - 30;
              config.notifyListeners();
            },
            onHorizontalDragStart: (details) {
              // activeTextField.value = this;
              // activeTextField.notifyListeners();
            },
            onHorizontalDragUpdate: (details) {
              config.value.top = details.globalPosition.dy - 130;
              config.value.left = details.globalPosition.dx - 30;
              config.notifyListeners();
            },
            child: _getTextFieldArea(),
            // child: Container(
            //   height: 100,
            //   width: 100,
            //   color: value.isActive ? Colors.black : Colors.deepOrange,
            // ),
          ),
        );
      },
    );
  }

  Widget _getTextFieldArea() {
    textEditingController.addListener(
      () {
        config.value.text = textEditingController.text;
      },
    );

    return ValueListenableBuilder(
      valueListenable: config.value.rotateAmount!,
      builder: (context, value, child) {
        return RotationTransition(
          turns: AlwaysStoppedAnimation(value / 360),
          child: Stack(
            alignment: Alignment.center,
            children: [
              _getTextArea(),
              _getBorder(),
            ],
          ),
        );
      },
    );
  }

  Container _getTextArea() {
    textEditingController.selection =
        TextSelection.collapsed(offset: textEditingController.text.length);
    return Container(
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      height: config.value.heigth,
      width: config.value.width,
      child: TextField(
        decoration: const InputDecoration.collapsed(
          hintText: "",
          border: InputBorder.none,
        ),
        focusNode: config.value.focusNode,
        maxLines: 20,
        style: config.value.textStyle.copyWith(
          color: config.value.color,
        ),
        controller: textEditingController,
        onTap: () {},
        onChanged: (value) {
          detectNumberOfLines(value);
        },
      ),
    );
  }

  updateTextAreaHeight({bool increase = true}) {
    double scaleAmount = 10;
    if (increase) {
      config.value.heigth += scaleAmount;
    } else {
      config.value.heigth -= scaleAmount;
    }
    config.notifyListeners();
  }

  Widget _getBorder() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: config.value.isActive
                ? Border.all(color: Colors.grey.shade500)
                : null,
          ),
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          height: config.value.heigth + 10,
          width: config.value.width + 10,
        ),
        GestureDetector(
          onTap: () {
            DragAreaService.shared.setActiveAreaConfig(config.value);
          },
          child: Container(
            color: Colors.transparent,
            height: config.value.heigth + 25,
            width: config.value.width + 25,
            child: config.value.isActive
                ? Stack(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: () {
                            DragAreaService.shared.addCopyOfItem();
                          },
                          child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.copy,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: GestureDetector(
                          onTap: () {
                            config.value.rotateAmount!.value += 5;
                            config.notifyListeners();
                          },
                          child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.rotate_right,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onPanUpdate: (details) {
                            print("Pan update");
                          },
                          child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.scale,
                              color: Colors.black,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            DragAreaService.shared.removeItem();
                          },
                          child: const CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : null,
          ),
        ),
      ],
    );
  }

  int linesCount = 1;

  void detectNumberOfLines(String value) {
    final span = TextSpan(text: value, style: config.value.textStyle);
    final tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout(maxWidth: config.value.width - 22);
    final numLines = tp.computeLineMetrics().length;
    if (linesCount != numLines) {
      linesCount = numLines;
      updateTextAreaHeight();
    }
    //   if (linesCount < numLines) {
    //   linesCount = numLines;
    //   updateTextAreaHeight();
    // } else if (linesCount > numLines) {
    //   updateTextAreaHeight(increase: false);
    // }
    print("Numlines are $numLines");
  }
}
