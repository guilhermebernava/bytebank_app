import 'package:bytebank/shared/widgets/transactionAuth/transactionAuthController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionAuth extends StatefulWidget {
  final Function(String password) onSend;
  TransactionAuth({Key? key, required this.onSend}) : super(key: key);

  final controller = TransactionAuthController();

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
      content: Form(
        key: widget.controller.formKey,
        child: TextFormField(
          controller: passwordController,
          validator: widget.controller.validateNull,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          maxLength: 4,
          decoration: const InputDecoration(border: OutlineInputBorder()),
          style: GoogleFonts.roboto(fontSize: 65, letterSpacing: 24),
          obscureText: true,
        ),
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
            final res = widget.controller.create(context);
            if (res == false) {
              return;
            }
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
