import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../widgets/carousel_card.dart';
import '../../../widgets/category_container.dart';
import '../../../widgets/sushi_card.dart';
import '../../product/product_details_page.dart';

class DesktopLayout extends StatelessWidget {
  final String selectedCategory;
  final List<Map<String, dynamic>> filteredSushiItems;
  final Function(String) updateCategory;

  const DesktopLayout({
    super.key,
    required this.selectedCategory,
    required this.filteredSushiItems,
    required this.updateCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Left sidebar with categories
        Container(
          width: 250,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Sushi Category',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  CategoryChip(
                    label: 'All Type',
                    isSelected: selectedCategory == 'All Type',
                    onTap: () => updateCategory('All Type'),
                  ),
                  const SizedBox(height: 8),
                  CategoryChip(
                    label: 'Sashimi',
                    isSelected: selectedCategory == 'Sashimi',
                    onTap: () => updateCategory('Sashimi'),
                  ),
                  const SizedBox(height: 8),
                  CategoryChip(
                    label: 'Temaki',
                    isSelected: selectedCategory == 'Temaki',
                    onTap: () => updateCategory('Temaki'),
                  ),
                  const SizedBox(height: 8),
                  CategoryChip(
                    label: 'Nigiri',
                    isSelected: selectedCategory == 'Nigiri',
                    onTap: () => updateCategory('Nigiri'),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Main content area
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SushiCarousel(selectedCategory: selectedCategory),
                // Grid layout for desktop
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2.5,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),
                    itemCount: filteredSushiItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredSushiItems[index];
                      return SushiCard(
                        title: item['title'],
                        price: item['price'],
                        image: item['image'],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                title: item['title'],
                                price: item['price'],
                                image: item['image'],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                // Premium items section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            LucideIcons.crown,
                            color: Colors.orange,
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Premium Items',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'See all',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
