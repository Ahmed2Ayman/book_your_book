import 'package:book_your_book/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_image.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child:  CustomBookImage(
            imageUrl:
             bookModel.volumeInfo.imageLinks?.thumbnail ??''  ,
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          bookModel.volumeInfo.title!,
          style: Styles.textStyle30
              .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
        textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
            bookModel.volumeInfo.authors?[0]??'',
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
         BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: bookModel.volumeInfo.averageRating?.round() ?? 0,
          count: bookModel.volumeInfo.ratingsCount ??0,
        ),
        const SizedBox(
          height: 37,
        ),
         BooksAction(bookModel: bookModel,),
      ],
    );
  }
}
