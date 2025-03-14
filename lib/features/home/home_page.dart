import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'desktop_layout.dart';
import 'mobile_layout.dart';
import 'tablet_layout.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = 'All Type';

  // Sample data for sushi items
  final List<Map<String, dynamic>> allSushiItems = [
    {
      'title': 'Nigiri Sushi',
      'price': 25.00,
      'image': 'assets/sushi_bg.png',
      'category': 'Nigiri'
    },
    {
      'title': 'Salmon Sashimi',
      'price': 30.00,
      'image': 'assets/sushi_bg.png',
      'category': 'Sashimi'
    },
    {
      'title': 'Tuna Temaki',
      'price': 20.00,
      'image': 'assets/sushi_bg.png',
      'category': 'Temaki'
    },
    {
      'title': 'California Roll',
      'price': 15.00,
      'image': 'assets/sushi_bg.png',
      'category': 'All Type'
    },
    {
      'title': 'Spicy Tuna Roll',
      'price': 18.00,
      'image': 'assets/sushi_bg.png',
      'category': 'All Type'
    },
    {
      'title': 'Eel Nigiri',
      'price': 22.00,
      'image': 'assets/sushi_bg.png',
      'category': 'Nigiri'
    },
    {
      'title': 'Yellowtail Sashimi',
      'price': 28.00,
      'image': 'assets/sushi_bg.png',
      'category': 'Sashimi'
    },
    {
      'title': 'Salmon Temaki',
      'price': 19.00,
      'image': 'assets/sushi_bg.png',
      'category': 'Temaki'
    },
  ];

  List<Map<String, dynamic>> get filteredSushiItems {
    if (selectedCategory == 'All Type') {
      return allSushiItems;
    } else {
      return allSushiItems
          .where((item) => item['category'] == selectedCategory)
          .toList();
    }
  }

  void updateCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1400;
    final isTablet = screenWidth > 700 && screenWidth <= 1400;

    return Scaffold(
      backgroundColor: Colors.black45,
      body: SafeArea(
        child: Column(
          children: [
            // Header section
            Padding(
              padding: EdgeInsets.all(isDesktop ? 24.0 : 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: isDesktop
                            ? 24
                            : isTablet
                                ? 20
                                : 16,
                        backgroundImage:
                            const AssetImage('assets/sushi_bg.png'),
                      ),
                      SizedBox(width: isDesktop ? 16 : 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Jayson',
                            style: TextStyle(
                              fontSize: isDesktop
                                  ? 28
                                  : isTablet
                                      ? 26
                                      : 24,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Let's Explore Sushi World",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: isDesktop ? 16 : 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      LucideIcons.bell,
                      color: Colors.white,
                      size: isDesktop ? 28 : 24,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            // Main content
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // For desktop layout
                  if (isDesktop) {
                    return DesktopLayout(
                      selectedCategory: selectedCategory,
                      filteredSushiItems: filteredSushiItems,
                      updateCategory: updateCategory,
                    );
                  }
                  // For tablet layout
                  else if (isTablet) {
                    return TabletLayout(
                      selectedCategory: selectedCategory,
                      filteredSushiItems: filteredSushiItems,
                      updateCategory: updateCategory,
                    );
                  }
                  // For mobile layout
                  else {
                    return MobileLayout(
                      selectedCategory: selectedCategory,
                      filteredSushiItems: filteredSushiItems,
                      updateCategory: updateCategory,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
