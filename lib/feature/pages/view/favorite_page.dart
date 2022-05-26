import 'package:calvesia/feature/widget/UpcomingEventsCardWidget.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../../Utils/Style/color_palette.dart';
import '../models/post_model.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const SilverDelegateComponentFavourite();
  }
}


class SilverDelegateComponentFavourite extends StatefulWidget {
  const SilverDelegateComponentFavourite({
    Key? key,
  }) : super(key: key);

  @override
  State<SilverDelegateComponentFavourite> createState() =>
      _SilverDelegateComponentFavouriteState();
}

class _SilverDelegateComponentFavouriteState extends State<SilverDelegateComponentFavourite> {
  static const _pageSize = 20;
  String _lasPost = '';

  final PagingController<int, DataSnapshot> _pagingController =
  PagingController(firstPageKey: 0);

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var refNewItem = await FirebaseDatabase.instance
          .ref('posts')
          .orderByChild("title")
          .startAfter(_lasPost)
          .limitToFirst(_pageSize)
          .get();

      final newItems = refNewItem.children.toList();
      _lasPost = newItems.last.key!;

      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        _pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        _pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RefreshIndicator(
        color: BaseColorPalet.main,
        onRefresh:  () => Future.sync(
              () => _pagingController.refresh(),
        ),
        child: PagedListView<int, DataSnapshot>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<DataSnapshot>(
              itemBuilder: (context, item, index) {
                final post = PostModel.fromJson(item.value);
                return UpcomingEventsCardWidget(
                  post: post,
                );
              }),
        ),
      ),
    );
  }
}