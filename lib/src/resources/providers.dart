import 'package:comic_book_tomas_sarmiento/src/resources/php/comics_api_provider.dart';
import 'package:http/http.dart';

class PHPAPIProvider {
  final Client client;
  late PHPComicsAPIProvider comics;

  PHPAPIProvider(this.client) {
    comics = PHPComicsAPIProvider(client);
  }

}