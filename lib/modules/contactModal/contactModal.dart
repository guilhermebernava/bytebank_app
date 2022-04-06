import 'package:bytebank/modules/contactModal/contactModalController.dart';
import 'package:bytebank/shared/customAlerts/customAlerts.dart';
import 'package:bytebank/shared/models/contactModel.dart';
import 'package:bytebank/shared/widgets/commonButton/commonButton.dart';
import 'package:flutter/material.dart';

import '../../shared/widgets/inputForm/inputForm.dart';

class ContactModal extends StatefulWidget {
  final ContactModel model;

  ContactModal({
    Key? key,
    required this.model,
  }) : super(key: key);

  final alerts = customAlerts();

  @override
  State<ContactModal> createState() => _ContactModalState();
}

class _ContactModalState extends State<ContactModal> {
  final controller = ContactModalController();

  final nomeController = TextEditingController();
  final idadeController = TextEditingController();
  final numeroController = TextEditingController();

  @override
  void initState() {
    nomeController.text = widget.model.name;
    idadeController.text = widget.model.age.toString();
    numeroController.text = widget.model.telephone;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.model.name),
        backgroundColor: Theme.of(context).primaryColor,
        leading: BackButton(
            onPressed: (() =>
                Navigator.pushReplacementNamed(context, "/contacts"))),
      ),
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
            Padding(
              padding: const EdgeInsets.only(bottom: 100.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CommonButton(
                      onPressed: () async {
                        await controller.delete(context, widget.model);
                      },
                      text: "Delete",
                      color: Colors.red,
                      textColor: Colors.white),
                  CommonButton(
                      onPressed: () async {
                        await controller.update(
                            context,
                            ContactModel(
                                id: widget.model.id,
                                name: nomeController.text,
                                telephone: numeroController.text,
                                age: int.tryParse(idadeController.text)!));
                      },
                      text: "Save",
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
