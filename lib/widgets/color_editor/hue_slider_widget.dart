import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class HueSliderWidget extends StatelessWidget {
  const HueSliderWidget({
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
            TrackType.hue,
            currentColor.value,
            (HSVColor color) {
              currentColor.value = color;
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
