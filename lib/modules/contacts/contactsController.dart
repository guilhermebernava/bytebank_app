import 'package:flutter/cupertino.dart' show ValueNotifier, debugPrint;

import '../../database/database.dart';
import '../../shared/models/contactModel.dart';

class ContactsController {
  final dbContext = DbContext();

  final contactsNotifier = ValueNotifier<List<ContactModel>>(<ContactModel>[]);
  List<ContactModel> get contacts => contactsNotifier.value;
  set contacts(List<ContactModel> value) => contactsNotifier.value = value;

  ContactsController() {
    getContracts();
  }

  Future<void> getContracts() async {
    try {
      //busca os dados no banco de dados.
      final result = await dbContext.findAll();
      //coloca os valore do banco no VALUE NOTIFIER
      contacts = result;
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
