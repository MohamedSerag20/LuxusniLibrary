import 'package:flutter/material.dart';
import 'package:my_library/Models/Book.dart';
import 'package:my_library/Widgets/the_card.dart';

class the_list extends StatelessWidget {
  final List<Book> books;
  final void Function(Book book, int idx) delete_;
  the_list({required this.books, required this.delete_});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (ctx, int index) {
            return Dismissible(
              key: ValueKey(books[index]),
              onDismissed: (direction) {
                delete_(books[index], index);
              },
              background: Container(color: Theme.of(context).colorScheme.error.withOpacity(0.5)),
              child: CardBook(books[index]),
            );
          }),
    );
  }
}
