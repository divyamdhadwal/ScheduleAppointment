import 'dart:async';

import '../../database/database.dart';
import '../models/client.dart';

class ClientProvider {
  final dbProvider = DatabaseProvider.dbProvider;
  Future<int> createClient(Client client) async {
    final db = await dbProvider.database;
    var result = db.insert(clientTABLE, client.toDatabaseJson());
    return result;
  }

  Future<List<Client>> getClients({List<String>? columns, String? query}) async {
    final db = await dbProvider.database;
    List<Map<String, dynamic>> result = {} as List<Map<String, dynamic>>;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(clientTABLE,
            columns: columns,
            where: 'firstName LIKE ?',
            whereArgs: ["%$query%"]);
    } else {
      result = await db.query(clientTABLE, columns: columns);
    }

    List<Client> clients = result.isNotEmpty
        ? result.map((item) => Client.fromDatabaseJson(item)).toList()
        : [];
    return clients;
  }
}
