import 'package:bytebank/modules/contactModal/contactModal.dart';
import 'package:bytebank/shared/models/contactModel.dart';
import 'package:flutter/cupertino.dart';

class ContactWidgetController {
  void redirectToModal(BuildContext context, ContactModel model) {
    Navigator.pushReplacementNamed(context, "/contactModal", arguments: model);
  }
}
