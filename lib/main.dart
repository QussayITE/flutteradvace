import 'package:flutter/material.dart';
import 'package:flutteradvace/core/di/dependency_injection.dart';
import 'package:flutteradvace/core/routing/app_router.dart';
import 'package:flutteradvace/doc_app.dart';

void main() {
  setupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
