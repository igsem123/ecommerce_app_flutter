import 'package:ecommerce_app_flutter/components/bottom_nav_bar.dart';
import 'package:ecommerce_app_flutter/pages/cart_page.dart';
import 'package:ecommerce_app_flutter/pages/shop_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selected index is to control de nav bottom bar
  int _selectedIndex = 0;

  // this method is used to update our selected index in nav bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    // shop page
    const ShopPage(),

    // cart page
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: const Icon(Icons.menu, color: Colors.black),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        shape: BeveledRectangleBorder(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                Container(
                  padding: EdgeInsets.only(top: 48.0, bottom: 32.0),
                  child: SvgPicture.asset(
                    'lib/images/logo.svg',
                    colorFilter: ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcATop,
                    ),
                    fit: BoxFit.fitWidth,
                    height: 60,
                  ),
                ),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(
                    horizontal: 25.0,
                  ),
                  child: Divider(color: Colors.grey[800]),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text(
                      'About',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(
                left: 25.0,
                bottom: 25.0,
              ),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
