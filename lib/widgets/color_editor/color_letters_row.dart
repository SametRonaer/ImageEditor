import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorLettersRow extends StatelessWidget {
  const ColorLettersRow({super.key, required this.currentColor});
  final ValueNotifier<HSVColor> currentColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getColorLetter(Colors.lightBlue),
          _getColorLetter(Colors.blue),
          _getColorLetter(Colors.green),
          _getColorLetter(Colors.yellow),
          _getColorLetter(Colors.orange),
          _getColorLetter(Colors.red),
          _getColorLetter(Colors.pink),
          _getColorLetter(Colors.purple),
        ],
      ),
    );
  }

  Widget _getColorLetter(Color color) {
    return GestureDetector(
        onTap: () {
          currentColor.value = HSVColor.fromColor(color);
          currentColor.notifyListeners();
        },
        child: Text(
          "Aa",
          style: GoogleFonts.figtree(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ));
  }
}
