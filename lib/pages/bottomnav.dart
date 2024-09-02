import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_work/pages/main/Order.dart';
import 'package:flutter_work/pages/main/Profile.dart';
import 'package:flutter_work/pages/main/home.dart';
import 'package:flutter_work/utility/colours.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  late List<Widget> pages;
  late Home homePage;
  late ProfilePage profilePage;
  late OrderPage orderPage;
  int currentTabIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    homePage = Home();
    orderPage = OrderPage();
    profilePage = ProfilePage();
    pages = [homePage, orderPage, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colours.homePageBGColor,
          color: Colors.black,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (int index) {
            setState(() {
              currentTabIndex = index;
            });
          },
          items: const [
            Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
            ),
            Icon(
              Icons.person_outlined,
              color: Colors.white,
            ),
          ]),
      body: pages[currentTabIndex],
    );
  }
}
