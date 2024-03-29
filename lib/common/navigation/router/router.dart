import 'package:driver_timesheet_app/common/navigation/router/routes.dart';
import 'package:driver_timesheet_app/features/delivery_sheet/ui/delivery_sheet_page/delivery_sheet_page.dart';
import 'package:driver_timesheet_app/features/delivery_sheet/ui/delivery_sheets_list/delivery_sheets_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.home.name,
      builder: (context, state) => const DeliverySheetsListPage(),
    ),
    GoRoute(
      path: '/deliverysheet/:id',
      name: AppRoute.deliverySheet.name,
      builder: (context, state) {
        final deliverySheetId = state.params['id']!;
        return DeliverySheetPage(deliverySheetId: deliverySheetId);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text(state.error.toString()),
    ),
  ),
);
