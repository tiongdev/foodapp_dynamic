import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/user_widgets.dart';

class UserMobileView extends StatefulWidget {
  const UserMobileView({super.key});

  @override
  State<UserMobileView> createState() => _UserMobileViewState();
}

class _UserMobileViewState extends State<UserMobileView> {
  final UserWidgets userWidgets = UserWidgets();

  @override
  Widget build(BuildContext context) {
    return Center(
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
                userWidgets.buildMobileNavItem(
                    Icons.delivery_dining_rounded, 'Delivery Address', false),
                userWidgets.buildMobileNavItem(
                    Icons.favorite, 'Favorites', true),
                userWidgets.buildMobileNavItem(
                    Icons.settings, 'Settings', false),
                userWidgets.buildMobileNavItem(
                    Icons.help, 'Help & Support', false),
                userWidgets.buildMobileNavItem(Icons.logout, 'Logout', false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
