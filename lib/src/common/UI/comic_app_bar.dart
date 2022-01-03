import 'package:comic_book_tomas_sarmiento/src/common/utils/comic_colors.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/comic_text_styles.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/labels.dart';
import 'package:flutter/material.dart';

class ComicAppBar extends StatefulWidget with PreferredSizeWidget {
  const ComicAppBar({Key? key}) : super(key: key);

  @override
  _ComicAppBarState createState() => _ComicAppBarState();

  @override
  Size get preferredSize {
    return const Size.fromHeight(kToolbarHeight);
  }
}

class _ComicAppBarState extends State<ComicAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
          child: Text(
        UILabels.mainTitle,
        style: ComicTextStyles.robotoLight().copyWith(fontSize: 36),
      )),
      backgroundColor: ComicColors.backGround,
      elevation: 0,
    );
  }
}
