import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_stepper/easy_stepper.dart';

import '../../../../widgets/bag_container.dart';
import '../../../../widgets/toggle_button.dart';

class ShoppingBagPage extends StatefulWidget {
  const ShoppingBagPage({super.key});

  @override
  State<ShoppingBagPage> createState() => _ShoppingBagPageState();
}

class _ShoppingBagPageState extends State<ShoppingBagPage> {
  bool _isToggled = false;

  void _handleToggle(bool value) {
    setState(() {
      _isToggled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width to determine layout
    final screenWidth = MediaQuery.of(context).size.width;

    // Define breakpoints
    const mobileBreakpoint = 600;
    const tabletBreakpoint = 1024;

    // Determine current device type
    final isMobile = screenWidth < mobileBreakpoint;
    final isTablet =
        screenWidth >= mobileBreakpoint && screenWidth < tabletBreakpoint;
    final isDesktop = screenWidth >= tabletBreakpoint;

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
            ? _buildMobileLayout()
            : isTablet
                ? _buildTabletLayout()
                : _buildDesktopLayout(),
      ),
    );
  }

  // Mobile layout - single column
  Widget _buildMobileLayout() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              const EasyStepper(
                activeStep: 1,
                stepShape: StepShape.circle,
                stepBorderRadius: 15,
                borderThickness: 1,
                lineStyle: LineStyle(
                    lineType: LineType.dotted,
                    lineLength: 100,
                    defaultLineColor: Colors.white),
                stepRadius: 20,
                finishedStepBorderColor: Colors.orange,
                finishedStepTextColor: Colors.orange,
                finishedStepBackgroundColor: Colors.orange,
                activeStepIconColor: Colors.orange,
                showLoadingAnimation: false,
                steps: [
                  EasyStep(
                    customStep: Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    title: 'Cart',
                  ),
                  EasyStep(
                    customStep: Icon(
                      Icons.payment,
                      color: Colors.white,
                    ),
                    title: 'Payment',
                  ),
                  EasyStep(
                    customStep: Icon(
                      Icons.delivery_dining,
                      color: Colors.white,
                    ),
                    title: 'Delivery',
                  ),
                ],
              ),
              // Delivery Time Container
              _buildDeliveryTimeContainer(),
              // Bag Containers
              _buildBagItems(),
              // Add more items button
              _buildAddMoreItemsButton(),
              // Subtotal Container
              _buildSubtotalContainer(),
              // Include Cutlery Container
              _buildCutleryContainer(),
              // Add some extra space at the bottom for scrolling
              const SizedBox(height: 150),
            ],
          ),
        ),
        // Fixed position container for total
        Positioned(
          bottom: 20,
          right: 10,
          left: 10,
          child: _buildTotalContainer(),
        ),
      ],
    );
  }

  // Tablet layout - two columns
  Widget _buildTabletLayout() {
    return Row(
      children: [
        // Left column - 60% width
        Expanded(
          flex: 6,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EasyStepper(
                    activeStep: 1,
                    stepShape: StepShape.circle,
                    stepBorderRadius: 15,
                    borderThickness: 1,
                    lineStyle: LineStyle(
                        lineType: LineType.dotted,
                        lineLength: 100,
                        defaultLineColor: Colors.white),
                    stepRadius: 20,
                    finishedStepBorderColor: Colors.orange,
                    finishedStepTextColor: Colors.orange,
                    finishedStepBackgroundColor: Colors.orange,
                    activeStepIconColor: Colors.orange,
                    showLoadingAnimation: false,
                    steps: [
                      EasyStep(
                        customStep: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        title: 'Cart',
                      ),
                      EasyStep(
                        customStep: Icon(
                          Icons.payment,
                          color: Colors.white,
                        ),
                        title: 'Payment',
                      ),
                      EasyStep(
                        customStep: Icon(
                          Icons.delivery_dining,
                          color: Colors.white,
                        ),
                        title: 'Delivery',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildDeliveryTimeContainer(),
                  _buildBagItems(),
                  _buildAddMoreItemsButton(),
                ],
              ),
            ),
          ),
        ),
        // Right column - 40% width
        Expanded(
          flex: 4,
          child: Container(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSubtotalContainer(),
                  const SizedBox(height: 16),
                  _buildCutleryContainer(),
                  const Spacer(),
                  _buildTotalContainer(isEmbedded: true),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Desktop layout - three columns
  Widget _buildDesktopLayout() {
    return Row(
      children: [
        // Middle column - items - 50% width
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const EasyStepper(
                    activeStep: 1,
                    stepShape: StepShape.circle,
                    stepBorderRadius: 15,
                    borderThickness: 1,
                    lineStyle: LineStyle(
                        lineType: LineType.dotted,
                        lineLength: 100,
                        defaultLineColor: Colors.white),
                    stepRadius: 20,
                    finishedStepBorderColor: Colors.orange,
                    finishedStepTextColor: Colors.orange,
                    finishedStepBackgroundColor: Colors.orange,
                    activeStepIconColor: Colors.orange,
                    showLoadingAnimation: false,
                    steps: [
                      EasyStep(
                        customStep: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        title: 'Cart',
                      ),
                      EasyStep(
                        customStep: Icon(
                          Icons.payment,
                          color: Colors.white,
                        ),
                        title: 'Payment',
                      ),
                      EasyStep(
                        customStep: Icon(
                          Icons.delivery_dining,
                          color: Colors.white,
                        ),
                        title: 'Delivery',
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Your Items',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildDeliveryTimeContainer(),
                  _buildBagItems(),
                  _buildAddMoreItemsButton(),
                ],
              ),
            ),
          ),
        ),
        // Right column - summary - 30% width
        Expanded(
          flex: 3,
          child: Container(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order Summary',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 32),
                          _buildSubtotalContainer(),
                          const SizedBox(height: 24),
                          _buildCutleryContainer(),
                          const SizedBox(height: 24),
                          // Promo code input (desktop only)
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Promo Code',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Enter promo code',
                                          hintStyle: GoogleFonts.poppins(
                                            color: Colors.grey,
                                            fontSize: 14,
                                          ),
                                          filled: true,
                                          fillColor: Colors.grey[800],
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            borderSide: BorderSide.none,
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 12,
                                          ),
                                        ),
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.orange,
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 16,
                                          vertical: 12,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Text(
                                        'Apply',
                                        style: GoogleFonts.poppins(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24), // Prevents spacing issues
                          _buildTotalContainer(isEmbedded: true),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Common widgets used across layouts
  Widget _buildDeliveryTimeContainer() {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: 70,
              child: Image.asset(
                'assets/sushi_bg2.jpg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivery Time',
                style: GoogleFonts.poppins(color: Colors.orange),
              ),
              Text(
                'Standard (10-15 mins)',
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Change',
                style: GoogleFonts.poppins(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBagItems() {
    return const Column(
      children: [
        BagContainer(food: 'Yummy hotdog ni Franksel'),
        BagContainer(food: 'Sushi shi shi fu'),
        BagContainer(food: 'Food Name'),
        BagContainer(food: 'Food Name'),
      ],
    );
  }

  Widget _buildAddMoreItemsButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              color: Colors.orange,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '+ Add more items',
                  style: GoogleFonts.poppins(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubtotalContainer() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: double.infinity,
          color: Colors.grey[900],
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '\$100',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Fee',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '\$0',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "You've got free delivery! sushi pro",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCutleryContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Include Cutlery',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                  ),
                ),
                CustomToggleButton(
                  initialValue: _isToggled,
                  onToggle: _handleToggle,
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  width: 40,
                  height: 25,
                )
              ],
            ),
            Text(
              'kahit humingi ka ng cutlery di kita bibigyan',
              style: GoogleFonts.poppins(
                color: Colors.orange,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalContainer({bool isEmbedded = false}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isEmbedded ? Colors.grey[850] : Colors.grey[900],
        borderRadius: BorderRadius.circular(25),
        boxShadow: isEmbedded
            ? null
            : [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: isEmbedded ? 18 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '\$100',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: isEmbedded ? 18 : 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                color: Colors.orange,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      'Review Payment and Address',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
