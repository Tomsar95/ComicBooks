import 'package:comic_book_tomas_sarmiento/src/common/utils/comic_colors.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/comic_text_styles.dart';
import 'package:comic_book_tomas_sarmiento/src/common/utils/labels.dart';
import 'package:flutter/material.dart';

class ComicsViewSwitch extends StatefulWidget {

  const ComicsViewSwitch({Key? key, required this.gridSelected, required this.setSwitchState}) : super(key: key);

  final bool gridSelected;
  final Function() setSwitchState;

  @override
  _ComicsViewSwitchState createState() => _ComicsViewSwitchState();
}

class _ComicsViewSwitchState extends State<ComicsViewSwitch> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: widget.setSwitchState,
              child: Row(
                children: [
                  Icon(Icons.format_list_bulleted_sharp, color: widget.gridSelected ? ComicColors.black : ComicColors.principal,),
                  const SizedBox(width: 8,),
                  Text(UILabels.listSelector, style: ComicTextStyles.robotoRegular().copyWith(color: widget.gridSelected ? ComicColors.black : ComicColors.principal,)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: widget.setSwitchState,
              child: Row(
                children: [
                  Icon(Icons.grid_view, color: widget.gridSelected ? ComicColors.principal : ComicColors.black,),
                  const SizedBox(width: 8,),
                  Text(UILabels.gridSelector, style: ComicTextStyles.robotoRegular().copyWith(color: widget.gridSelected ? ComicColors.principal : ComicColors.black,)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
