import 'package:comic_book_tomas_sarmiento/src/blocs/comics_scroll_bloc/comics_scroll_events.dart';
import 'package:comic_book_tomas_sarmiento/src/blocs/comics_scroll_bloc/comics_scroll_states.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/utils.dart';
import 'package:comic_book_tomas_sarmiento/src/models/comic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ComicsBloc extends Bloc<ComicsEvent,ComicsState> {

  final _repo = Utils.repository;
  late final List<Comic> comics;

  @override
  ComicsState get initialState => OnLoadingComicsState();

  @override
  Stream<ComicsState> mapEventToState(ComicsEvent event) async* {
    if (event is LoadDataComicEvent) {
      yield OnLoadingComicsState();
      var data = await _repo.fetchComics();
      if (data.success ?? false) {
        comics = data.body;
        yield OnFetchedComicsState(comics);
      } else {
        yield OnErrorFetchingComicsState();
      }
    }
  }

}