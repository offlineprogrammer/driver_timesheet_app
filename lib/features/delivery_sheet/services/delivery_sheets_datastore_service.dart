import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:driver_timesheet_app/models/ModelProvider.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deliverySheetsDataStoreServiceProvider =
    Provider<DeliverySheetsDataStoreService>((ref) {
  final service = DeliverySheetsDataStoreService();
  return service;
});

class DeliverySheetsDataStoreService {
  DeliverySheetsDataStoreService();

  Stream<List<DeliverySheet>> listenToDeliverySheets() {
    return Amplify.DataStore.observeQuery(
      DeliverySheet.classType,
      sortBy: [DeliverySheet.DELIVERY_SHEET_DATE.ascending()],
    )
        .map((event) => event.items
            .where((element) => element.delivery_sheet_date!
                .getDateTime()
                .isAfter(DateTime.now()))
            .toList())
        .handleError(
      (dynamic error) {
        debugPrint('listenToTrips: A Stream error happened');
      },
    );
  }

  Stream<DeliverySheet> getDeliverySheetStream(String id) {
    final tripStream = Amplify.DataStore.observeQuery(DeliverySheet.classType,
            where: DeliverySheet.ID.eq(id))
        .map((event) => event.items.toList().single);

    return tripStream;
  }

  Future<void> addDeliverySheet(DeliverySheet deliverySheet) async {
    try {
      await Amplify.DataStore.save(deliverySheet);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> deleteDeliverySheet(DeliverySheet deliverySheet) async {
    try {
      await Amplify.DataStore.delete(deliverySheet);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }

  Future<void> updateDeliverySheet(DeliverySheet updatedDeliverySheet) async {
    try {
      final deliverySheetsWithId = await Amplify.DataStore.query(
        DeliverySheet.classType,
        where: DeliverySheet.ID.eq(updatedDeliverySheet.id),
      );

      final oldDeliverySheet = deliverySheetsWithId.first;
      final newDeliverySheet = oldDeliverySheet.copyWith(
        id: oldDeliverySheet.id,
        delivery_sheet_date: updatedDeliverySheet.delivery_sheet_date,
        delivery_sheet_times: updatedDeliverySheet.delivery_sheet_times,
      );

      await Amplify.DataStore.save(newDeliverySheet);
    } on Exception catch (error) {
      debugPrint(error.toString());
    }
  }
}
