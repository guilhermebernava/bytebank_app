import 'package:bytebank/shared/models/contactModel.dart';
import 'package:flutter/cupertino.dart';

class ContactWidgetController {
  void redirectToModal(BuildContext context, ContactModel model) {
    Navigator.pushReplacementNamed(context, "/contactModal", arguments: model);
  }

  void redirectToCreateTransaction(BuildContext context, ContactModel model) {
    Navigator.pushReplacementNamed(context, "/createTransaction",
        arguments: model);
  }
}
