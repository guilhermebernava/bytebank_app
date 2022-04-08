import 'package:animated_card/animated_card.dart';
import 'package:bytebank/modules/createTransaction/createTransactionController.dart';
import 'package:bytebank/shared/customAlerts/customAlerts.dart';
import 'package:bytebank/shared/models/contactModel.dart';
import 'package:bytebank/shared/widgets/commonButton/commonButton.dart';
import 'package:bytebank/shared/widgets/inputForm/inputForm.dart';
import 'package:bytebank/shared/widgets/loadingMessage/loadingMessage.dart';
import 'package:bytebank/shared/widgets/transactionAuth/transactionAuth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTransaction extends StatefulWidget {
  final ContactModel model;
  CreateTransaction({Key? key, required this.model}) : super(key: key);

  final controller = CreateTransactionController();
  final alerts = customAlerts();

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  final valueController = TextEditingController();
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            onPressed: () => widget.controller.redirectToContacts(context)),
        backgroundColor: Theme.of(context).primaryColor,
        title: const Center(
            child: Padding(
          padding: EdgeInsets.only(right: 60.0),
          child: Text("Transactions"),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: widget.controller.formKey,
              child: Column(children: [
                _Text(model: widget.model),
                InputForm(
                  keyboardType: TextInputType.datetime,
                  validator: widget.controller.validateNull,
                  controller: valueController,
                  icon: Icons.monetization_on_rounded,
                  placeholder: "Value",
                ),
              ]),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.bottom,
              curve: Curves.easeInOutBack,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AnimatedCard(
                      direction: AnimatedCardDirection.left,
                      curve: Curves.easeIn,
                      child: CommonButton(
                          onPressed: () =>
                              widget.controller.redirectToContacts(context),
                          text: "Cancel",
                          color: Colors.red,
                          textColor: Colors.white),
                    ),
                    AnimatedCard(
                      direction: AnimatedCardDirection.right,
                      curve: Curves.easeIn,
                      child: CommonButton(
                          onPressed: () async {
                            final res = widget.controller.create();
                            if (res == false) {
                              widget.alerts.warningAlert(context);
                              return;
                            }

                            //renderiza na tela algum WIDGET
                            showDialog(
                                //contexto do componente
                                context: context,
                                //function que o RETURN dela e um WIDGET que vai ser
                                //renderizado em tela
                                builder: (builder) =>

                                    //essa FUNCTION traz um CALLBACK que tem o valor de dentro do
                                    //widget e faz a gente ter acesso a ele
                                    TransactionAuth(onSend: (password) async {
                                      await widget.controller.save(
                                          double.tryParse(
                                              valueController.text)!,
                                          widget.model.accountNumber,
                                          context,
                                          password);
                                    }));
                          },
                          text: "Register",
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Text extends StatelessWidget {
  final ContactModel model;

  const _Text({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      curve: Curves.easeInOutBack,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
        child: Column(children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Icon(
                  Icons.account_balance,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
              Container(
                width: 1,
                height: 48,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Account Number: ${model.accountNumber}",
                    style: GoogleFonts.robotoMono(fontSize: 20)),
              ),
            ],
          ),
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          )
        ]),
      ),
    );
  }
}
