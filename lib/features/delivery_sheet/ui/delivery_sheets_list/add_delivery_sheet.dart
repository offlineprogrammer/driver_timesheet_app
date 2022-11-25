import 'package:driver_timesheet_app/features/delivery_sheet/controller/delivery_sheets_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:intl/intl.dart';

class AddDeliverySheet extends ConsumerWidget {
  AddDeliverySheet({
    super.key,
  });

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deliverySheetDateController = TextEditingController();

    return Form(
      key: formGlobalKey,
      child: Container(
        padding: EdgeInsets.only(
            top: 15,
            left: 15,
            right: 15,
            bottom: MediaQuery.of(context).viewInsets.bottom + 15),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              keyboardType: TextInputType.datetime,
              controller: deliverySheetDateController,
              autofocus: true,
              autocorrect: false,
              decoration: const InputDecoration(hintText: " Date"),
              textInputAction: TextInputAction.next,
              validator: (value) {
                if (value != null && value.isNotEmpty) {
                  return null;
                } else {
                  return 'Enter a valid date';
                }
              },
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101));

                if (pickedDate != null) {
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  deliverySheetDateController.text = formattedDate;
                } else {}
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
                child: const Text('OK'),
                onPressed: () async {
                  final currentState = formGlobalKey.currentState;
                  if (currentState == null) {
                    return;
                  }
                  if (currentState.validate()) {
                    ref.read(deliverySheetsListControllerProvider).add(
                          deliveryDate: deliverySheetDateController.text,
                        );
                    Navigator.of(context).pop();
                  }
                } //,
                ),
          ],
        ),
      ),
    );
  }
}
