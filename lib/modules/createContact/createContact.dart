import 'package:animated_card/animated_card.dart';
import 'package:bytebank/modules/createContact/createContactController.dart';
import 'package:bytebank/shared/customAlerts/customAlerts.dart';
import 'package:bytebank/shared/models/contactModel.dart';
import 'package:bytebank/shared/theme/appColor.dart';
import 'package:bytebank/shared/widgets/commonButton/commonButton.dart';
import 'package:bytebank/shared/widgets/inputForm/inputForm.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateContact extends StatefulWidget {
  CreateContact({Key? key}) : super(key: key);

  final alerts = customAlerts();

  @override
  State<CreateContact> createState() => _CreateContactState();
}

class _CreateContactState extends State<CreateContact> {
  final nomeController = TextEditingController();
  final accountController = TextEditingController();
  final idadeController = TextEditingController();
  final numeroController = TextEditingController();

  final controller = CreateContractController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
          onPressed: () => controller.redirectToHome(context),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: const EdgeInsets.only(left: 57.0),
          child: Text("Create Contact",
              textAlign: TextAlign.center,
              style: GoogleFonts.roboto(fontSize: 22)),
        ),
      ),
      backgroundColor: AppColor.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: controller.formKey,
              child: Column(children: [
                InputForm(
                  keyboardType: TextInputType.name,
                  validator: controller.validateNull,
                  controller: nomeController,
                  icon: Icons.person,
                  placeholder: "Name of Contact",
                ),
                InputForm(
                  keyboardType: TextInputType.datetime,
                  validator: controller.validateNull,
                  controller: accountController,
                  icon: Icons.numbers,
                  placeholder: "Account Number",
                ),
                InputForm(
                  keyboardType: TextInputType.number,
                  validator: controller.validateNull,
                  controller: idadeController,
                  icon: Icons.date_range_rounded,
                  placeholder: "Age of Contact",
                ),
                InputForm(
                  keyboardType: TextInputType.number,
                  validator: controller.validateNull,
                  controller: numeroController,
                  icon: Icons.aod_rounded,
                  placeholder: "Contact Number",
                ),
              ]),
            ),
            AnimatedCard(
              direction: AnimatedCardDirection.left,
              curve: Curves.easeInOutBack,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CommonButton(
                        onPressed: () => controller.redirectToHome(context),
                        text: "Cancel",
                        color: Colors.red,
                        textColor: Colors.white),
                    CommonButton(
                        onPressed: () async {
                          final response = await controller.create(
                              context,
                              ContactModel(
                                  id: 0,
                                  name: nomeController.text,
                                  accountNumber:
                                      int.tryParse(accountController.text)!,
                                  telephone: numeroController.text,
                                  age: int.tryParse(idadeController.text)!));

                          if (response == false) {
                            await widget.alerts.warningAlert(context);
                            return;
                          }

                          await widget.alerts.sucessAlert(context);
                          controller.redirectToHome(context);
                        },
                        text: "Register",
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white),
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
