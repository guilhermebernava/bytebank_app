import 'package:animated_card/animated_card.dart';
import 'package:bytebank/modules/transactions/transactionController.dart';
import 'package:bytebank/shared/models/transactionModel.dart';
import 'package:bytebank/shared/widgets/loadingMessage/loadingMessage.dart';
import 'package:bytebank/shared/widgets/transactionWidget/transactionWidget.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  Transactions({Key? key}) : super(key: key);
  final controller = TransactionController();

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            onPressed: () => widget.controller.redirectToHome(context)),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(right: 60.0),
          child: Text("Transactions"),
        )),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(24.0),
            //vai ser o WIDGET que vai ficar ouvindo algum dado, e quando
            //ele alterar ele vai BUILDAR automaticamente os dados.
            child: FutureBuilder<List<TransactionModel>>(
              initialData: <TransactionModel>[],
              future: widget.controller.getTransactions(),
              builder: (_, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    break;
                  case ConnectionState.waiting:
                    const LoadingMessage();
                    break;
                  case ConnectionState.active:
                    // TODO: Handle this case.
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      final list = snapshot.data;
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          final TransactionModel transaction = list![index];
                          return Card(
                            child: ListTile(
                              leading: Icon(Icons.monetization_on),
                              title: Text(
                                transaction.value.toString(),
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: const Text(
                                "No transactions Found",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: list!.length,
                      );
                    }
                }
                return Text(
                  'No transactions found',
                );
              },
            )),
      ),
    );
  }
}
