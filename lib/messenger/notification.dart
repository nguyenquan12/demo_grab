// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class MyNotification extends StatefulWidget {
  const MyNotification({super.key});

  @override
  State<MyNotification> createState() => _MyNotificationState();
}

class _MyNotificationState extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Column(
            children: [
              listNotificationMethod(
                'assets/images/endow2.png',
                'Chỉ còn 7 ngày 🥰 đến hết 12.12',
                '🎁 Giảm 15% và hoàn 612 điểm',
                '11:20 AM',
              ),
              listNotificationMethod(
                'assets/images/endow2.png',
                '🎆 Ưu đãi đến 60K khi mua hàng',
                '',
                '8:28 AM',
              ),
              listNotificationMethod(
                'assets/images/endow2.png',
                'Táo Ambrosia Canada MUA 2 TẶNG 1',
                '',
                '3 Th12',
              ),
              listNotificationMethod(
                'assets/images/endow2.png',
                '🎁 Bộ đôi ship rẻ, giá chỉ từ 12.000đ',
                '',
                '2 Th12',
              ),
              listNotificationMethod(
                'assets/images/endow2.png',
                '🎉 LƯƠNG VỀ GRABFOOD KHAO ƯU ĐÃI 50.000Đ',
                '',
                '2 Th12',
              ),
              listNotificationMethod(
                'assets/images/endow2.png',
                '🐷 Sữa GIẢM CHẤN ĐỘNG 50%',
                '',
                '25 Th11',
              ),
              listNotificationMethod(
                'assets/images/endow2.png',
                '🌺 Bộ đôi ship rẻ, giá chỉ từ 12.000đ',
                '',
                '25 Th11',
              ),
              listNotificationMethod(
                'assets/images/thongBao.png',
                'Thông báo quan trọng',
                '',
                '25 Th11',
              ),
              listNotificationMethod(
                'assets/images/endow2.png',
                'Homefarm khao 50% và 150.000đ',
                '',
                '24 Th11',
              ),
              listNotificationMethod(
                'assets/images/endow2.png',
                'Nhận ưu đãi đến 50% cực sốc',
                '',
                '23 Th11',
              ),
            ],
          ),
        );
      },
    );
  }

  SizedBox listNotificationMethod(
    String image,
    String text1,
    String text2,
    String text3,
  ) {
    return SizedBox(
      height: 88,
      child: TextButton(
        onPressed: () {},
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                        color: Colors.black, fontSize: 16, height: 1.3),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    text2,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                text3,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
                textAlign: TextAlign.end,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
