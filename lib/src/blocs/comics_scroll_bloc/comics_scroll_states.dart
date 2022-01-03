import 'package:comic_book_tomas_sarmiento/src/models/comic.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ComicsState extends Equatable{
  ComicsState([List props=const[]]):super(props);
}

class OnFetchedComicsState extends ComicsState{
  final List<Comic> comics;

  OnFetchedComicsState(this.comics)
      :super([comics, UniqueKey()]);
}

class OnFetchedComicsInitState extends ComicsState{
  OnFetchedComicsInitState():super();
}

class OnErrorFetchingComicsState extends ComicsState{
  OnErrorFetchingComicsState():super();
}

class OnLoadingComicsState extends ComicsState{
  OnLoadingComicsState():super();
}