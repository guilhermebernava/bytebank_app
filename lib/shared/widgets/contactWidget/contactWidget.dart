import 'package:bytebank/shared/models/contactModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactWidget extends StatelessWidget {
  final ContactModel model;
  const ContactWidget({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          color: Color.fromARGB(255, 246, 116, 2),
          border: Border.all(
            color: const Color.fromARGB(255, 241, 167, 71),
            style: BorderStyle.solid,
            width: 1.25,
          )),
      width: double.maxFinite,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          model.name,
          style: GoogleFonts.robotoMono(fontSize: 20, color: Colors.white),
        ),
        subtitle: Text(model.age.toString(),
            style: GoogleFonts.poppins(
                fontSize: 14, color: const Color.fromARGB(255, 239, 232, 232))),
        trailing: Text(model.telephone,
            style: GoogleFonts.roboto(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
