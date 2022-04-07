import 'dart:convert';

import 'package:bytebank/Api/TransactionsInterception.dart';
import 'package:bytebank/shared/models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import '../../shared/models/contactModel.dart';

class TransactionController {
  Client client =
      InterceptedClient.build(interceptors: [TransactionInterceptor()]);

  final transactionsNotifier =
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
    //faz a REQUEST dos dados atraves do GET
    try {
      //precisa passar a URI do ENDPOINT
      //pode se passar HEADERS tambem igualmente ao POST
      //  NAO POSSUI BODY
      final response = await client
          .get(Uri.parse("http://192.168.15.26:8080/transactions"))
          .timeout(const Duration(seconds: 5));

      //cria uma lista de MAP da resposta do GET
      //map e igualmente um JSON de CHAVE VALOR 0
      final List<Map<String, dynamic>> decodedJson = jsonDecode(response.body);

      //lista de TRANSASCTIONS
      List<TransactionModel> listTransactions = <TransactionModel>[];

      //para cada ITEM do MAP que foi criada apartir do JSON
      for (Map<String, dynamic> transactionJson in decodedJson) {
        //pega o contact dentro do JSON por meio da KEY dele dentro do dado que
        //esta rodando o MAP
        final Map<String, dynamic> contactJson = transactionJson['contact'];

        //cria uma nova transaction a partir do MAP atual
        //pegando os valores por KEY/CHAVE
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
        //adiciona na lista de transactions
        listTransactions.add(transaction);
      }
      //adiciona no NOTIFIER
      transactions = listTransactions;
    } catch (e) {
      print(e);
    }
  }
}
