// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:grab_app/mytest.dart';

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          // Hoạt động
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Hoạt động',
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Lịch sử
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.history, size: 24),
                      Text(
                        ' Lịch sử',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: ActivityBody(),
      ),
    );
  }
}

class ActivityBody extends StatelessWidget {
  const ActivityBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 20),
            child: Text(
              'Gần đây',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              print("1");
            },
            child: Container(
              padding: EdgeInsets.only(left: 15, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.motorcycle,
                    color: Colors.green,
                    size: 30,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 2 / 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            'Chuyến đi đến 25/57 Hai Ba Trung St.',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              height: 1.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Text(
                            '09:26 22 Th11 2023',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        textButtonMethod('Đặt lại  ', 16),
                      ],
                    ),
                  ),
                  Text(
                    '15.000đ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
          Center(
              child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TestWidget()),
              );
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Xem lịch sử',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  WidgetSpan(
                    child: Icon(
                      Icons.arrow_forward,
                      size: 15,
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  TextButton textButtonMethod(String text, double fsize) {
    return TextButton(
      onPressed: () {},
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: text,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: fsize,
              ),
            ),
            WidgetSpan(
              child: Icon(
                Icons.arrow_forward,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
