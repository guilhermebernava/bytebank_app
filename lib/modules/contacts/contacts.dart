import 'package:bytebank/modules/contacts/contactsController.dart';
import 'package:bytebank/shared/widgets/contactWidget/contactWidget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/models/contactModel.dart';

class Contacts extends StatefulWidget {
  Contacts({Key? key}) : super(key: key);
  final controller = ContactsController();

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 85.0),
          child: Text("Contacts",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 22)),
        ),
        leading: BackButton(onPressed: () {
          Navigator.pushReplacementNamed(context, "/home");
        }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ValueListenableBuilder<List<ContactModel>>(
              valueListenable: widget.controller.contactsNotifier,
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
