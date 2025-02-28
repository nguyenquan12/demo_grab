import 'package:flutter/material.dart';
import 'package:grab_app/messenger/chat.dart';

import 'notification.dart';

class Messenger extends StatefulWidget {
  const Messenger({super.key});

  @override
  State<Messenger> createState() => _MessengerState();
}

class _MessengerState extends State<Messenger>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static int _select = 0;

  void _onItemTapped(int index) {
    setState(() {
      _select = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Tin nhắn',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  _select == 1 ? Icons.delete_outlined : null,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TabBar(
                controller: _tabController,

                indicator: BoxDecoration(),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black87,
                indicatorColor: Colors.transparent,
                labelStyle: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w600), // Font đậm hơn
                unselectedLabelStyle:
                    TextStyle(fontSize: 14), // Chỉnh nhẹ font chữ không chọn
                indicatorSize: TabBarIndicatorSize.tab, // Indicator full tab
                onTap: _onItemTapped,
                tabs: [
                  Tab(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15), // Tăng padding
                      child: Text('Trò chuyện'),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Text('Thông báo'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  MyChat(),
                  MyNotification(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
