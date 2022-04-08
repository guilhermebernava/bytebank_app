// ignore_for_file: camel_case_types

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/appColor.dart';

class customAlerts {
  Future<dynamic> warningAlert(BuildContext context) {
    return CoolAlert.show(
      context: context,
      onConfirmBtnTap: () {
        Navigator.pushReplacementNamed(context, "/contacts");
      },
      type: CoolAlertType.warning,
      title: "Ops...",
      text: "Something went wrong,\nTry Again Please!!",
      confirmBtnColor: const Color.fromARGB(255, 255, 255, 0),
      confirmBtnText: "Try Again",
      confirmBtnTextStyle: GoogleFonts.roboto(fontSize: 25),
      loopAnimation: false,
      animType: CoolAlertAnimType.scale,
      backgroundColor: AppColor.background,
    );
  }

  Future<dynamic> sucessAlert(BuildContext context) {
    return CoolAlert.show(
      context: context,
      onConfirmBtnTap: () {
        Navigator.pushReplacementNamed(context, "/contacts");
      },
      type: CoolAlertType.success,
      title: "Sucess",
      text: "The contact was saved sucessfully !!",
      confirmBtnColor: AppColor.greenLogo,
      loopAnimation: false,
      animType: CoolAlertAnimType.scale,
      backgroundColor: AppColor.background,
    );
  }

  Future<dynamic> errorAlert(BuildContext context, String message) {
    return CoolAlert.show(
      context: context,
      onConfirmBtnTap: () {
        Navigator.pushReplacementNamed(context, "/contacts");
      },
      type: CoolAlertType.error,
      title: "ERROR",
      text: message,
      confirmBtnColor: AppColor.greenLogo,
      loopAnimation: false,
      animType: CoolAlertAnimType.scale,
      backgroundColor: AppColor.background,
    );
  }
}
