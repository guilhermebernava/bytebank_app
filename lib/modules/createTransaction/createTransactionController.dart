import 'dart:convert';

import 'package:bytebank/Api/TransactionsInterception.dart';
import 'package:bytebank/database/Daos/ContactDao.dart';
import 'package:bytebank/shared/models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

class CreateTransactionController {
  final formKey = GlobalKey<FormState>();
  final contactDao = ContactDao();
  Client client =
      InterceptedClient.build(interceptors: [TransactionInterceptor()]);

  String? validateNull(String? value) =>
      value?.isEmpty ?? true ? "Value Can't be null" : null;

  void redirectToContacts(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/contacts");
  }

  Future<void> save(double value, int accountNumber, BuildContext context,
      String password) async {
    //primeiro encontra a conta no banco de dados e pega o primeiro dado que tiver
    final contacts = await contactDao.findByAccountNumber(accountNumber);
    final contact = contacts[0];

    //cria uma transaction
    final transaction = TransactionModel(value: value, contact: contact);
    try {
      //faz a requesta na API, passando a URI dela, BODY, e os HEADERS
      await client.post(
        //link do ENDPOINT
        Uri.parse("http://192.168.15.26:8080/transactions"),
        //corpo da request, basicamente o que vai ser enviado para o backend
        //lembrando que tem que ser CHAVE VALOR - JSON
        body: jsonEncode(<String, dynamic>{
          'value': transaction.value.toString(),
          "contact": {
            "name": contact.name,
            "accountNumber": contact.accountNumber
          },
        }),
        //HEADERS e onde vai ir informacoes de AUTHORIZE e coisas asssim
        //que a API requisitar quando fazer alguma request.
        headers: <String, String>{
          'Content-type': 'application/json',
          'password': password
        },
      ).timeout(const Duration(seconds: 2));

      Navigator.pushReplacementNamed(context, "/transactions");
    } catch (e) {
      print(e);
    }
  }

  bool create() {
    final form = formKey.currentState;

    if (form!.validate()) {
      return true;
    }
    return false;
  }
}
