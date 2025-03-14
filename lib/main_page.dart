import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'features/bag/presentation/pages/bag_page.dart';
import 'features/home/home_page.dart';
import 'features/profile/user_profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPagenState createState() => _MainPagenState();
}

class _MainPagenState extends State<MainPage> {
  int _page = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const ShoppingBagPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: _pages[_page],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black45,
        color: Colors.grey[900]!,
        buttonBackgroundColor: Colors.orange,
        height: 60,
        index: _page,
        animationDuration: const Duration(milliseconds: 500),
        animationCurve: Curves.fastLinearToSlowEaseIn,
        items: const [
          Icon(LucideIcons.home, color: Colors.white),
          Icon(LucideIcons.shoppingBag, color: Colors.white),
          Icon(LucideIcons.user, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
