import 'package:bytebank/shared/models/contactModel.dart';
import 'package:flutter/cupertino.dart';
import '../../database/Daos/ContactDao.dart';

class CreateContractController {
  final formKey = GlobalKey<FormState>();
  final contactDao = ContactDao();

  String? validateNull(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  void redirectToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }

  Future<bool> create(BuildContext context, ContactModel model) async {
    final form = formKey.currentState;

    if (form!.validate()) {
      await contactDao.save(model);
      return true;
    }
    return false;
  }
}
