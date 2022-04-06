// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

class ContactModel {
  final int id;
  final String name;
  final String telephone;
  final int age;
  final int accountNumber;

  ContactModel({
    this.id = 0,
    required this.name,
    required this.telephone,
    required this.age,
    required this.accountNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "telephone": telephone,
      "age": age,
      "account_number": accountNumber,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'],
      name: map['name'],
      telephone: map['telephone'],
      age: map['age'],
      accountNumber: map['account_number'],
    );
  }

  factory ContactModel.fromJson(String source) =>
      ContactModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return "Name: ${name}, Age: ${age}, Telephone: ${telephone}";
  }
}
