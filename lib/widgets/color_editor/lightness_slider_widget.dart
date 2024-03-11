import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class LightnessSliderWidget extends StatelessWidget {
  const LightnessSliderWidget({
    super.key,
    required this.currentColor,
  });
  final ValueNotifier<HSVColor> currentColor;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: currentColor,
      builder: (context, value, child) {
        return SizedBox(
          height: 50,
          child: ColorPickerSlider(
            TrackType.lightness,
            currentColor.value,
            (HSVColor color) {
              HSVColor? editedColor;
              if (color.value == 1 || color.value == 0) {
                editedColor = value;
              }
              currentColor.value = editedColor ?? color;
              currentColor.notifyListeners();
            },
            displayThumbColor: true,
            fullThumbColor: true,
          ),
        );
      },
    );
  }
}
