// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class MyChat extends StatelessWidget {
  const MyChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/supportStaff.jpg',
              width: 220,
            ),
            SizedBox(height: 20),
            Text(
              'Xem cuộc trò chuyện của bạn với nhân viên hỗ trợ tại đây!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Bạn cũng có thể yếu cầu hỗ trợ thông qua Trung tâm trợ giúp.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
