import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;

  const CommonButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: color, fixedSize: const Size(150, 60)),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.roboto(fontSize: 25, color: textColor),
        ));
  }
}
