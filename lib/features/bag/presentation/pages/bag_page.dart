import 'package:flutter/material.dart';
import 'package:foodapp_dynamic/features/bag/presentation/pages/bag_desktop_view.dart';
import 'package:foodapp_dynamic/features/bag/presentation/pages/bag_tablet_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/screen_utils.dart';
import '../widgets/bag_widgets.dart';
import 'bag_mobile_view.dart';

class ShoppingBagPage extends StatefulWidget {
  const ShoppingBagPage({super.key});

  @override
  State<ShoppingBagPage> createState() => _ShoppingBagPageState();
}

class _ShoppingBagPageState extends State<ShoppingBagPage> {
  final BagWidgets bagWidgets = BagWidgets();

  @override
  Widget build(BuildContext context) {
    bool isMobile = isMobileScreen(context);
    bool isTablet = isTabletScreen(context);
    bool isDesktop = isDesktopScreen(context);

    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Shopping Bag',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        actions: [
          if (isDesktop || isTablet)
            IconButton(
              icon: const Icon(Icons.favorite_border, color: Colors.white),
              onPressed: () {},
            ),
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: isMobile
            ? BagMobileView()
            : isTablet
                ? const BagTabletView()
                : const BagDesktopView(),
      ),
    );
  }
}
