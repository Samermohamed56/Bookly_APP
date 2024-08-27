import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_appbar.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly/features/home/presentation/views/widgets/custum_image_container.dart';
import 'package:bookly/features/home/presentation/views/widgets/similar_box_list_view.dart';
import 'package:flutter/material.dart';

class BoookDetailsViewBody extends StatelessWidget {
  const BoookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const BookDetailsAppbar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .282),
                  child: CustumImageContainer(
                    imageURL: bookModel.volumeInfo.imageLinks?.thumbnail ?? "",
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  textAlign: TextAlign.center,
                  bookModel.volumeInfo.title!,
                  style: Styles.textStyle30,
                ),
                Text(
                  bookModel.volumeInfo.authors![0],
                  style: Styles.textStyle18.copyWith(
                    color: Colors.white70,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const SizedBox(
                  height: 37,
                ),
                 BooksAction(bookModel: bookModel,),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You can also like",
                    style: Styles.textStyle14
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBoxListView(),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
