import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;

  const BottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return GNav(
      color: Colors.grey[400],
      activeColor: Colors.grey.shade700,
      tabActiveBorder: Border.all(color: Colors.white),
      tabBackgroundColor: Colors.grey.shade100,
      mainAxisAlignment: MainAxisAlignment.center,
      tabBorderRadius: 8,
      curve: Curves.linear,
      gap: 4,
      tabMargin: EdgeInsetsGeometry.symmetric(vertical: 30),
      padding: EdgeInsetsGeometry.all(15),
      onTabChange: onTabChange,
      tabs: [
        GButton(icon: Icons.home, text: 'Shop'),
        GButton(icon: Icons.shopping_bag_rounded, text: 'Cart'),
      ],
    );
  }
}
