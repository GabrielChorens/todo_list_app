import 'package:injectable/injectable.dart';
import 'package:todo_list_app/core/services/network_service/network_service.dart';

///Concrete instances of [NetworkService] to provide base urls.

@singleton
class ReqResService extends NetworkService {
  ReqResService() : super(baseUrl: 'https://reqres.in/api');
}

@singleton
class JsonPlaceholderService extends NetworkService {
  JsonPlaceholderService()
      : super(baseUrl: 'https://jsonplaceholder.typicode.com');
}
