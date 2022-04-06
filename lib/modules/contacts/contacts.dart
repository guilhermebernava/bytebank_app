import 'package:bytebank/modules/contactModal/contactModalController.dart';
import 'package:bytebank/modules/contacts/contactsController.dart';
import 'package:bytebank/shared/widgets/contactWidget/contactWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/models/contactModel.dart';
import '../../shared/widgets/inputForm/inputForm.dart';

class Contacts extends StatefulWidget {
  Contacts({Key? key}) : super(key: key);
  final controller = ContactsController();

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final controller = ContactModalController();

  final nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).primaryColor,
        title: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                onPressed: () => widget.controller.redirectToHome(context),
              ),
              const Text("Contacts"),
              IconButton(
                  onPressed: () {
                    widget.controller.getContracts();
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          Container(
            width: double.infinity,
            height: 40,
            color: Colors.white,
            child: Center(
              child: TextField(
                onSubmitted: (value) {
                  widget.controller.getContactByName(nomeController.text);
                },
                controller: nomeController,
                decoration: const InputDecoration(
                  hintText: 'Search for something',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          //vai ser o WIDGET que vai ficar ouvindo algum dado, e quando
          //ele alterar ele vai BUILDAR automaticamente os dados.
          child: ValueListenableBuilder<List<ContactModel>>(
              //dado que vai ser OUVIDO para ele fazer essa mudança.
              valueListenable: widget.controller.contactsNotifier,
              // o primeiro parametro é o CONTEXT
              // segundo parametro e o GET do dado sendo ouvindo 'VALUE NOTIFIER'
              // o return desse BUILDER e o WIDGET em si.
              //lembrando que o DADO ouvindo pode ser feito para renderizar os WIDGETS
              builder: (_, contacts, __) => Column(
                    children: contacts
                        .map((e) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: ContactWidget(model: e),
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
