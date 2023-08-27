import 'package:flutter/material.dart';
import 'package:my_library/Models/Book.dart';

class bottomSheet extends StatefulWidget {
  final void Function(int detect, Book newBook) addBook;

  const bottomSheet({super.key, required this.addBook});

  @override
  State<bottomSheet> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<bottomSheet> {
  final textController = TextEditingController();
  var categorySelected = Category.Scince_Fiction;
  final status = ["Read", "Currently Reading", "Want to Read"];
  String statusSelected = "Read";
  DateTime? selectedDate;

  // Disposing
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // The date picker creatment
  Future<void> _showDatePicker() async {
    final date;

    if (statusSelected == "Read") {
      date = await showDatePicker(
        //Theming
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(onSurface: Colors.black),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 2),
        lastDate: DateTime.now(),
      );
    } else if (statusSelected == "Currently Reading") {
      date = await showDatePicker(
        //Theming
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(onSurface: Colors.black),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(DateTime.now().year - 2),
        lastDate: DateTime.now(),
      );
    } else {
      date = await showDatePicker(
        //Theming
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(onSurface: Colors.black),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 2),
      );
    }

    setState(() {
      selectedDate = date;
    });
  }

  // Decide the status of the book
  int _sureDetect() {
    if (identical(statusSelected, "Read")) {
      return -1;
    } else if (identical(statusSelected, "Currently Reading")) {
      return 0;
    } else {
      return 1;
    }
  }

  //Sendimg data
  _submitData() {
    final Tsure =
        textController == null || textController.text.isEmpty;
    final Dsure = selectedDate == null;

    if (Tsure || Dsure) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: const Text('Oops!!'),
            content: const SingleChildScrollView(
              child: Text("Your Title or Date has not been modified."),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Okay'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }

    widget.addBook(
        _sureDetect(),
        Book(
            Name: textController.text,
            category: categorySelected,
            date: selectedDate!));
    Navigator.pop(context);
  }

  // My main widget
  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return SingleChildScrollView(child: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + keyboardSpace),
        child: Column(
          children: [
            TextField(
              controller: textController,
              decoration:
                  const InputDecoration(label: Text("Title of The book")),
              maxLength: 50,
            ),
            // The Situation
            Center(
              child: DropdownButton(
                  style: const TextStyle().copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  value: statusSelected,
                  items: status
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      statusSelected = value;
                    });
                  }),
            ),
            Row(
              children: [
                //choose the book type
                DropdownButton(
                    style: const TextStyle().copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    value: categorySelected,
                    items: Category.values
                        .map((category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            ))
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        categorySelected = value;
                      });
                    }),
                //space
                const SizedBox(
                  width: 24,
                ),
                //the calender
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //estaplishing the date
                    Text(
                        selectedDate == null
                            ? "No Date Selected"
                            : formatter.format(selectedDate!),
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary)),
                    IconButton(
                        onPressed: _showDatePicker,
                        icon: const Icon(Icons.calendar_month))
                  ],
                ))
              ],
            ),
            //the close & start buttons
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Close the bottom sheet
                ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close")),
                //little space
                const SizedBox(
                  width: 10,
                ),
                //saving changes
                TextButton(
                  onPressed: _submitData,
                  child: const Text("Save"),
                )
              ],
            )
          ],
        ),
      ),);
  }
}