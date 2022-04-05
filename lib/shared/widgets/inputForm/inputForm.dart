import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputForm extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validator;

  const InputForm({
    Key? key,
    required this.icon,
    required this.placeholder,
    required this.controller,
    required this.validator,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextFormField(
                controller: controller,
                validator: validator,
                keyboardType: keyboardType,
                style: GoogleFonts.roboto(fontSize: 25),
                decoration: InputDecoration(
                    labelText: placeholder,
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.zero,
                    labelStyle: GoogleFonts.roboto(fontSize: 17),
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Icon(
                              icon,
                              size: 35,
                            )),
                        Container(
                          width: 1,
                          height: 48,
                          color: Colors.grey,
                        )
                      ],
                    ))),
            const Divider(
              height: 1,
              thickness: 1,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
