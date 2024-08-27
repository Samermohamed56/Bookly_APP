import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failures, List<BookModel>>> fetchnewestBooks() async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?q=Computer sience&Filtering=free_ebooks&Sorting=newest");
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {throw Exception();}
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(
          errmessage: "Oops There was an error, Please try again"));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchsimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endPoint:
              "volumes?q=Computer sience&Filtering=free_ebooks&Sorting=relevance");
      List<BookModel> books = [];
      for (var item in data['items']) {
        try {
          books.add(BookModel.fromJson(item));
        } catch (e) {throw Exception();}
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(
          errmessage: "Oops There was an error, Please try again"));
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(endPoint: "volumes?q=Football");
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(
          errmessage: "Oops There was an error, Please try again"));
    }
  }
}
