import 'package:flutter/material.dart';

class SushiCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final VoidCallback onTap;

  const SushiCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 1024;
    final isTablet = screenWidth > 600 && screenWidth <= 1024;

    // Responsive padding and sizing
    final cardPadding = isDesktop ? 16.0 : 12.0;
    final imageHeight = isDesktop
        ? 100.0
        : isTablet
            ? 90.0
            : 80.0;
    final imageWidth = isDesktop
        ? 100.0
        : isTablet
            ? 100.0
            : 90.0;
    final titleFontSize = isDesktop
        ? 22.0
        : isTablet
            ? 20.0
            : 18.0;
    final priceFontSize = isDesktop
        ? 22.0
        : isTablet
            ? 20.0
            : 18.0;
    final smallPriceFontSize = isDesktop
        ? 14.0
        : isTablet
            ? 13.0
            : 12.0;

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(cardPadding),
        child: Container(
          padding: EdgeInsets.all(cardPadding),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(color: Colors.white, width: 0.2),
            borderRadius: BorderRadius.circular(26),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              // Ensuring the image fits the container properly
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image(
                  image: const AssetImage('assets/sushi_bg.png'),
                  height: imageHeight,
                  width: imageWidth,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              // Food Name and Price
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: priceFontSize,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '\$${price.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: smallPriceFontSize,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
