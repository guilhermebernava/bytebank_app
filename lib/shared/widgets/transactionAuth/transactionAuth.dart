import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionAuth extends StatefulWidget {
  final Function(String password) onSend;
  const TransactionAuth({Key? key, required this.onSend}) : super(key: key);

  @override
  State<TransactionAuth> createState() => _TransactionAuthState();
}

class _TransactionAuthState extends State<TransactionAuth> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Authenticate",
        textAlign: TextAlign.center,
        style: GoogleFonts.roboto(fontSize: 25),
      ),
      content: TextField(
        controller: passwordController,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 4,
        decoration: const InputDecoration(border: OutlineInputBorder()),
        style: GoogleFonts.roboto(fontSize: 65, letterSpacing: 24),
        obscureText: true,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Cancel",
            style: GoogleFonts.roboto(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            await widget.onSend(passwordController.text);
            Navigator.pushReplacementNamed(context, "/transactions");
          },
          child: Text(
            "Confirm",
            style: GoogleFonts.roboto(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
