import 'package:flutter/material.dart';
import '../../database/Daos/ContactDao.dart';
import '../../shared/models/contactModel.dart';

class ContactsController {
  final contactDao = ContactDao();

  //tipo de variavel que vai ser ouvida
  final contactsNotifier = ValueNotifier<List<ContactModel>>(<ContactModel>[]);
  //GETTER do NOTIFIER
  List<ContactModel> get contacts => contactsNotifier.value;
  //SETTER do NOTIFIER
  set contacts(List<ContactModel> value) => contactsNotifier.value = value;

  ContactsController() {
    getContracts();
  }

  void redirectToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/home");
  }

  Future<void> getContracts() async {
    try {
      //busca os dados no banco de dados.
      final result = await contactDao.findAll();
      //coloca os valore do banco no VALUE NOTIFIER
      contacts = result;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getContactByName(String name) async {
    final result = await contactDao.findByName(name);
    contacts = result;
  }
}
