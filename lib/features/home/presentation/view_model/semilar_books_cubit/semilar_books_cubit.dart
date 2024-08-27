import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'similar_books_state.dart';

class SemilarBooksCubit extends Cubit<SimilarBooksState> {
  SemilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchFeatureBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchsimilarBooks(category: category);
    result.fold(
      (failure) => emit(SimilarBooksFailure(failure.errmessage)),
      (books) => emit(SimilarBooksSuccess(books)),
    );
  }
}
