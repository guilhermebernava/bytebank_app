import '../../shared/models/contactModel.dart';
import '../database.dart';

class ContactDao {
  final String tableSql = 'CREATE TABLE contacts('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'telephone TEXT,'
      'age INTEGER)';

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
          );
          contacts.add(contact);
        }
        return contacts;
      }),
    );
  }
}