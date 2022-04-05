import 'package:bytebank/shared/theme/appImages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/theme/appColor.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Home",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: 25,
              color: AppColor.background,
            ),
          ),
        ),
        backgroundColor: AppColor.greenLogo,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AppImages.bytebankLogo),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, right: 225),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: 150,
              color: AppColor.greenLogo,
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.0),
                    child: Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const Text(
                    "Contatos",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
