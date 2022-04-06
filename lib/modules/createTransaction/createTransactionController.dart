import 'dart:convert';

import 'package:bytebank/database/Daos/ContactDao.dart';
import 'package:bytebank/shared/models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class CreateTransactionController {
  final formKey = GlobalKey<FormState>();
  final contactDao = ContactDao();

  String? validateNull(String? value) =>
      value?.isEmpty ?? true ? "O nome não pode ser vazio" : null;

  void redirectToContacts(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/contacts");
  }

  Future<void> create(
      double value, int accountNumber, BuildContext context) async {
    final contacts = await contactDao.findByAccountNumber(accountNumber);
    final contact = contacts[0];

    final transaction = TransactionModel(value: value, contact: contact);

    await post(
      Uri.parse("http://192.168.15.26:8080/transactions"),
      body: jsonEncode(<String, dynamic>{
        'value': transaction.value.toString(),
        "contact": {
          "name": contact.name,
          "accountNumber": contact.accountNumber
        },
      }),
      headers: <String, String>{
        'Content-type': 'application/json',
        'password': '1000'
      },
    );
    Navigator.pushReplacementNamed(context, "/transactions");
  }
}
