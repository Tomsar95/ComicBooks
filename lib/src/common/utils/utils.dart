
import 'package:comic_book_tomas_sarmiento/src/resources/repository.dart';
import 'package:flutter/material.dart';

class Utils{

  static late Repository _repository;

  static Repository get repository => _repository;

  static void inject({required Repository repository}) {
    _repository = repository;
  }
}