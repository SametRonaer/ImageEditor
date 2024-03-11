import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AlphaSliderWidget extends StatelessWidget {
  const AlphaSliderWidget({
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
            TrackType.alpha,
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
