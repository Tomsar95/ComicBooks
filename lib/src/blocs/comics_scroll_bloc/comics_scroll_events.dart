import 'package:equatable/equatable.dart';

class ComicsEvent extends Equatable{
  ComicsEvent([List props = const []]):super(props);
}

class LoadDataComicEvent extends ComicsEvent{
  LoadDataComicEvent():super([]);
}