import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/profile_option_container.dart';
import '../../widgets/toggle_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isToggled = false;

  void _handleToggle(bool value) {
    setState(() {
      _isToggled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(color: Colors.orange),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Jayson Cartagena',
                style: GoogleFonts.poppins(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notification',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const IconWithText(
                                  icon: Icons.notifications_active,
                                  text: 'Push Notification'),
                              CustomToggleButton(
                                initialValue: _isToggled,
                                onToggle: _handleToggle,
                                activeColor: Colors.green,
                                inactiveColor: Colors.grey,
                                width: 50,
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const IconWithText(
                                  icon: Icons.sms_rounded,
                                  text: 'SMS Notification'),
                              CustomToggleButton(
                                initialValue: _isToggled,
                                onToggle: _handleToggle,
                                activeColor: Colors.green,
                                inactiveColor: Colors.grey,
                                width: 50,
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Account',
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const ProfileContainer(
                        icon: Icons.line_style,
                        title: 'Order Selection',
                        color: Colors.white,
                      ),
                      const ProfileContainer(
                        icon: Icons.delivery_dining_rounded,
                        color: Colors.white,
                        title: 'Delivery Address',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ProfileContainer(
                        icon: Icons.logout_rounded,
                        color: Colors.orange,
                        title: 'Logout',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
