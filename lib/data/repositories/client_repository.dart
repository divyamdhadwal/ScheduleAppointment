import '../dataproviders/client_provider.dart';
import '../models/client.dart';

class ClientRepository {
  final clientProvider = ClientProvider();

  Future getAllClients({String? query}) => clientProvider.getClients(query: query);

  Future addClient(Client client) => clientProvider.createClient(client);
}
