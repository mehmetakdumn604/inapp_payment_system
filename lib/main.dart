import 'package:flutter/material.dart';
import 'package:inapp_payment_system/services/payment_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';


class PaymentWidget extends StatelessWidget {
  const PaymentWidget({
    Key? key,
    this.notAvailableTxt = "This store is not available.",
    required this.productWidget,
    required this.onTapToBuy,
  }) : super(key: key);

  final String notAvailableTxt;
  final Widget productWidget;
  final Function(Offerings offerings) onTapToBuy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: PaymentService.isConfigured(),
        builder: (context, isConfigured) {
          if (!isConfigured.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (isConfigured.data == null || !isConfigured.data!) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  notAvailableTxt,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          }
          return FutureBuilder<Offerings>(
              future: PaymentService.getOfferings(),
              builder: (context, offeringsSnapshot) {
                if (!offeringsSnapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (offeringsSnapshot.data!.current == null) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        notAvailableTxt,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
                return productWidget;
              });
        },
      ),
    );
  }
}
