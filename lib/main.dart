import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stamp/src/feature/stamp/widget/stamp_app.dart';

void main() => runZonedGuarded(() => runApp(StampApp()), (error, stackTrace) {
  debugPrintStack(label: '$error', stackTrace: stackTrace);
});
