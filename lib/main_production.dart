import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvace/core/di/dependency_injection.dart';
import 'package:flutteradvace/core/routing/app_router.dart';
import 'package:flutteradvace/doc_app.dart';

Future<void> main() async {
  setupGetIt();// To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
