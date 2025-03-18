import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

import '../widgets/bag_widgets.dart';

class BagMobileView extends StatefulWidget {
  @override
  _BagMobileViewState createState() => _BagMobileViewState();
}

class _BagMobileViewState extends State<BagMobileView> {
  bool _isToggled = false;

  void _handleToggle(bool value) {
    setState(() {
      _isToggled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final BagWidgets bagWidgets = BagWidgets();
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
              bagWidgets.buildDeliveryTimeContainer(),
              // Bag Containers
              bagWidgets.buildBagItems(),
              // Add more items button
              bagWidgets.buildAddMoreItemsButton(),
              // Subtotal Container
              bagWidgets.buildSubtotalContainer(),
              // Include Cutlery Container

              const SizedBox(height: 100),
            ],
          ),
        ),
        // Fixed position container for total
        Positioned(
          bottom: 20,
          right: 10,
          left: 10,
          child: bagWidgets.buildTotalContainer(),
        ),
      ],
    );
  }
}
