import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const SearchResultListView() ;
  }
}
class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder:(context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            // child: BestSellerListViewItem(
            //     bookModel: BookModel(volumeInfo: volumeInfo)
            // ),
            child: Text(""),
          );
        },
    );
  }
}
