// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';
import 'contactModel.dart';

class TransactionModel {
  final ContactModel contact;
  final double value;

  TransactionModel({
    required this.value,
    required this.contact,
  });

  Map<String, dynamic> toMap() {
    return {
      "value": value,
      "contact": contact,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      value: map['value'],
      contact: map['contact'],
    );
  }

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}
