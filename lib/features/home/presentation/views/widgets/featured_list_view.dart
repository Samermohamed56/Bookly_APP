import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_err.dart';
import 'package:bookly/core/widgets/custom_loading_indecator.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custum_image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FeaturedBookListView extends StatelessWidget {
  const FeaturedBookListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                 onTap: () => GoRouter.of(context).push(
        AppRouter.kBookDetailsView,
        extra: state.books[index],
      ),
                child: CustumImageContainer(
                  imageURL:
                      state.books[index].volumeInfo.imageLinks?.thumbnail ?? "",
                ),
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErr(errMessage: state.errMessage);
        }
        return const CustomLoadingIndecator();
      },
    );
  }
}
