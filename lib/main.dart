import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stamp/src/feature/main/widget/main_screen.dart';
import 'package:stamp/src/feature/stamp/widget/stamp_app.dart';

void main() => runZonedGuarded(
  () => runApp(
    ProviderScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        ),
        home: HomeScreen(),
      ),
    ),
  ),
  (error, stackTrace) {
    debugPrintStack(label: '$error', stackTrace: stackTrace);
  },
);
