import 'package:bytebank/modules/splash/splashController.dart';
import 'package:bytebank/shared/theme/appColor.dart';
import 'package:bytebank/shared/theme/appImages.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final controller = SplashController();
  @override
  Widget build(BuildContext context) {
    controller.redirect(context);
    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 2, 0, 0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset(
                AppImages.bytebankLogo,
                height: 300,
              )),
          Text(
            "O melhor banco para a melhor pessoa",
            style: GoogleFonts.playfairDisplay(
              fontSize: 35,
              color: AppColor.greenLogo,
            ),
            textAlign: TextAlign.center,
          ),
        ]),
      ),
    );
  }
}
