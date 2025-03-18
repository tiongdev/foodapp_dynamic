import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'user_widgets.dart';

class UserMobileView extends StatefulWidget {
  const UserMobileView({super.key});

  @override
  State<UserMobileView> createState() => _UserMobileViewState();
}

class _UserMobileViewState extends State<UserMobileView> {
  final UserWidgets userWidgets = UserWidgets();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Center(
        child: Container(
          color: Colors.grey[850],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(color: Colors.orange),
                      child: const Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
                  const SizedBox(width: 30),
                  Text(
                    'Jayson Cartagena',
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 32),
                  userWidgets.buildNavItem(
                      Icons.delivery_dining_rounded, 'Delivery Address', false),
                  userWidgets.buildNavItem(Icons.favorite, 'Favorites', false),
                  userWidgets.buildNavItem(Icons.settings, 'Settings', false),
                  userWidgets.buildNavItem(Icons.help, 'Help & Support', false),
                  userWidgets.buildNavItem(Icons.logout, 'Logout', false),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
