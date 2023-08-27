// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:my_library/Models/Book.dart';
import 'package:my_library/Widgets/read_title.dart';
import 'package:my_library/Widgets/curr_title.dart';
import 'package:my_library/Widgets/want_title.dart';
import 'package:my_library/Widgets/the_list.dart';
import 'Widgets/bottomSheet.dart';

class Lists extends StatefulWidget {
  const Lists({super.key});

  @override
  State<Lists> createState() => _My_List_state();
}

class _My_List_state extends State<Lists> {
  final List<Book> rBooks = [
    Book(
        Name: "Wonder Land",
        category: Category.Scince_Fiction,
        date: DateTime.now()),
    Book(Name: "Not Alone", category: Category.Horror, date: DateTime.now()),
  ];

  final List<Book> cBooks = [
    Book(
        Name: "Wonder Land",
        category: Category.Scince_Fiction,
        date: DateTime.now()),
    Book(Name: "Not Alone", category: Category.Horror, date: DateTime.now())
  ];

  final List<Book> wBooks = [
    Book(
        Name: "Wonder Land",
        category: Category.Scince_Fiction,
        date: DateTime.now()),
    Book(Name: "Not Alone", category: Category.Horror, date: DateTime.now())
  ];

  //saving the book proccess
  _saveBook(int detect, Book newBook) {
    if (detect == -1) {
      setState(() {
        rBooks.add(newBook);
      });
    } else if (detect == 0) {
      setState(() {
        cBooks.add(newBook);
      });
    } else {
      setState(() {
        wBooks.add(newBook);
      });
    }
  }

  //putting the new Book
  void start_book() {
    showModalBottomSheet(
        isScrollControlled: true,
        useSafeArea: true,
        context: context,
        builder: (ctx) {
          return bottomSheet(
              addBook: (detect, newBook) => _saveBook(detect, newBook));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App Bar
      appBar: AppBar(
        title: const Text("Add a book to your library"),
        actions: [
          IconButton(onPressed: () => start_book(), icon: const Icon(Icons.add))
        ],
      ),
      //Body
      body: Center(
          child: Container(
            color: Theme.of(context).colorScheme.background,
            child: Row(children: [
                  // First column
                  Expanded(
            child: Column(
              children: [
                const rTitle(),
                Expanded(
                    child: the_list(
                        books: rBooks,
                        //Deleting and Adding process
                        delete_: (book, index) {
                          setState(() {
                            rBooks.removeAt(index);
                          });
                          ScaffoldMessenger.of(context).clearSnackBars();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text("Book deleted.."),
                            duration: const Duration(seconds: 3),
                            action: SnackBarAction(
                                label: "Undo",
                                onPressed: () {
                                  setState(() {
                                    rBooks.insert(index, book);
                                  });
                                }),
                          ));
                        }))
              ],
            ),
                  ),
                  // Third column
                  Expanded(
            child: Column(children: [
              const cTitle(),
              Expanded(
                  child: the_list(
                      books: cBooks,
                      //Deleting and Adding process
                      delete_: (book, index) {
                        setState(() {
                          cBooks.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text("Book deleted.."),
                          duration: const Duration(seconds: 3),
                          action: SnackBarAction(
                              label: "Undo",
                              onPressed: () {
                                setState(() {
                                  cBooks.insert(index, book);
                                });
                              }),
                        ));
                      }))
            ]),
                  ),
                  // Third column
                  Expanded(
            child: Column(children: [
              const wTitle(),
              Expanded(
                  child: the_list(
                      books: wBooks,
                      //Deleting and Adding process
                      delete_: (book, index) {
                        setState(() {
                          wBooks.removeAt(index);
                        });
                        ScaffoldMessenger.of(context).clearSnackBars();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text("Book deleted.."),
                          duration: const Duration(seconds: 3),
                          action: SnackBarAction(
                              label: "Undo",
                              onPressed: () {
                                setState(() {
                                  wBooks.insert(index, book);
                                });
                              }),
                        ));
                      }))
            ]),
                  ),
                ]),
          )),
    );
  }
}
