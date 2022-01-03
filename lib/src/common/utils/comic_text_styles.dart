import 'package:comic_book_tomas_sarmiento/src/common/utils/comic_colors.dart';
import 'package:flutter/material.dart';

class ComicTextStyles {
  static TextStyle _baseFont =  const TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: 'Roboto',
      fontStyle: FontStyle.normal,
      fontSize: 16,
      height: 1.3);

  static TextStyle baseFontOriginalHeight() =>  TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'Roboto',
    fontStyle: FontStyle.normal,
    fontSize: 16,
  );


  static TextStyle robotoBold()=>
      _baseFont.copyWith(
          fontWeight: FontWeight.bold,
          color: ComicColors.black);

  static TextStyle robotoLight()=>
      _baseFont.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 15,
          color: ComicColors.black);


  static TextStyle robotoRegular()=>
      _baseFont.copyWith(
          fontWeight: FontWeight.w400,
          color: ComicColors.black);

  static TextStyle signUpTitle() => _baseFont.copyWith(fontSize: 40, fontWeight: FontWeight.w800, color: ComicColors.black);

  static TextStyle buttonTextStyle = _baseFont.copyWith(color: Colors.white);

  static TextStyle errorLabelStyle = _baseFont.copyWith(color: ComicColors.error, fontSize: 15);

}