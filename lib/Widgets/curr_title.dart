import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class cTitle extends StatelessWidget {
  const cTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      if (constraints.maxWidth >= 200) {
        return const SizedBox(
          height: 60,
          width: double.infinity,
          child: Card(
            color: Color.fromARGB(31, 7, 235, 7),
            shape: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 0, 26, 255))),
            child: Center(
              child: Text("Currently Reading",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
        );
      } else {
        return const SizedBox(
          height: 60,
          width: 120,
          child: Card(
            color: Color.fromARGB(31, 7, 235, 7),
            shape: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 0, 26, 255))),
            child: Center(
              child: Text("Currently Reading",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
        );
      }
    });
  }
}
