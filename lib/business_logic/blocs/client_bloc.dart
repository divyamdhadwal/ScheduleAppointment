import 'dart:async';

import '../../data/models/client.dart';
import '../../data/repositories/client_repository.dart';

class ClientBloc {
  final _clientRepository = ClientRepository();
  final _clientController = StreamController<List<Client>>.broadcast();
  get clients => _clientController.stream;
  ClientBloc() {
    getClients();
  }

  getClients({String? query}) async {
    _clientController.sink
        .add(await _clientRepository.getAllClients(query: query));
  }

  addClient(Client client) async {
    await _clientRepository.addClient(client);
    getClients();
  }

  dispose() {
    _clientController.close();
  }
}
