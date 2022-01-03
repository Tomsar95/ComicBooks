import 'package:equatable/equatable.dart';

class Comic extends Equatable {
  final String image;
  final String dateAdded;
  final String name;
  final String issueNumber;

  Comic(
      {required this.issueNumber,
      required this.image,
      required this.dateAdded,
      required this.name})
      : super([image, dateAdded, name]);

  factory Comic.fromJsonPHP(Map<String, dynamic> parsedJson) {
    return Comic(
      image: parsedJson.containsKey("image")
          ? parsedJson["image"]["original_url"] ?? ""
          : "",
      name: parsedJson.containsKey("name")
          ? parsedJson["name"] ?? "Comic"
          : "Comic",
      dateAdded: parsedJson.containsKey("date_added")
          ? parsedJson["date_added"] ?? "Not found"
          : "Not found",
      issueNumber: parsedJson.containsKey("issue_number")
          ? parsedJson["issue_number"] ?? "0"
          : "0",
    );
  }
}
