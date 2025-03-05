// ignore_for_file: unused_import

import 'package:flutter/material.dart';

class Pay extends StatefulWidget {
  const Pay({super.key});

  @override
  State<Pay> createState() => _PayState();
}

class _PayState extends State<Pay> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1 / 2.4,
                  child: Stack(
                    children: [
                      // image
                      Image.asset(
                        'assets/images/pay.jpeg',
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                      // Thanh toán
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Thanh toán',
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Cách thức thanh toán tiện lợi nhất',
                                    style: TextStyle(
                                      fontSize: 17,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.settings_outlined,
                                size: 35,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Activate Moca Wallet
                      Container(
                        alignment: Alignment(0, 0.8),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Card(
                          elevation: 8,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width:
                                  MediaQuery.sizeOf(context).width * 1 / 1.15,
                              height:
                                  MediaQuery.sizeOf(context).height * 1 / 4.5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  alignment: Alignment.bottomCenter,
                                  image: AssetImage(
                                    'assets/images/image1.jpeg',
                                  ),
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Activate Moca Wallet
                                  Container(
                                    width: MediaQuery.sizeOf(context).width *
                                        1 /
                                        2.5,
                                    padding: EdgeInsets.only(left: 15, top: 15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Activate',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          'Moca Wallet',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            height: 1.5,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  // Button add
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(),
                                      Container(
                                        margin: EdgeInsets.only(
                                          right: 12,
                                          bottom: 5,
                                        ),
                                        width: 50,
                                        height: 50,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[600],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.add,
                                            size: 30,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                // Thêm thẻ'
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 1 / 1.1,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen[500],
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // image
                          ClipRRect(
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: ImageIcon(
                                AssetImage(
                                  'assets/icons/bankCart.png',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),

                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 2 / 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Thêm thẻ
                                Text(
                                  'Thêm thẻ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    height: 2,
                                  ),
                                ),
                                // Thanh toán dễ dàng hơn với thẻ tín dụng hóa đơn
                                Text(
                                  'Thanh toán dễ dàng hơn với thẻ tín dụng hóa đơn',
                                  style: TextStyle(
                                    fontSize: 12,
                                    height: 1.2,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                // list floatingActionButton
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height * 1 / 9,
                    child: ListHorizontalPay(),
                  ),
                ),
                // divider : dòng kẻ ngang
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 30,
                    thickness: 0.3,
                    color: Colors.grey,
                  ),
                ),
                // Đề xuất cho bạn
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Đề xuất cho bạn',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          expandedMethod(
                            'assets/images/napTienDT.png',
                            'Nạp tiền ĐT để giữ kết nối',
                          ),
                          SizedBox(width: 10),
                          expandedMethod(
                            'assets/images/hoaDonDT.jpg',
                            'Thanh toán hóa đơn mọi lúc',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 60,
                    thickness: 0.3,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Giao dịch gần đây',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/whitePaper.png',
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                      Text(
                        'Không có hoạt động nào gần đây',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Xem các giao dịch trước đó',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Đề xuất cho bạn
  Expanded expandedMethod(String image, String text) {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: MediaQuery.sizeOf(context).width * 1 / 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                image,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListHorizontalPay extends StatefulWidget {
  const ListHorizontalPay({super.key});

  @override
  State<ListHorizontalPay> createState() => _ListHorizontalPayState();
}

class _ListHorizontalPayState extends State<ListHorizontalPay> {
  @override
  Widget build(BuildContext context) {
    return ListView(scrollDirection: Axis.horizontal, children: [
      Row(
        children: [
          floatingActionButtonMethod(Icons.card_giftcard, 'Nạp tiền'),
          floatingActionButtonMethod(Icons.qr_code, 'Quét để thanh toán'),
          floatingActionButtonMethod(Icons.arrow_right_alt, 'Gửi'),
          floatingActionButtonMethod(Icons.food_bank, 'Rút tiền'),
          floatingActionButtonMethod(Icons.payment, 'Add card'),
        ],
      ),
    ]);
  }

  Padding floatingActionButtonMethod(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        onPressed: () {},
        icon: Icon(
          icon,
          color: Colors.green,
          size: 20,
        ),
        label: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: 12),
        ),
        elevation: 4,
      ),
    );
  }
}
