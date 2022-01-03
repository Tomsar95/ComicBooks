
import 'dart:io';

import 'package:comic_book_tomas_sarmiento/src/common/utils/comic_colors.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/utils.dart';
import 'package:comic_book_tomas_sarmiento/src/resources/repository.dart';
import 'package:comic_book_tomas_sarmiento/src/screens/main_screen.dart';
import 'package:flutter/material.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {

  HttpOverrides.global = MyHttpOverrides();

  await injectDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Comics SunDevs Flutter Test',
        theme: ThemeData(
          primarySwatch: Colors.green,
          backgroundColor: ComicColors.backGround,
        ),
        home: const MainComicsScreen(),
      );
  }
}

injectDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();

  final repository = Repository();

  Utils.inject(repository: repository);

}