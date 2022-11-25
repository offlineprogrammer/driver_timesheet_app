import 'package:driver_timesheet_app/features/delivery_sheet/data/delivery_sheets_repository.dart';
import 'package:driver_timesheet_app/models/ModelProvider.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final deliverySheetControllerProvider =
    Provider<DeliverySheetController>((ref) {
  return DeliverySheetController(ref);
});

class DeliverySheetController {
  DeliverySheetController(this.ref);
  final Ref ref;

  Future<void> edit(DeliverySheet updatedDeliverySheet) async {
    final deliverySheetsRepository = ref.read(deliverySheetsRepositoryProvider);
    await deliverySheetsRepository.update(updatedDeliverySheet);
  }

  Future<void> delete(DeliverySheet deletedDeliverySheet) async {
    final deliverySheetsRepository = ref.read(deliverySheetsRepositoryProvider);
    await deliverySheetsRepository.delete(deletedDeliverySheet);
  }
}
