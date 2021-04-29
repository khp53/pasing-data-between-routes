import 'package:flutter/material.dart';

import 'screens/details.dart';
import 'screens/summary.dart';
import 'models/mock_data.dart';

// TODO complete the code in createRoute()
//
Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) =>
            SummaryScreen(evaluator: mockData[2].member, assessments: mockData),
      );
    case 'detail':
      return MaterialPageRoute(
          builder: (context) => DetailsScreen(
                assessment: settings.arguments,
              ));
  }
  return null;
}
