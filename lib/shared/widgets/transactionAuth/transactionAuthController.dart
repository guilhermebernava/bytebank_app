import 'package:flutter/material.dart';

class TransactionAuthController {
  final formKey = GlobalKey<FormState>();

  String? validateNull(String? value) =>
      value?.isEmpty ?? true ? "Auth Can't be null" : null;

  bool create(BuildContext context) {
    final form = formKey.currentState;

    if (form!.validate()) {
      return true;
    }
    return false;
  }
}
