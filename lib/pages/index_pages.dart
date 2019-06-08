import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'member_page.dart';
import 'cart_page.dart';
import 'category_page.dart';

class IndexPages extends StatefulWidget {
  @override
  _IndexPagesState createState() => _IndexPagesState();
}

class _IndexPagesState extends State<IndexPages> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), title: Text('首页')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('分类')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('购物车')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled), title: Text('会员')),
  ];

  final List tabBodies = [HomePage(), CartPage(), CategoryPage(), MemberPage()];

  int _currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    super.initState();
    currentPage = tabBodies[_currentIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            currentPage = tabBodies[_currentIndex];
          });
        },
      ),
      body: currentPage,
    );
  }
}
