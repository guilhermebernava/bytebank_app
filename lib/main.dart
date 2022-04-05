import 'package:bytebank/app.dart';
import 'package:bytebank/database/database.dart';
import 'package:bytebank/shared/models/contactModel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
  final database = DbContext();

  database
      .save(ContactModel(
          id: 10, name: "Guilherme", telephone: "5555-5555", age: 22))
      .then((value) => {
            database.findAll().then(
                  (value) => debugPrint(value.toString()),
                )
          });
}
