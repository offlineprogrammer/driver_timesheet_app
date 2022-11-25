import 'package:driver_timesheet_app/features/delivery_sheet/controller/delivery_sheets_list_controller.dart';
import 'package:driver_timesheet_app/features/delivery_sheet/ui/delivery_sheet_page/selected_delivery_sheet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:driver_timesheet_app/common/navigation/router/routes.dart';

import 'package:driver_timesheet_app/common/utils/colors.dart' as colors;
import 'package:driver_timesheet_app/common/utils/constants.dart' as constants;

class DeliverySheetPage extends ConsumerWidget {
  const DeliverySheetPage({
    required this.deliverySheetId,
    super.key,
  });
  final String deliverySheetId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliverySheet = ref.watch(deliverySheetProvider(deliverySheetId));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          constants.appTitle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.goNamed(
                AppRoute.home.name,
              );
            },
            icon: const Icon(Icons.home),
          ),
        ],
        backgroundColor: const Color(colors.primaryColorDark),
      ),
      //drawer: const NavigationDrawer(),
      floatingActionButton: deliverySheet.when(
        data: (trip) => FloatingActionButton(
          onPressed: () {
            // context.goNamed(
            //   AppRoute.addactivity.name,
            //   params: {'id': deliverySheetId},
            // );
          },
          backgroundColor: const Color(colors.primaryColorDark),
          child: const Icon(Icons.add),
        ),
        error: (e, st) => const Placeholder(),
        loading: () => const Placeholder(),
      ),
      body: deliverySheet.when(
        data: (trip) => trip == null
            ? const Center(
                child: Text('Trip Not Found'),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  SelectedDeliverySheetCard(deliverySheet: trip),
                  const SizedBox(
                    height: 20,
                  ),
                  const Divider(
                    height: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const Text(
                    'Your Activities',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  // Expanded(
                  //   child: ActivitiesList(
                  //     trip: trip,
                  //   ),
                  // )
                ],
              ),
        error: (e, st) => Center(
          child: Column(
            children: [
              Text(e.toString()),
              TextButton(
                  onPressed: () async {
                    ref.refresh(deliverySheetProvider(deliverySheetId));
                  },
                  child: const Text('Try again')),
            ],
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
