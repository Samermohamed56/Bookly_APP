import 'package:bookly/core/utils/lunching_url.dart';
import 'package:bookly/core/widgets/cutom_button.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: CutomButton(
            text: "Free",
            backgroundcolor: Colors.white,
            foregroundcolor: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
        ),
        Expanded(
          child: CutomButton(
            onPressed: () async {
              await launchCustomUrl(context, bookModel.volumeInfo.previewLink!);
            },
            fontsize: 16,
            text: getText(bookModel),
            backgroundcolor: const Color(0xffef8262),
            foregroundcolor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
        ),
      ],
    );
  }

  getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not Available";
    } else {
      return "Preview";
    }
  }
}
