import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grab_app/enity/food_details.dart';

// Tự động lướt
class ListHorizontalMyGrab extends StatefulWidget {
  const ListHorizontalMyGrab({super.key});

  @override
  State<ListHorizontalMyGrab> createState() => _ListHorizontalMyGrabState();
}

class _ListHorizontalMyGrabState extends State<ListHorizontalMyGrab> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 7), (timer) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.offset + 365,
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      itemCount: 100,
      itemBuilder: (context, index) {
        return Row(
          children: [
            listTextButtonMethod(
              'assets/images/grabFood.jpg',
              'Đặt ngay  ',
              'Cơm Thố Anh Nguyễn mua 1 tặng 1',
              '',
              '',
            ),
            listTextButtonMethod(
              'assets/images/grabFood2.jpg',
              'Xem thêm  ',
              'Tiệc deal chấn động các thương hiệu xịn',
              '',
              '',
            ),
            listTextButtonMethod(
              'assets/images/grabFood3.jpg',
              'Ưu đãi mẹ bỉm  ',
              'Nhận gói dael tiết kiệm 1.090.000đ',
              'QC ',
              ' GrabMart',
            ),
          ],
        );
      },
    );
  }

  Container listTextButtonMethod(
    String image,
    String text1,
    String text2,
    String text3,
    String text4,
  ) {
    return Container(
      margin: EdgeInsets.only(left: 5),
      padding: EdgeInsets.only(right: 8),
      width: MediaQuery.sizeOf(context).width * 9 / 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          InkWell(
            onTap: () {},
            splashColor: Colors.transparent, // Không có hiệu ứng gợn sóng
            highlightColor: Colors.transparent, // Không có hiệu ứng khi giữ
            overlayColor: WidgetStateProperty.all(
                Colors.transparent), // Ngăn chặn màu phủ khi nhấn
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 18,
                ),
              ],
            ),
          ),
          SizedBox(height: 5),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    image,
                    width: 360,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        text2,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: text3,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            WidgetSpan(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Icon(
                                  text3.isNotEmpty
                                      ? Icons.fiber_manual_record
                                      : null,
                                  size: 5,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            TextSpan(
                              text: text4,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Món ngon cho bạn
class ListHorizontalMyFood extends StatefulWidget {
  const ListHorizontalMyFood({super.key});

  @override
  State<ListHorizontalMyFood> createState() => _ListHorizontalMyFoodState();
}

class _ListHorizontalMyFoodState extends State<ListHorizontalMyFood> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(width: 5),
            ...listFoodDetails.map((r) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 2, 0),
                child: listTextButtonMyFoodMethod(r),
              );
            }),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {},
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Container listTextButtonMyFoodMethod(FoodDetails food) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 2 / 5,
      height: MediaQuery.sizeOf(context).height * 1 / 3,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                food.imageURL,
                width: double.infinity,
                height: MediaQuery.sizeOf(context).width * 2 / 5,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 7),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    food.address,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Price
                  Row(
                    children: [
                      Text(
                        food.price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        food.priceMax,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: Colors.grey,
                          decorationThickness: 2,
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Có thể bạn sẽ thích
class ListHorizontalMyFood2 extends StatefulWidget {
  const ListHorizontalMyFood2({super.key});

  @override
  State<ListHorizontalMyFood2> createState() => _ListHorizontalMyFood2State();
}

class _ListHorizontalMyFood2State extends State<ListHorizontalMyFood2> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Row(
          children: [
            SizedBox(width: 5),
            ...listFoodDetails.skip(6).map((e) {
              return listTextButtonMyFoodMethod(e);
            }),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {},
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Container listTextButtonMyFoodMethod(
    FoodDetails food,
  ) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 1 / 2.1,
      padding: EdgeInsets.only(left: 5, right: 5),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                food.imageURL,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food.address,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: food.qc,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Icon(
                              food.qc.isNotEmpty
                                  ? Icons.fiber_manual_record
                                  : null,
                              size: 7,
                            ),
                          ),
                        ),
                        TextSpan(
                          text: food.distance,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        WidgetSpan(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Icon(
                              Icons.fiber_manual_record,
                              size: 7,
                            ),
                          ),
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.star,
                            size: 18,
                            color: Colors.yellow,
                          ),
                        ),
                        TextSpan(
                          text: food.rating,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2),
                  // voucher
                  Container(
                    color: Color.fromRGBO(255, 255, 152, 0.1),
                    padding: EdgeInsets.all(3),
                    child: Text(
                      food.voucher,
                      style: TextStyle(
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Ưu đãi dành cho bạn
class ListHorizontalUuDai extends StatefulWidget {
  const ListHorizontalUuDai({super.key});

  @override
  State<ListHorizontalUuDai> createState() => _ListHorizontalUuDaiState();
}

class _ListHorizontalUuDaiState extends State<ListHorizontalUuDai> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        outlineButtonMethod(
          'assets/images/grabFood3.jpg',
          'Giảm 34K, thêm ưu đãi bên dưới (Chợ Phùng '
              'Khoang - Hoa Quả Tươi)',
          'GrabMart',
        ),
        outlineButtonMethod(
          'assets/images/grabFood3.jpg',
          'Giảm 14K, thêm ưu đãi bên dưới (Bún Mắm - Lẩu Mắm Cô Hoa)',
          'GrabFood',
        ),
        outlineButtonMethod(
          'assets/images/grabFood3.jpg',
          'Giảm 33K, thêm ưu đãi bên dưới (Bún Bò Gốc Huế Mai Đình - Đường 385)',
          'GrabFood',
        ),
      ],
    );
  }

  Padding outlineButtonMethod(
    String image,
    String text1,
    String text2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.green[200],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width * 4 / 5,
          height: MediaQuery.sizeOf(context).height * 1 / 5,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  width: MediaQuery.sizeOf(context).width * 1 / 3.5,
                  height: MediaQuery.sizeOf(context).width * 1 / 3.5,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 2 / 4.6,
                    child: Text(
                      text1,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    text2,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
