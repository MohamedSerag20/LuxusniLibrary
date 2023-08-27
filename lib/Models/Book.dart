import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Category { Scince_Fiction, Horror, Drama, Action, Fantasy, Romance, Children, Adventure}
final DateFormat formatter = DateFormat.yMd();

class Book {
  //final DateFormat formatter = DateFormat.yMd();
  final String Name;
  final Category category;
  final DateTime date;

    Book({required this.Name, required this.category, required this.date});

  // a function mixed with a value
    String get formattedDate {
    return formatter.format(date);
  }
  
}
