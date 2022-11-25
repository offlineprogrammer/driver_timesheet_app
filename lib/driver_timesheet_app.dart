import 'package:driver_timesheet_app/common/navigation/router/router.dart';
import 'package:flutter/material.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:driver_timesheet_app/common/utils/colors.dart' as constants;

class DriverTimesheetApp extends StatelessWidget {
  const DriverTimesheetApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      child: MaterialApp.router(
        routerConfig: router,
        builder: Authenticator.builder(),
        theme: ThemeData(
          primarySwatch: constants.primaryColor,
          backgroundColor: const Color(0xff82CFEA),
        ),
      ),
    );
  }
}
