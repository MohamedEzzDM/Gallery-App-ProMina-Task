import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/routes/app_routes.dart';
import 'core/utils/app_constance.dart';
import 'core/utils/pref_constants.dart';
import 'injection_container.dart';

class GalleryApp extends StatelessWidget {
  const GalleryApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      builder: (context, child) {
        AppConstance.isLoggedIn =
        (sl<SharedPreferences>().getString(PrefConstants.isLoggedInKey)) !=
            null
            ? true
            : false;

        return MaterialApp(
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: AppConstance.isLoggedIn == true
              ? Routes.galleryRoute
              : Routes.initialRoute,
        );
      },
    );
  }
}