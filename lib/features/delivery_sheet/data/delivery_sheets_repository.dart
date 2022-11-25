import 'package:driver_timesheet_app/features/delivery_sheet/services/delivery_sheets_datastore_service.dart';
import 'package:driver_timesheet_app/models/ModelProvider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final deliverySheetsRepositoryProvider =
    Provider<DeliverySheetsRepository>((ref) {
  DeliverySheetsDataStoreService deliverySheetsDataStoreService =
      ref.read(deliverySheetsDataStoreServiceProvider);
  return DeliverySheetsRepository(deliverySheetsDataStoreService);
});

// final tripsListStreamProvider = StreamProvider.autoDispose<List<Trip?>>((ref) {
//   final tripsRepository = ref.watch(tripsRepositoryProvider);
//   return tripsRepository.getTrips();
// });

// final pastTripsListStreamProvider =
//     StreamProvider.autoDispose<List<Trip?>>((ref) {
//   final tripsRepository = ref.watch(tripsRepositoryProvider);
//   return tripsRepository.getPastTrips();
// });

// final tripProvider =
//     StreamProvider.autoDispose.family<Trip?, String>((ref, id) {
//   final tripsRepository = ref.watch(tripsRepositoryProvider);
//   return tripsRepository.get(id);
// });

class DeliverySheetsRepository {
  DeliverySheetsRepository(this.deliverySheetsDataStoreService);

  final DeliverySheetsDataStoreService deliverySheetsDataStoreService;

  Stream<List<DeliverySheet>> getDeliverySheets() {
    return deliverySheetsDataStoreService.listenToDeliverySheets();
  }

  Future<void> add(DeliverySheet deliverySheet) async {
    await deliverySheetsDataStoreService.addDeliverySheet(deliverySheet);
  }

  Future<void> update(DeliverySheet updatedDeliverySheet) async {
    await deliverySheetsDataStoreService
        .updateDeliverySheet(updatedDeliverySheet);
  }

  Future<void> delete(DeliverySheet deletedDeliverySheet) async {
    await deliverySheetsDataStoreService
        .deleteDeliverySheet(deletedDeliverySheet);
  }

  Stream<DeliverySheet> get(String id) {
    return deliverySheetsDataStoreService.getDeliverySheetStream(id);
  }
}
