import 'package:driver_timesheet_app/models/ModelProvider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:driver_timesheet_app/common/utils/colors.dart' as colors;

class DeliverySheetGridViewItemCard extends StatelessWidget {
  const DeliverySheetGridViewItemCard({
    required this.deliverySheet,
    super.key,
  });

  final DeliverySheet deliverySheet;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5.0,
      child: Column(
        children: [
          Expanded(
            child: Container(
              height: 500,
              alignment: Alignment.center,
              color: const Color(colors.primaryColorDark),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'images/amplify.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    bottom: 16,
                    left: 16,
                    right: 16,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        DateFormat('MMMM dd, yyyy').format(
                          deliverySheet.delivery_sheet_date!.getDateTime(),
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
