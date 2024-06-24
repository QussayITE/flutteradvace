import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvace/core/di/dependency_injection.dart';
import 'package:flutteradvace/core/helpers/constants.dart';
import 'package:flutteradvace/core/helpers/extensions.dart';
import 'package:flutteradvace/core/helpers/shared_pref_helper.dart';
import 'package:flutteradvace/core/routing/app_router.dart';
import 'package:flutteradvace/doc_app.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode.
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}

checkIfLoggedInUser() async {
  String? userToken =
  await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  if (!userToken.isNullOrEmpty()) {
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}
