import 'package:flutter/material.dart';
import 'package:my_library/Models/Book.dart';

class CardBook extends StatelessWidget {

  CardBook(this.book, {super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),alignment: Alignment.center,
      child: Card(
        child: Center(
            child: Column(
                  children: [Text(book.Name), Text(book.category.name), Text(book.formattedDate)]),
            )),
    );
  }
}
