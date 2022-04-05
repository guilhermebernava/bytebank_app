import 'package:bytebank/shared/models/contactModel.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DbContext {
  //FUNCTION que cria o DATABASE em SQLITE
  Future<Database> createDatabase() {
    //pega o caminho do banco de dados
    return getDatabasesPath().then((dbPath) {
      //gera o caminho do banco de dados para qualquer versão
      // tanto ANDROID como IOS
      final String path = join(dbPath, 'bytebank.db');
      // cria o banco de dados com esse caminho
      return openDatabase(path, onCreate: (db, version) {
        //cria uma TABELA no banco de dados
        db.execute('CREATE TABLE contacts('
            'id INTEGER PRIMARY KEY, '
            'name TEXT, '
            'telephone TEXT,'
            'age INTEGER)');
      }, version: 1);
    });
  }

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
