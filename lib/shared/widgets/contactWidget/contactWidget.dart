import 'package:bytebank/shared/models/contactModel.dart';
import 'package:bytebank/shared/widgets/contactWidget/contactWidgetController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactWidget extends StatefulWidget {
  final ContactModel model;

  const ContactWidget({Key? key, required this.model}) : super(key: key);

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
  bool teste = true;

  final controller = ContactWidgetController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => controller.redirectToModal(context, widget.model),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                  color: Color.fromRGBO(0, 2, 0, 0.5),
                  spreadRadius: 0.3,
                  blurRadius: 5,
                  offset: Offset(0, 0), // changes position of shadow
                ),
              ],
              color: const Color.fromARGB(255, 246, 116, 2),
              border: Border.all(
                color: const Color.fromARGB(255, 241, 167, 71),
                style: BorderStyle.solid,
                width: 1.25,
              )),
          width: double.maxFinite,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _campos(model: widget.model),
                      PopupMenuButton(
                          onSelected: (value) => {
                                value == 0
                                    ? controller.redirectToCreateTransaction(
                                        context, widget.model)
                                    : null
                              },
                          icon: const Icon(
                            Icons.more_vert_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                          color: Colors.white,
                          itemBuilder: (context) => <PopupMenuEntry>[
                                PopupMenuItem(
                                  //precisa colocar para identificar o button
                                  value: 0,
                                  key: UniqueKey(),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const Icon(Icons.monetization_on_rounded),
                                      const Text("Add Transactions"),
                                    ],
                                  ),
                                )
                              ])
                    ])
              ]),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class _campos extends StatelessWidget {
  final ContactModel model;
  const _campos({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            model.name,
            style: GoogleFonts.robotoMono(fontSize: 20, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Account Number: ${model.accountNumber}',
            style: GoogleFonts.robotoMono(fontSize: 20, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('Telephone: ${model.telephone}',
              style: GoogleFonts.roboto(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 239, 232, 232))),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text('Age: ${model.age.toString()}',
              style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 239, 232, 232))),
        ),
      ],
    );
  }
}
