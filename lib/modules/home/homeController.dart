import 'package:flutter/cupertino.dart';

class HomeController {
  void redirectToCreateContact(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/createContact");
  }

  void redirectToContacts(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/contacts");
  }
}
