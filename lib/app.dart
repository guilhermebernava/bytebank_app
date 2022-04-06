import 'package:bytebank/modules/contactModal/contactModal.dart';
import 'package:bytebank/modules/createContact/createContact.dart';
import 'package:bytebank/modules/createTransaction/createTransaction.dart';
import 'package:bytebank/modules/home/home_page.dart';
import 'package:bytebank/modules/splash/splash_page.dart';
import 'package:bytebank/modules/transactions/transactions.dart';
import 'package:bytebank/shared/models/contactModel.dart';
import 'package:flutter/material.dart';

import 'modules/contacts/contacts.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      title: "Byte Bank",
      initialRoute: "/splash",
      routes: {
        "/home": (context) => Home(),
        "/splash": (context) => SplashPage(),
        "/createContact": (context) => CreateContact(),
        "/contacts": (context) => Contacts(),
        "/contactModal": ((context) => ContactModal(
              model: ModalRoute.of(context)!.settings.arguments as ContactModel,
            )),
        "/createTransaction": (context) => CreateTransaction(
              model: ModalRoute.of(context)!.settings.arguments as ContactModel,
            ),
        "/transactions": (context) => Transactions(),
      },
    );
  }
}
