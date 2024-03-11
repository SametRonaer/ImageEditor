import 'package:flutter/material.dart';

class ColorHexInput extends StatelessWidget {
  ColorHexInput({
    super.key,
    required this.currentColor,
    required this.focusNode,
  });

  final ValueNotifier<HSVColor> currentColor;
  final FocusNode focusNode;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            "HEX",
            style: TextStyle(
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade200),
              ),
              height: 30,
              alignment: Alignment.center,
              child: ValueListenableBuilder(
                valueListenable: currentColor,
                builder: (context, value, child) {
                  _setHexValueOfColor(value);
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    onEditingComplete: () {
                      focusNode.unfocus();
                      _getColorFromHex();
                    },
                    onSubmitted: (value) {
                      focusNode.unfocus();
                      _getColorFromHex();
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  _setHexValueOfColor(HSVColor color) {
    controller.text = color.toColor().value.toRadixString(16);
  }

  _getColorFromHex() {
    String hexColor = controller.text;
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    int? colorValue = int.tryParse(hexColor, radix: 16);
    if (colorValue != null) {
      HSVColor color = HSVColor.fromColor(Color(colorValue));
      currentColor.value = color;
      currentColor.notifyListeners();
    }
  }
}
