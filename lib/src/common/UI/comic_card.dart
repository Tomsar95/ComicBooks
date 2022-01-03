import 'package:cached_network_image/cached_network_image.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/comic_colors.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/comic_text_styles.dart';
import 'package:comic_book_tomas_sarmiento/src/models/comic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComicCard extends StatefulWidget {
  const ComicCard({Key? key, required this.comic}) : super(key: key);

  final Comic comic;

  @override
  _ComicCardState createState() => _ComicCardState();
}

class _ComicCardState extends State<ComicCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ComicColors.backGround,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          builtImage(),
          Text(widget.comic.name + ' #' + widget.comic.issueNumber, style: ComicTextStyles.robotoBold(),),
          Text(widget.comic.dateAdded, style: ComicTextStyles.robotoLight()),
        ],
      ),
    );
  }

  Widget builtImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: AspectRatio(
        aspectRatio: 1 / 1.3,
        child: CachedNetworkImage(
          imageUrl: widget.comic.image,
          fit: BoxFit.fitWidth,
          placeholder: (context, url) => Container(
              color: ComicColors.darkGray.withOpacity(0.1),
              child: const Center(child: CircularProgressIndicator(strokeWidth: 2,))),
        ),
      ),
    );
  }
}

class ComicTile extends StatefulWidget {
  const ComicTile({Key? key, required this.comic}) : super(key: key);

  final Comic comic;

  @override
  _ComicTileState createState() => _ComicTileState();
}

class _ComicTileState extends State<ComicTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        color: ComicColors.backGround,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            builtImage(),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.comic.name + ' #' + widget.comic.issueNumber),
                Text(widget.comic.dateAdded),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget builtImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      child: AspectRatio(
        aspectRatio: 1 / 1.3,
        child: CachedNetworkImage(
          imageUrl: widget.comic.image,
          fit: BoxFit.fitWidth,
          placeholder: (context, url) => Container(
              color: ComicColors.darkGray.withOpacity(0.1),
              child: const Center(child: CircularProgressIndicator(strokeWidth: 2,))),
        ),
      ),
    );
  }
}
