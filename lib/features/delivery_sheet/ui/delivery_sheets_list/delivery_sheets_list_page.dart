import 'package:driver_timesheet_app/features/delivery_sheet/controller/delivery_sheets_list_controller.dart';
import 'package:driver_timesheet_app/features/delivery_sheet/ui/delivery_sheet_gridview_item/delivery_sheet_gridview_item.dart';
import 'package:driver_timesheet_app/features/delivery_sheet/ui/delivery_sheets_list/add_delivery_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:driver_timesheet_app/common/utils/colors.dart' as colors;
import 'package:driver_timesheet_app/common/utils/constants.dart' as constants;

class DeliverySheetsListPage extends ConsumerWidget {
  const DeliverySheetsListPage({
    super.key,
  });

  Future<void> showAddTripDialog(BuildContext context) =>
      showModalBottomSheet<void>(
        isScrollControlled: true,
        elevation: 5,
        context: context,
        builder: (sheetContext) {
          return AddDeliverySheet();
        },
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliverySheetsListValue = ref.watch(deliverySheetsListStreamProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          constants.appTitle,
        ),
        backgroundColor: const Color(colors.primaryColorDark),
      ),
      // drawer: const NavigationDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTripDialog(context);
        },
        backgroundColor: const Color(colors.primaryColorDark),
        child: const Icon(Icons.add),
      ),
      body: deliverySheetsListValue.when(
        data: (deliverySheets) => deliverySheets.isEmpty
            ? const Center(
                child: Text('No Trips'),
              )
            : OrientationBuilder(builder: (context, orientation) {
                return GridView.count(
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                  padding: const EdgeInsets.all(4),
                  childAspectRatio:
                      (orientation == Orientation.portrait) ? 0.9 : 1.4,
                  children: deliverySheets.map((deliverySheet) {
                    return DeliverySheetGridViewItem(
                      deliverySheet: deliverySheet!,
                      isPast: false,
                    );
                  }).toList(growable: false),
                );
              }),
        error: (e, st) => const Center(
          child: Text('Error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
