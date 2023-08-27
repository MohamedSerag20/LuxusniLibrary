import 'package:flutter/material.dart';

class rTitle extends StatelessWidget{
  const rTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      if (constraints.maxWidth >= 200) {
        return const SizedBox(
          height: 60,
          width: double.infinity,
          child: Card(
            color: Color.fromARGB(31, 218, 13, 13),
            shape: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 0, 26, 255))),
            child: Center(
              child: Text("Read",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
        );
      } else {
        return const SizedBox(
          height: 60,
          width: 120,
          child: Card(
            color: Color.fromARGB(31, 218, 13, 13),
            shape: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 0, 26, 255))),
            child: Center(
              child: Text("Read",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
        );
      }
    });
  }
}