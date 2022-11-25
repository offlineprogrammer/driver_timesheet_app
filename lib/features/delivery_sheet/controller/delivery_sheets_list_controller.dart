import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:driver_timesheet_app/features/delivery_sheet/data/delivery_sheets_repository.dart';

import 'package:driver_timesheet_app/models/ModelProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deliverySheetsListControllerProvider =
    Provider<DeliverySheetsListController>((ref) {
  return DeliverySheetsListController(ref);
});

final deliverySheetsListStreamProvider =
    StreamProvider.autoDispose<List<DeliverySheet?>>((ref) {
  return ref.watch(deliverySheetsListControllerProvider).getDeliverySheets();
});

final deliverySheetProvider =
    StreamProvider.autoDispose.family<DeliverySheet?, String>((ref, id) {
  return ref.watch(deliverySheetsListControllerProvider).get(id);
});

class DeliverySheetsListController {
  DeliverySheetsListController(this.ref);
  final Ref ref;

  Future<void> add({
    required String deliveryDate,
  }) async {
    DeliverySheet trip = DeliverySheet(
      delivery_sheet_date: TemporalDate(DateTime.parse(deliveryDate)),
    );

    final deliverySheetsRepository = ref.read(deliverySheetsRepositoryProvider);

    await deliverySheetsRepository.add(trip);
  }

  Stream<List<DeliverySheet>> getDeliverySheets() {
    final deliverySheetsRepository = ref.read(deliverySheetsRepositoryProvider);

    return deliverySheetsRepository.getDeliverySheets();
  }

  Stream<DeliverySheet> get(String id) {
    final deliverySheetsRepository = ref.read(deliverySheetsRepositoryProvider);

    return deliverySheetsRepository.get(id);
  }
}
