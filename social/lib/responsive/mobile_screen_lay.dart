import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social/utils/glob_var.dart';

class MobileScreenLay extends StatefulWidget {
  const MobileScreenLay({super.key});

  @override
  State<MobileScreenLay> createState() => _MobileScreenLayState();
}

class _MobileScreenLayState extends State<MobileScreenLay> {
  int _page = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: homeScreenItems,
        // physics: NeverScrollableScrollPhysics(),//this blocks horizontal scroll of pages
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _page == 0 ? Colors.white : Colors.grey,
              ),
              label: '',
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: _page == 1 ? Colors.white : Colors.grey,
              ),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: _page == 2 ? Colors.white : Colors.grey,
              ),
              label: '',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: _page == 3 ? Colors.white : Colors.grey,
              ),
              label: '',
              backgroundColor: Colors.redAccent),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _page == 4 ? Colors.white : Colors.grey,
              ),
              label: '',
              backgroundColor: Colors.white),
        ],
        backgroundColor: Colors.black,
        onTap: navigationTapped,
      ),
    );
  }
}
