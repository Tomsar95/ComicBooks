import 'dart:convert';

import 'package:comic_book_tomas_sarmiento/src/models/api_response.dart';
import 'package:comic_book_tomas_sarmiento/src/models/comic.dart';
import 'package:comic_book_tomas_sarmiento/src/resources/services/php.dart';
import 'package:http/http.dart';

class PHPComicsAPIProvider extends PHPAPIService {
  PHPComicsAPIProvider(Client client) : super(client);

  Future<ApiResponse<List<Comic>>> fetchComics() async {
    try {
      final response = await client.get(Uri.parse('$root/issues/?api_key=$myApiKey&format=json'),  headers: headers);
      if (response.statusCode != 200) return ApiResponse(success: false, statusCode: response.statusCode);
      final parsedJson = json.decode(response.body);
      Iterable i = parsedJson["results"];
      return ApiResponse(success: true, body: i.map((comic) => Comic.fromJsonPHP(comic)).toList());
    } catch (e) {
      print("fetchComicError: $e");
      return ApiResponse(success: false, statusCode: 500, message: e.toString());
    }
  }
}