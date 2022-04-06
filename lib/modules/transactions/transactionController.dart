import 'dart:convert';

import 'package:bytebank/shared/models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../shared/models/contactModel.dart';

class TransactionController {
  late final transactionsNotifier =
      ValueNotifier<List<TransactionModel>>(<TransactionModel>[]);
  List<TransactionModel> get transactions => transactionsNotifier.value;
  set transactions(List<TransactionModel> value) =>
      transactionsNotifier.value = value;

  void redirectToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }

  TransactionController() {
    getTransactions();
  }

  Future<void> getTransactions() async {
    //faz o GET dos dados
    final response =
        await get(Uri.parse("http://192.168.15.26:8080/transactions"));

    //transforma o JSON em MAP
    final List<dynamic> decodedJson = jsonDecode(response.body);

    //lista de TRANSASCTIONS
    List<TransactionModel> listTransactions = <TransactionModel>[];

    //para cada ITEM do MAP que foi criada apartir do JSON
    for (Map<String, dynamic> transactionJson in decodedJson) {
      //pega o contact dentro do JSON
      final Map<String, dynamic> contactJson = transactionJson['contact'];

      //cria uma nova com o MAP
      final TransactionModel transaction = TransactionModel(
        value: transactionJson['value'],
        contact: ContactModel(
          id: 0,
          name: contactJson['name'],
          accountNumber: contactJson['accountNumber'],
          age: 0,
          telephone: "",
        ),
      );
      listTransactions.add(transaction);
    }
    transactions = listTransactions;
  }
}
