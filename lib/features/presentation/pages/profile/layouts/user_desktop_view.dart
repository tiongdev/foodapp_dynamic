import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/user_widgets.dart';

class UserDesktopView extends StatefulWidget {
  const UserDesktopView({super.key});

  @override
  State<UserDesktopView> createState() => _UserDesktopViewState();
}

class _UserDesktopViewState extends State<UserDesktopView> {
  final UserWidgets userWidgets = UserWidgets();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 600,
          width: 800,
          color: Colors.grey[850],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: Colors.orange,
                          height: 150,
                          width: 200,
                          child: userWidgets.buildDesktopNavItem(
                              Icons.delivery_dining_rounded,
                              'Delivery Address',
                              false),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: Colors.orange,
                          height: 150,
                          width: 200,
                          child: userWidgets.buildDesktopNavItem(
                              Icons.favorite, 'Favorites', false),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: Colors.orange,
                          height: 150,
                          width: 200,
                          child: userWidgets.buildDesktopNavItem(
                              Icons.settings, 'Settings', false),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: Colors.orange,
                        height: 150,
                        width: 200,
                        child: userWidgets.buildDesktopNavItem(
                            Icons.help, 'Help & Support', false),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: Colors.orange,
                        height: 150,
                        width: 200,
                        child: userWidgets.buildDesktopNavItem(
                            Icons.logout_rounded, 'Logout', false),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}