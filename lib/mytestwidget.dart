// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class MyTestWidget1 extends StatelessWidget {
  const MyTestWidget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}

class MyTestWidget2 extends StatelessWidget {
  const MyTestWidget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.green,
    );
  }
}

class MyTestWidget3 extends StatelessWidget {
  const MyTestWidget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      color: Colors.yellow,
    );
  }
}
