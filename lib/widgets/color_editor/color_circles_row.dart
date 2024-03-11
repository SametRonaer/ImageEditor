import 'package:flutter/material.dart';

class ColorCirclesRow extends StatelessWidget {
  const ColorCirclesRow({super.key, required this.currentColor});
  final ValueNotifier<HSVColor> currentColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          getColorCircle(Colors.lightBlue),
          getColorCircle(Colors.blue),
          getColorCircle(Colors.green),
          getColorCircle(Colors.yellow),
          getColorCircle(Colors.orange),
          getColorCircle(Colors.red),
          getColorCircle(Colors.pink),
          getColorCircle(Colors.purple),
          getColorCircle(Colors.cyan),
          getColorCircle(Colors.blueGrey),
        ],
      ),
    );
  }

  Widget getColorCircle(Color color) {
    return GestureDetector(
      onTap: () {
        currentColor.value = HSVColor.fromColor(color);
        currentColor.notifyListeners();
      },
      child: CircleAvatar(
        radius: 12,
        backgroundColor: color,
      ),
    );
  }
}
