import 'package:bookly/core/widgets/custom_err.dart';
import 'package:bookly/core/widgets/custom_loading_indecator.dart';
import 'package:bookly/features/home/presentation/view_model/semilar_books_cubit/semilar_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_model/semilar_books_cubit/similar_books_state.dart';
import 'package:bookly/features/home/presentation/views/widgets/custum_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBoxListView extends StatelessWidget {
  const SimilarBoxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SemilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .19,
            child: ListView.builder(
              itemCount: state.bookModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => CustumImageContainer(
                imageURL:
                    state.bookModel[index].volumeInfo.imageLinks?.thumbnail ??
                        "",
              ),
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErr(errMessage: state.errMessage);
        }
        return const CustomLoadingIndecator();
      },
    );
  }
}
