// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'mytestwidget.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  int acceptedData = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Draggable(
          data: MyTestWidget1(),
          feedback: MyTestWidget1(),
          // axis: Axis.horizontal,
          child: MyTestWidget1(),
          // childWhenDragging: Container(),
        ),
        Gap(50),
        DragTarget(
          builder: (context, candidateData, rejectedData) {
            return Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  '$acceptedData',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
          onWillAcceptWithDetails: (data) {
            return true;
          },
          onAcceptWithDetails: (data) {
            setState(() {
              acceptedData += 1;
            });
          },
        )
      ],
    );
  }
}
