import 'package:comic_book_tomas_sarmiento/src/blocs/comics_scroll_bloc/comics_scroll_bloc.dart';
import 'package:comic_book_tomas_sarmiento/src/blocs/comics_scroll_bloc/comics_scroll_events.dart';
import 'package:comic_book_tomas_sarmiento/src/blocs/comics_scroll_bloc/comics_scroll_states.dart';
import 'package:comic_book_tomas_sarmiento/src/common/UI/comic_app_bar.dart';
import 'package:comic_book_tomas_sarmiento/src/common/UI/comic_card.dart';
import 'package:comic_book_tomas_sarmiento/src/common/UI/view_switch.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/comic_colors.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/comic_text_styles.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/labels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainComicsScreen extends StatefulWidget {
  const MainComicsScreen({Key? key}) : super(key: key);

  @override
  _MainComicsScreenState createState() => _MainComicsScreenState();
}

class _MainComicsScreenState extends State<MainComicsScreen> {
  late ComicsBloc comicsBloc;
  late bool _gridSelected;

  @override
  void initState() {
    comicsBloc = ComicsBloc();
    comicsBloc.add(LoadDataComicEvent());
    _gridSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ComicColors.backGround,
      appBar: const ComicAppBar(),
      body: BlocProvider(
        create: (context) => comicsBloc,
        child: BlocBuilder(
          bloc: comicsBloc,
          builder: builder,
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void setSwitchViewValue() {
    setState(() {
      _gridSelected = !_gridSelected;
    });
  }

  Widget builder(BuildContext context, ComicsState state) {
    if (state is OnLoadingComicsState) {
      return const LoadingView();
    }
    if (state is OnFetchedComicsState) {
      // return ComicsView(comics: state.comics);
      List<Widget> sliverList = [];
      sliverList.add(SliverToBoxAdapter(
          child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(UILabels.mainSubtitle,
                style: ComicTextStyles.robotoBold()),
          ),
          ComicsViewSwitch(
              gridSelected: _gridSelected,
              setSwitchState: () => setSwitchViewValue()),
        ],
      )));
      sliverList.add(_gridSelected
          ? SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: ComicCard(
                      comic: state.comics[index],
                    ),
                  );
                },
                childCount: state.comics.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (170 / 300),
                crossAxisSpacing: 0,
                mainAxisSpacing: 5,
              ))
          : SliverList(
              delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: ComicTile(
                    comic: state.comics[index],
                  ),
                );
              },
              childCount: state.comics.length,
            )));
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: false,
          slivers: sliverList,
        ),
      );
    }
    if (state is OnErrorFetchingComicsState) {
      return const ErrorView();
    }
    return const ErrorView();
  }
}

class LoadingView extends StatelessWidget {
  const LoadingView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(MessagesLabels.fetchError, textAlign: TextAlign.center,),
      ),
    );
  }
}
