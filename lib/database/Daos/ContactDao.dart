import '../../shared/models/contactModel.dart';
import '../database.dart';

class ContactDao {
  final String tableSql = 'CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'telephone TEXT,'
      'age INTEGER,'
      'account_number INTEGER)';

  // ignore: non_constant_identifier_names
  Future<int> save(ContactModel model) {
    return createDatabase().then((db) => db.insert('contacts', model.toMap()));
  }

  Future<List<ContactModel>> findAll() {
    return createDatabase().then(
      (db) => db.query('contacts').then((maps) {
        final contacts = <ContactModel>[];
        for (Map<String, dynamic> map in maps) {
          final contact = ContactModel(
              id: map['id'],
              age: map['age'],
              name: map['name'],
              telephone: map['telephone'],
              accountNumber: map['account_number']);
          contacts.add(contact);
        }
        return contacts;
      }),
    );
  }

  Future<List<ContactModel>> findByName(String name) {
    return createDatabase().then(
      (db) => db.query('contacts',
          where: "name LIKE ? ", whereArgs: ['%$name%']).then((maps) {
        final contacts = <ContactModel>[];
        for (Map<String, dynamic> map in maps) {
          final contact = ContactModel(
              id: map['id'],
              age: map['age'],
              name: map['name'],
              telephone: map['telephone'],
              accountNumber: map['account_number']);
          contacts.add(contact);
        }
        return contacts;
      }),
    );
  }

  Future<List<ContactModel>> findByAccountNumber(int accountNumber) {
    return createDatabase().then(
      (db) => db.query('contacts',
          where: "account_number = ? ",
          whereArgs: [accountNumber]).then((maps) {
        final contacts = <ContactModel>[];
        for (Map<String, dynamic> map in maps) {
          final contact = ContactModel(
              id: map['id'],
              age: map['age'],
              name: map['name'],
              telephone: map['telephone'],
              accountNumber: map['account_number']);
          contacts.add(contact);
        }
        return contacts;
      }),
    );
  }

  Future<int> delete(ContactModel model) async {
    final db = await createDatabase();
    final res =
        await db.delete('contacts', where: "id = ?", whereArgs: [model.id]);

    return res;
  }

  Future<int> update(ContactModel model) async {
    final db = await createDatabase();
    final res = await db.update('contacts', model.toMap(),
        where: "id = ?", whereArgs: [model.id]);

    return res;
  }
}
