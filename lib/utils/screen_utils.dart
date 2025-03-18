import 'package:flutter/widgets.dart';

bool isMobileScreen(BuildContext context) {
  return MediaQuery.of(context).size.width < 700;
}

bool isTabletScreen(BuildContext context) {
  return MediaQuery.of(context).size.width >= 700 &&
      MediaQuery.of(context).size.width < 1200;
}

bool isDesktopScreen(BuildContext context) {
  return MediaQuery.of(context).size.width >= 1200;
}
