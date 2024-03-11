import 'package:drag_training/widgets/color_editor/color_circles_row.dart';
import 'package:drag_training/widgets/color_editor/color_hex_input.dart';
import 'package:drag_training/widgets/color_editor/color_letters_row.dart';
import 'package:flutter/material.dart';

import '../../model/text_area_config.dart';
import 'alpha_slider_widget.dart';
import 'hue_slider_widget.dart';
import 'lightness_slider_widget.dart';

class ColorEditorWidget extends StatelessWidget {
  ColorEditorWidget({
    super.key,
    required this.notifier,
    required this.setEditMode,
  });
  final ValueNotifier<TextAreaConfig?> notifier;
  final ValueSetter<bool?> setEditMode;
  final FocusNode _hexInputFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<HSVColor> currentColor = ValueNotifier(
        HSVColor.fromColor(notifier.value?.color ?? Colors.black));

    notifier.addListener(() {
      if (currentColor.value ==
          HSVColor.fromColor(notifier.value?.color ?? Colors.black)) {
        return;
      }
      currentColor.value =
          HSVColor.fromColor(notifier.value?.color ?? Colors.black);
      currentColor.notifyListeners();
    });

    currentColor.addListener(
      () {
        notifier.value?.color = currentColor.value.toColor();
        notifier.notifyListeners();
      },
    );
    return GestureDetector(
      onTap: () {
        if (_hexInputFocusNode.hasFocus) {
          _hexInputFocusNode.unfocus();
        }
      },
      child: Container(
        height: 320,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(
          bottom: 10,
          left: 10,
          right: 10,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setEditMode(false);
                  },
                  child: const Icon(Icons.font_download),
                ),
                const Text("Font Color"),
                GestureDetector(
                  onTap: () {
                    setEditMode(null);
                  },
                  child: const Icon(Icons.arrow_downward_rounded),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ColorCirclesRow(currentColor: currentColor),
            const SizedBox(height: 10),
            ColorLettersRow(currentColor: currentColor),
            AlphaSliderWidget(currentColor: currentColor),
            LightnessSliderWidget(currentColor: currentColor),
            HueSliderWidget(currentColor: currentColor),
            const SizedBox(height: 4),
            ColorHexInput(
              currentColor: currentColor,
              focusNode: _hexInputFocusNode,
            ),
          ],
        ),
      ),
    );
  }
}
