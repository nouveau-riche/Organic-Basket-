import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organic_basket/constant.dart';
import 'package:organic_basket/core/firebase_methods.dart';
import 'package:organic_basket/screens/account_screen.dart';
import 'package:organic_basket/screens/cart_screen.dart';
import 'package:organic_basket/screens/home_screen.dart';
import 'package:organic_basket/screens/order_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {


  String uid = FirebaseAuth.instance.currentUser.uid;

  List<Widget> screens = [
    HomeScreen(),
    OrderScreen(),
    CartScreen(),
    AccountScreen(),
  ];

  int pageIndex = 0;

  void changePage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    FirebaseMethods.getDataFromFirebase(uid);

    return Scaffold(
      body: screens[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: kPrimaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: pageIndex,
        onTap: changePage,
        items: [
          BottomNavigationBarItem(
            icon: pageIndex == 0
                ? Icon(
                    Icons.category,
                    size: 30,
                  )
                : Icon(
                    Icons.category_outlined,
                    size: 30,
                  ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: pageIndex == 1
                ? Icon(Icons.house, size: 30)
                : Icon(Icons.house_outlined, size: 30),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: pageIndex == 2
                ? Icon(Icons.shopping_cart, size: 30)
                : Icon(Icons.shopping_cart_outlined, size: 30),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: pageIndex == 3
                ? Icon(Icons.person, size: 30)
                : Icon(Icons.person_outline, size: 30),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
