import 'package:book_your_book/core/errors/failure.dart';
import 'package:book_your_book/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
 Future<Either<Failure,List<BookModel>>> fetchNewestBooks();
 Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();
 Future<Either<Failure,List<BookModel>>> fetchSimilarBooks({required String category});
}
