import 'package:flutter/material.dart';
import 'package:foodapp_dynamic/features/presentation/pages/bag/layouts/bag_desktop_view.dart';
import 'package:foodapp_dynamic/features/presentation/pages/bag/layouts/bag_tablet_view.dart';

import '../../../../utils/screen_utils.dart';
import '../../widgets/bag_widgets.dart';
import 'layouts/bag_mobile_view.dart';

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

    return Scaffold(
      backgroundColor: Colors.black45,
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
