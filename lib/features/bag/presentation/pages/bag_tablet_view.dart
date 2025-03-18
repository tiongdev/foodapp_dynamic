import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:foodapp_dynamic/features/bag/presentation/widgets/bag_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class BagTabletView extends StatefulWidget {
  const BagTabletView({super.key});

  @override
  State<BagTabletView> createState() => _BagTabletViewState();
}

class _BagTabletViewState extends State<BagTabletView> {
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
                  bagWidgets.buildDeliveryTimeContainer(),
                  bagWidgets.buildBagItems(),
                  bagWidgets.buildAddMoreItemsButton(),
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(minHeight: constraints.maxHeight),
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
                          bagWidgets.buildSubtotalContainer(),
                          const SizedBox(height: 16),
                          bagWidgets.buildPromoCodeContainer(),
                          const SizedBox(height: 16),
                          bagWidgets.buildCutleryContainer(
                              _isToggled, _handleToggle),
                          const SizedBox(height: 16),
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
