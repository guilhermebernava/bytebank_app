import 'package:bytebank/database/database.dart';
import 'package:bytebank/shared/models/contactModel.dart';
import 'package:flutter/cupertino.dart';

class CreateContractController {
  final formKey = GlobalKey<FormState>();
  final dbContext = DbContext();

  String? validateNull(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  void redirectToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }

  Future<bool> create(BuildContext context, ContactModel model) async {
    final form = formKey.currentState;

    if (form!.validate()) {
      await dbContext.save(model);
      return true;
    }
    return false;
  }
}
