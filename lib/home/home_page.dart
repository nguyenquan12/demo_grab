import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gap/gap.dart';
import 'package:grab_app/Activitys/activity.dart';
import 'package:grab_app/account/account.dart';
import 'package:grab_app/list_Horizontal.dart';
import 'package:grab_app/messenger/messenge.dart';
import 'package:grab_app/pay/pay.dart';

class HomePage extends StatefulWidget {
  static final ScrollController _scrollController = ScrollController();

  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int _selectedIndex = 0; // Xác định tab hiện tại.

  bool _isVisible = true;

  static final List<Widget> _widgetOptions = <Widget>[
    MyGrab(),
    Activity(),
    Pay(),
    Messenger(),
    MyAccount(),
  ];

  // Thay đổi tab khi bấm vào.
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      print('Giá trị hiện tại là: $_selectedIndex');
    });
  }

  @override
  void initState() {
    super.initState();

    HomePage._scrollController.addListener(() {
      if (HomePage._scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        // ScrollDirection.reverse: cuộn lên
        setState(() {
          _isVisible = false;
        });
      } else if (HomePage._scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        // ScrollDirection.forward: cuộn xuống
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    // double screenWidth = screenSize.width;
    // double screenHeight = screenSize.height;

    // print("Chiều rộng: $screenWidth, Chiều cao: $screenHeight");

    return MaterialApp(
      home: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: _isVisible ? kBottomNavigationBarHeight : 0.0,
          child: Wrap(
            // Wrap: Loại bỏ lỗi "RenderFlex overflowed"
            children: [
              BottomNavigationBar(
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/icons/home.png'),
                      size: 24,
                    ),
                    label: 'Trang chủ',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/icons/list.png'),
                      size: 24,
                    ),
                    label: 'Hoạt động',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/icons/bankCart.png'),
                      size: 24,
                    ),
                    label: 'Thanh toán',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/icons/messenger.png'),
                      size: 24,
                    ),
                    label: 'Tin nhắn',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      AssetImage('assets/icons/account.png'),
                      size: 24,
                    ),
                    label: 'Tài khoản',
                  ),
                ],
                type: BottomNavigationBarType.shifting,
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                showUnselectedLabels: true,
                selectedFontSize: 0.0,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.grey,
                selectedLabelStyle: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(color: Colors.grey),
                elevation: 20,
              ),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyGrab extends StatefulWidget {
  const MyGrab({super.key});

  @override
  State<MyGrab> createState() => _MyGrabState();
}

class _MyGrabState extends State<MyGrab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: HomePage._scrollController,
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 1 / 7.5,
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).width * 1 / 7.5,
                    color: Color.fromARGB(197, 24, 197, 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Mã QR
                      Container(
                        // alignment: Alignment(-0.88, 0.5),
                        padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).width * 1 / 16,
                        ),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 1 / 6.8,
                          height: MediaQuery.sizeOf(context).width * 1 / 6.8,
                          child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.qr_code_scanner,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                      // Thanh tìm kiếm
                      Container(
                        // alignment: Alignment(0.7, 0.5),
                        padding: EdgeInsets.only(
                          left: MediaQuery.sizeOf(context).width * 1 / 18,
                          top: MediaQuery.sizeOf(context).width * 1 / 16,
                        ),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 2 / 3,
                          height: MediaQuery.sizeOf(context).width * 1 / 6.8,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 4,
                                offset: Offset(2, 4),
                              )
                            ],
                          ),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width * 2 / 4,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        icon: Icon(
                                          Icons.search,
                                          color: Colors.black,
                                        ),
                                        labelText: 'Tìm trên ứng dụng ...',
                                        labelStyle: TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        hintMaxLines: 1,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.grey,
                                  thickness: 0.5,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.favorite_border,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            // Xe máy, ô tô,...
            Row(
              children: [
                expandedMethod('assets/images/motorbike.jpeg', 'Xe máy'),
                expandedMethod('assets/images/car.jpeg', 'Ô tô'),
                expandedMethod('assets/images/food.jpeg', 'Đồ ăn'),
                expandedMethod('assets/images/delivery.jpeg', 'Giao hàng'),
                expandedMethod('assets/images/delivery.jpeg', 'Tất cả'),
              ],
            ),
            Gap(10),

            // Moca, ưu đãi
            Row(
              children: [
                expanded2Method('assets/images/moca.jpeg', 'Kích hoạt', 'Moca'),
                expanded2Method('assets/images/endow.png', 'Ưu đãi', '100+'),
              ],
            ),
            Gap(15),

            // Tự động lướt
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 1 / 3,
              child: ListHorizontalMyGrab(),
            ),

            // Món ngon cho bạn
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                  child: InkWell(
                    onTap: () {},
                    splashColor:
                        Colors.transparent, // Không có hiệu ứng gợn sóng
                    highlightColor:
                        Colors.transparent, // Không có hiệu ứng khi giữ
                    overlayColor: WidgetStateProperty.all(
                        Colors.transparent), // Ngăn chặn màu phủ khi nhấn
                    child: Row(
                      children: [
                        Text(
                          'Món ngon cho bạn  ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 1 / 3.3,
                  child: ListHorizontalMyFood(),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Có thể bạn sẽ thích
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 5),
                  child: InkWell(
                    onTap: () {},
                    splashColor:
                        Colors.transparent, // Không có hiệu ứng gợn sóng
                    highlightColor:
                        Colors.transparent, // Không có hiệu ứng khi giữ
                    overlayColor: WidgetStateProperty.all(
                        Colors.transparent), // Ngăn chặn màu phủ khi nhấn
                    child: Row(
                      children: [
                        Text(
                          'Có thể bạn sẽ thích  ',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 1 / 3.3,
                  child: ListHorizontalMyFood2(),
                ),
              ],
            ),

            // Ưu đãi dành cho bạn
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ưu đãi dành cho bạn',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Gap(10),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 1 / 5,
                    child: ListHorizontalUuDai(),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  // Xe máy, ô tô,...
  Expanded expandedMethod(String image, String text) {
    return Expanded(
      flex: 1,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 65,
              width: 65,
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }

  // Moca, ưu đãi
  Expanded expanded2Method(String image, String text1, String text2) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text1,
                      style: TextStyle(fontSize: 17),
                    ),
                    Gap(5),
                    Text(
                      text2,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      width: 30,
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
