import 'package:bytebank/shared/models/transactionModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionModel model;
  const TransactionWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: InkWell(
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              _campos(model: model),
            ])
          ]),
    )));
  }
}

// ignore: camel_case_types
class _campos extends StatelessWidget {
  final TransactionModel model;
  const _campos({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(
                Icons.monetization_on_rounded,
                color: Colors.white,
                size: 50,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    model.contact.name,
                    style: GoogleFonts.robotoMono(
                        fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Account Number: ${model.contact.accountNumber}',
                    style: GoogleFonts.robotoMono(
                        fontSize: 20, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Value: ${model.value}',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 239, 232, 232))),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
