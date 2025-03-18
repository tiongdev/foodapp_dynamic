import 'package:flutter/material.dart';
import 'package:foodapp_dynamic/features/profile/user_mobile_view.dart';

import '../../utils/screen_utils.dart';
import 'user_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isPushNotificationEnabled = false;
  bool _isSMSNotificationEnabled = false;
  final UserWidgets userWidgets = UserWidgets();

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
    bool isMobile = isMobileScreen(context);

    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: Row(
          children: [
            isMobile
                ? UserMobileView()
                :
                // Profile Content
                Expanded(
                    flex: 4,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),

                          // Notification Settings
                          userWidgets.buildSettingsContainer(
                            title: 'Notification',
                            children: [
                              userWidgets.buildToggleRow(
                                  Icons.notifications_active,
                                  'Push Notification',
                                  _isPushNotificationEnabled, () {
                                _handleToggle(
                                    'push', !_isPushNotificationEnabled);
                              }),
                              userWidgets.buildToggleRow(
                                  Icons.sms_rounded,
                                  'SMS Notification',
                                  _isSMSNotificationEnabled, () {
                                _handleToggle(
                                    'sms', !_isSMSNotificationEnabled);
                              }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
