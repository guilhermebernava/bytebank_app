import 'package:bytebank/database/Daos/ContactDao.dart';
import 'package:bytebank/shared/customAlerts/customAlerts.dart';
import 'package:bytebank/shared/models/contactModel.dart';
import 'package:flutter/material.dart';

class ContactModalController {
  final formKey = GlobalKey<FormState>();
  final contactDao = ContactDao();
  final alerts = customAlerts();

  String? validateNull(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  void redirectToContacts(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/contacts");
  }

  Future<void> delete(BuildContext context, ContactModel model) async {
    await contactDao.delete(model);
    await alerts.sucessAlert(context);
    redirectToContacts(context);
  }

  Future<void> update(BuildContext context, ContactModel model) async {
    final form = formKey.currentState;

    if (form!.validate()) {
      await contactDao.update(model);
      await alerts.sucessAlert(context);
      redirectToContacts(context);
      return;
    }

    alerts.warningAlert(context);
  }
}
