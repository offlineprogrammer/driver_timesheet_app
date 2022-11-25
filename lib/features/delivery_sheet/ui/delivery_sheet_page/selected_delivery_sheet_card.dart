import 'package:driver_timesheet_app/features/delivery_sheet/controller/trip_controller.dart';
import 'package:driver_timesheet_app/features/delivery_sheet/ui/delivery_sheet_page/delete_delivery_sheet_dialog.dart';
import 'package:driver_timesheet_app/models/ModelProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:driver_timesheet_app/common/navigation/router/routes.dart';
import 'package:driver_timesheet_app/common/utils/colors.dart' as colors;

import 'package:intl/intl.dart';

class SelectedDeliverySheetCard extends ConsumerWidget {
  const SelectedDeliverySheetCard({
    required this.deliverySheet,
    super.key,
  });

  final DeliverySheet deliverySheet;

  Future<bool> deleteTrip(
      BuildContext context, WidgetRef ref, DeliverySheet deliverySheet) async {
    var value = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return const DeleteDeliverySheetDialog();
        });
    value ??= false;

    if (value) {
      await ref.read(deliverySheetControllerProvider).delete(deliverySheet);
    }
    return value;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            DateFormat('MMMM dd, yyyy').format(
              deliverySheet.delivery_sheet_date!.getDateTime(),
            ),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            alignment: Alignment.center,
            color: const Color(colors.primaryColorDark),
            height: 150,
            child: Image.asset(
              'images/amplify.png',
              fit: BoxFit.contain,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  // context.goNamed(
                  //   AppRoute.edittrip.name,
                  //   params: {'id': trip.id},
                  //   extra: trip,
                  // );
                },
                icon: const Icon(Icons.edit),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.camera_enhance_sharp),
              ),
              IconButton(
                onPressed: () {
                  deleteTrip(context, ref, deliverySheet).then((value) {
                    if (value) {
                      context.goNamed(
                        AppRoute.home.name,
                      );
                    }
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          )
        ],
      ),
    );
  }
}
