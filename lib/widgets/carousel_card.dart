import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';

class SushiCarousel extends StatefulWidget {
  final String selectedCategory;

  const SushiCarousel({super.key, required this.selectedCategory});

  @override
  _SushiCarouselState createState() => _SushiCarouselState();
}

class _SushiCarouselState extends State<SushiCarousel> {
  int _current = 0;

  final List<Map<String, dynamic>> _allItems = [
    {
      "title": "Nigiri Sushi",
      "price": 25.00,
      "description": "Special rice topped with fresh fish",
      "image": "assets/sushi_bg.png",
      "category": "Nigiri",
    },
    {
      "title": "Temaki Sushi",
      "price": 20.00,
      "description": "Hand-rolled cone sushi with fresh ingredients",
      "image": "assets/sushi_bg.png",
      "category": "Temaki",
    },
    {
      "title": "Maki Roll",
      "price": 22.00,
      "description": "Classic rolled sushi with premium fish",
      "image": "assets/sushi_bg.png",
      "category": "All Type",
    },
    {
      "title": "Salmon Sashimi",
      "price": 28.00,
      "description": "Fresh slices of premium salmon",
      "image": "assets/sushi_bg.png",
      "category": "Sashimi",
    },
    {
      "title": "Tuna Nigiri",
      "price": 26.00,
      "description": "Premium tuna on top of seasoned rice",
      "image": "assets/sushi_bg.png",
      "category": "Nigiri",
    },
    {
      "title": "California Roll",
      "price": 18.00,
      "description": "Crab, avocado, and cucumber roll",
      "image": "assets/sushi_bg.png",
      "category": "All Type",
    },
  ];

  List<Map<String, dynamic>> get _filteredItems {
    if (widget.selectedCategory == 'All Type') {
      return _allItems;
    } else {
      return _allItems
          .where((item) => item['category'] == widget.selectedCategory)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;

    // Responsive sizing
    final carouselHeight = isDesktop
        ? 450.0
        : isTablet
            ? 420.0
            : 380.0;
    final containerWidth = isDesktop
        ? 350.0
        : isTablet
            ? 320.0
            : 300.0;
    final containerHeight = isDesktop
        ? 350.0
        : isTablet
            ? 320.0
            : 300.0;
    final imageSize = isDesktop
        ? 250.0
        : isTablet
            ? 230.0
            : 220.0;
    final titleFontSize = isDesktop
        ? 28.0
        : isTablet
            ? 26.0
            : 24.0;
    final priceFontSize = isDesktop
        ? 24.0
        : isTablet
            ? 22.0
            : 20.0;
    final descFontSize = isDesktop
        ? 16.0
        : isTablet
            ? 15.0
            : 14.0;

    // Adjust viewport fraction based on screen size
    final viewportFraction = isDesktop
        ? 0.5
        : isTablet
            ? 0.7
            : 0.85;

    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: _filteredItems.length,
          options: CarouselOptions(
            height: carouselHeight,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            viewportFraction: viewportFraction,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final item = _filteredItems[index];
            return Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                // Details Container
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: containerWidth,
                    height: containerHeight,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(25, imageSize / 2.5, 25, 25),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["title"],
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: titleFontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${item["price"].toStringAsFixed(2)}",
                          style: TextStyle(
                            color: Colors.orange,
                            fontSize: priceFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item["description"],
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: descFontSize,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                // Circular Image
                Positioned(
                  top: 0,
                  child: Container(
                    width: imageSize,
                    height: imageSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.orange.withOpacity(0.5),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 15,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(item["image"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _filteredItems.asMap().entries.map((entry) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange.withOpacity(
                  _current == entry.key ? 0.9 : 0.3,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
