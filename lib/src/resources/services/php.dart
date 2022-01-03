import 'package:http/http.dart';

class PHPAPIService extends APIService {
  PHPAPIService(Client client) : super(client);

  @override
  Map<String, String> get headers => {
    "Accept": "application/json",
    "Access-Control-Allow-Origin": "*",
  };

  @override
  String get root => 'http://comicvine.gamespot.com/api';

  String get myApiKey => '7162d2a0cc781a5f2d77c6ca28d7ce0994c836b6';

  String? cookie;

  void setCookies(String raw){

  }

}

abstract class APIService {
  final Client client;

  APIService(this.client);

  String get root;

  Map<String, String> get headers;

  String getParameters(Map<String, Object> options) {
    final params = <String>[];
    options.forEach((key, value) {
      if (value == null) return;
      params.add("$key=$value");
    });
    return params.join('&');
  }
}
