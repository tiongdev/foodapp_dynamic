import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/bag_widgets.dart';

class BagDesktopView extends StatefulWidget {
  const BagDesktopView({super.key});

  @override
  State<BagDesktopView> createState() => _BagDesktopViewState();
}

class _BagDesktopViewState extends State<BagDesktopView> {
  final BagWidgets bagWidgets = BagWidgets();
  bool _isToggled = false;
  void _handleToggle(bool value) {
    setState(() {
      _isToggled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  bagWidgets.buildDeliveryTimeContainer(),
                  bagWidgets.buildBagItems(),
                  bagWidgets.buildAddMoreItemsButton(),
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

                          const SizedBox(height: 24),
                          bagWidgets.buildPromoCodeContainer(),
                          const SizedBox(height: 16),
                          bagWidgets.buildCutleryContainer(
                              _isToggled, _handleToggle),
                          const SizedBox(height: 24),
                          // Promo code input (desktop only)

                          const SizedBox(height: 24), // Prevents spacing issues
                          bagWidgets.buildTotalContainer(isEmbedded: true),
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
}
