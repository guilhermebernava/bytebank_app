import 'package:animated_card/animated_card.dart';
import 'package:bytebank/modules/transactions/transactionController.dart';
import 'package:bytebank/shared/models/transactionModel.dart';
import 'package:bytebank/shared/widgets/transactionWidget/transactionWidget.dart';
import 'package:flutter/material.dart';

class Transactions extends StatefulWidget {
  Transactions({Key? key}) : super(key: key);

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    final controller = TransactionController(context);

    return Scaffold(
      appBar: AppBar(
        leading:
            BackButton(onPressed: () => controller.redirectToHome(context)),
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
          child: ValueListenableBuilder<List<TransactionModel>>(
              //dado que vai ser OUVIDO para ele fazer essa mudança.
              valueListenable: controller.transactionsNotifier,
              // o primeiro parametro é o CONTEXT
              // segundo parametro e o GET do dado sendo ouvindo 'VALUE NOTIFIER'
              // o return desse BUILDER e o WIDGET em si.
              //lembrando que o DADO ouvindo pode ser feito para renderizar os WIDGETS
              builder: (_, contacts, __) => Column(
                    children: contacts
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: AnimatedCard(
                                  direction: AnimatedCardDirection.left,
                                  curve: Curves.fastOutSlowIn,
                                  child: TransactionWidget(model: e)),
                            ))
                        .toList()
                        .reversed
                        .toList(),
                  )),
        ),
      ),
    );
  }
}
