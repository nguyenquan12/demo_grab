// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({super.key});

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, top: 5),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: SizedBox(
                        width: 90,
                        height: 90,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/images/avatar.png',
                                color: Colors.green,
                                width: 90,
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              alignment: Alignment(1, 1),
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(255, 0, 0, 0.1),
                                        blurRadius: 10,
                                        spreadRadius: 1,
                                        offset: Offset(0, 1),
                                      )
                                    ]),
                                child: Icon(
                                  Icons.create,
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              'Nguyễn Quân',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/images/infinity.png',
                                  color: Colors.orange,
                                  width: 40,
                                  height: 40,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                    text: '  Đăng ký  ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  WidgetSpan(
                                      child: Icon(
                                    Icons.keyboard_arrow_right,
                                    size: 16,
                                    color: Colors.grey,
                                  ))
                                ]))
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 15, top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    noiDungMethod('Ưu đãi và tiết kiệm'),
                    SizedBox(height: 20),
                    textButtonMethod('Rewards'),
                    textButtonMethod('Gói Hội Viên'),
                    textButtonMethod('Thử thách'),
                    SizedBox(height: 30),
                    noiDungMethod('Tài khoản của tôi'),
                    SizedBox(height: 20),
                    textButtonMethod('Ưu đãi cho thành viên'),
                    textButtonMethod('Yêu thích'),
                    textButtonMethod('Phương thức thanh toán'),
                    textButtonMethod('Đã đặt trước'),
                    textButtonMethod('Địa điểm đã lưu'),
                    textButtonMethod('Số liên hệ S.O.S'),
                    textButtonMethod('Trung tâm doanh nghiệp'),
                    SizedBox(height: 30),
                    noiDungMethod('Tổng quát'),
                    SizedBox(height: 20),
                    textButtonMethod('Trung tâm trợ giúp'),
                    textButtonMethod('Cài đặt'),
                    textButtonMethod('Chia sẻ phản hồi'),
                    SizedBox(height: 30),
                    noiDungMethod('Cơ hội'),
                    SizedBox(height: 20),
                    textButtonMethod('Chung tay sống xanh'),
                    textButtonMethod('Lái xe cùng grab'),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Padding noiDungMethod(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Padding textButtonMethod(String text1) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: TextButton(
        onPressed: () {},
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  text1,
                  style:
                      TextStyle(color: Colors.grey, fontSize: 17, height: 1.5),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                  size: 25,
                )
              ],
            ),
            SizedBox(height: 18),
            Divider(
              height: 0.3,
              thickness: 0.3,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
