import 'package:bytebank/modules/home/homeController.dart';
import 'package:bytebank/shared/theme/appImages.dart';
import 'package:bytebank/shared/widgets/homeButton/homeButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../shared/theme/appColor.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final controller = HomeController();

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
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(AppImages.bytebankLogo),
            ),
            Row(
              children: [
                HomeButton(
                    redirectFunction: () =>
                        controller.redirectToCreateContact(context),
                    name: "Create Contact",
                    icon: Icons.person_add),
                HomeButton(
                    redirectFunction: () =>
                        controller.redirectToContacts(context),
                    name: "Contacts",
                    icon: Icons.people),
              ],
            )
          ],
        ),
      ),
    );
  }
}
