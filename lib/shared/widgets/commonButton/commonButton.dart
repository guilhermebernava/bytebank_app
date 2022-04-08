import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonButton extends StatefulWidget {
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
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  bool disable = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: widget.color, fixedSize: const Size(150, 60)),
        onPressed: disable
            ? null
            : () async {
                setState(() {
                  disable = true;
                });
                widget.onPressed();
              },
        child: Text(
          widget.text,
          style: GoogleFonts.roboto(fontSize: 25, color: widget.textColor),
        ));
  }
}
