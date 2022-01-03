import 'package:comic_book_tomas_sarmiento/src/models/api_response.dart';
import 'package:comic_book_tomas_sarmiento/src/resources/providers.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';


class Repository {

  static final RetryClient client = RetryClient(Client(), retries: 2);

  final PHPAPIProvider php = PHPAPIProvider(client);

  Future<ApiResponse> fetchComics() async {
    return php.comics.fetchComics();
  }
}