import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

final clientTABLE = 'ClientDetails';
class DatabaseProvider {
  static final DatabaseProvider dbProvider = DatabaseProvider();

  late Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Client.db");

    var database = await openDatabase(path,
        version: 1, onCreate: initDB);
    return database;
  }

  Future initDB(Database database, int version) async {
    await database.execute("CREATE TABLE IF NOT EXISTS $clientTABLE ("
        "firstName VARCHAR, "
        "lastName VARCHAR, "
        "whatsappNo VARCHAR, "
        "email VARCHAR PRIMARY KEY, "
        "location VARCHAR, "
        "projectName VARCHAR, "
        ")");
  }
}
