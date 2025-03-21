import 'package:flutter/material.dart';
import 'package:foodapp_dynamic/features/presentation/pages/profile/layouts/user_desktop_view.dart';
import 'package:foodapp_dynamic/features/presentation/pages/profile/layouts/user_mobile_view.dart';

import '../../../../utils/screen_utils.dart';
import '../../widgets/user_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserWidgets userWidgets = UserWidgets();

  @override
  Widget build(BuildContext context) {
    bool isMobile = isMobileScreen(context);

    return Scaffold(
      backgroundColor: Colors.black45,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                isMobile ? const UserMobileView() : const UserDesktopView()
              ]),
        ),
      ),
    );
  }
}
