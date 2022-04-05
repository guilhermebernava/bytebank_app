import 'package:bytebank/database/Daos/ContactDao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//FUNCTION que cria o DATABASE em SQLITE
Future<Database> createDatabase() {
  final contact = ContactDao();
  //pega o caminho do banco de dados
  return getDatabasesPath().then((dbPath) {
    //gera o caminho do banco de dados para qualquer versão
    // tanto ANDROID como IOS
    final String path = join(dbPath, 'bytebank.db');
    // cria o banco de dados com esse caminho
    return openDatabase(path, onCreate: (db, version) {
      //cria uma TABELA no banco de dados
      db.execute(contact.tableSql);
    }, version: 1);
  });
}
