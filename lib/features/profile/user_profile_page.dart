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
  bool _isPushNotificationEnabled = false;
  bool _isSMSNotificationEnabled = false;

  void _handleToggle(String type, bool value) {
    setState(() {
      if (type == 'push') {
        _isPushNotificationEnabled = value;
      } else {
        _isSMSNotificationEnabled = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: Row(
        children: [
          // Sidebar Menu
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[850],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Menu',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      _buildNavItem(Icons.home, 'Home', false),
                      _buildNavItem(Icons.shopping_cart, 'Cart', true),
                      _buildNavItem(Icons.favorite, 'Favorites', false),
                      _buildNavItem(Icons.history, 'Order History', false),
                      _buildNavItem(Icons.person, 'Profile', false),
                      _buildNavItem(Icons.settings, 'Settings', false),
                      _buildNavItem(Icons.help, 'Help & Support', false),
                      _buildNavItem(Icons.logout, 'Logout', false),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // Profile Content
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
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
                  const SizedBox(height: 30),
                  Text(
                    'Jayson Cartagena',
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 20),

                  // Notification Settings
                  _buildSettingsContainer(
                    title: 'Notification',
                    children: [
                      _buildToggleRow(Icons.notifications_active,
                          'Push Notification', _isPushNotificationEnabled, () {
                        _handleToggle('push', !_isPushNotificationEnabled);
                      }),
                      _buildToggleRow(Icons.sms_rounded, 'SMS Notification',
                          _isSMSNotificationEnabled, () {
                        _handleToggle('sms', !_isSMSNotificationEnabled);
                      }),
                    ],
                  ),

                  // Account Settings
                  _buildSettingsContainer(
                    title: 'Account',
                    children: const [
                      ProfileContainer(
                          icon: Icons.line_style,
                          title: 'Order Selection',
                          color: Colors.white),
                      ProfileContainer(
                          icon: Icons.delivery_dining_rounded,
                          color: Colors.white,
                          title: 'Delivery Address'),
                      SizedBox(height: 10),
                      ProfileContainer(
                          icon: Icons.logout_rounded,
                          color: Colors.orange,
                          title: 'Logout'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Sidebar Navigation Item
  Widget _buildNavItem(IconData icon, String label, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isActive ? Colors.orange : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: isActive ? Colors.white : Colors.grey,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: isActive ? Colors.orange : Colors.white,
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isActive)
            Container(
              width: 4,
              height: 24,
              margin: const EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
        ],
      ),
    );
  }

  // Settings Container
  Widget _buildSettingsContainer(
      {required String title, required List<Widget> children}) {
    return Container(
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
              title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  // Toggle Row
  Widget _buildToggleRow(
      IconData icon, String text, bool isActive, VoidCallback onToggle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconWithText(icon: icon, text: text),
          CustomToggleButton(
            initialValue: isActive,
            onToggle: (_) => onToggle(),
            activeColor: Colors.green,
            inactiveColor: Colors.grey,
            width: 50,
            height: 30,
          ),
        ],
      ),
    );
  }
}
