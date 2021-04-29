import 'package:flutter/material.dart';

import 'router.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter_navigation_simple',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: '/',
        onGenerateRoute: createRoute,
      ),
    );
