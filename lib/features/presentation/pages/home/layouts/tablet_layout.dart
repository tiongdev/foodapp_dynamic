import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../../widgets/carousel_card.dart';
import '../../../widgets/category_container.dart';
import '../../../widgets/sushi_card.dart';
import '../../product/product_details_page.dart';

class TabletLayout extends StatelessWidget {
  final String selectedCategory;
  final List<Map<String, dynamic>> filteredSushiItems;
  final Function(String) updateCategory;

  const TabletLayout({
    Key? key,
    required this.selectedCategory,
    required this.filteredSushiItems,
    required this.updateCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CategoryChip(
                        label: 'All Type',
                        isSelected: selectedCategory == 'All Type',
                        onTap: () => updateCategory('All Type'),
                      ),
                      CategoryChip(
                        label: 'Sashimi',
                        isSelected: selectedCategory == 'Sashimi',
                        onTap: () => updateCategory('Sashimi'),
                      ),
                      CategoryChip(
                        label: 'Temaki',
                        isSelected: selectedCategory == 'Temaki',
                        onTap: () => updateCategory('Temaki'),
                      ),
                      CategoryChip(
                        label: 'Nigiri',
                        isSelected: selectedCategory == 'Nigiri',
                        onTap: () => updateCategory('Nigiri'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SushiCarousel(selectedCategory: selectedCategory),
          // Grid layout for tablet
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Icon(
                      LucideIcons.crown,
                      color: Colors.orange,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Premium Items',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('See all'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
