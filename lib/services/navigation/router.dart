import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ivorypay/services/analytics_service.dart';
import 'package:ivorypay/services/navigation/bottom_navigation.dart';
import 'package:ivorypay/services/navigation/route_names.dart';
import 'package:ivorypay/utils/base_model.dart';
import 'package:ivorypay/utils/locator.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case bottomNavigationRoute:
      return _getPageRoute(
        routeName: settings.name!,
        viewToShow: const BottomNavigation(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute(
    {required String routeName, required Widget viewToShow}) {
  locator<AnalyticsService>().setCurrentScreen(routeName);
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (BuildContext context) {
        return WillPopScope(
            onWillPop: Platform.isAndroid
                ? () async {
                    if (locator<BaseModel>().busy) {
                      return false;
                    } else {
                      return true;
                    }
                  }
                : null,
            child: viewToShow);
      });
}
