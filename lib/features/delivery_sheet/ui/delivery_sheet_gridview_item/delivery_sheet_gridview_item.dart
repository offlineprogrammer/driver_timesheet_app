import 'package:driver_timesheet_app/features/delivery_sheet/ui/delivery_sheet_gridview_item/delivery_sheet_gridview_item_card.dart';
import 'package:driver_timesheet_app/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:driver_timesheet_app/common/navigation/router/routes.dart';
import 'package:driver_timesheet_app/common/utils/colors.dart' as colors;

class DeliverySheetGridViewItem extends StatelessWidget {
  const DeliverySheetGridViewItem({
    required this.deliverySheet,
    required this.isPast,
    super.key,
  });

  final DeliverySheet deliverySheet;
  final bool isPast;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        context.goNamed(
          AppRoute.deliverySheet.name,
          params: {'id': deliverySheet.id},
        );
      },
      child: isPast
          ? ColorFiltered(
              colorFilter: const ColorFilter.matrix(colors.greyoutMatrix),
              child: DeliverySheetGridViewItemCard(
                deliverySheet: deliverySheet,
              ))
          : DeliverySheetGridViewItemCard(
              deliverySheet: deliverySheet,
            ),
    );
  }
}
