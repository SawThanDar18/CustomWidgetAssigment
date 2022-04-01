import 'package:flutter/material.dart';

import '../resources/dimens.dart';

class SmartListView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;
  final Function onListStart;
  final Function onListEndReached;

  const SmartListView({Key? key,
    required this.itemCount,
    required this.itemBuilder,
    required this.onListStart,
    required this.onListEndReached,
  }) : super(key: key);

  @override
  _SmartListViewState createState() => _SmartListViewState();
}

class _SmartListViewState extends State<SmartListView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {

      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          debugPrint('Start of the list reached');
        } else {
          debugPrint("End of the list reached");
          widget.onListEndReached();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount == 0) {
      return const Center(
        child: Text(
          "No Data!!!",
          style: TextStyle(
            color: Colors.black,
            fontSize: MARGIN_MEDIUM_2,
          ),
        ),
      );
    } else {
      return ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.vertical,
        itemCount: widget.itemCount,
        itemBuilder: widget.itemBuilder,
      );
    }
  }
}
