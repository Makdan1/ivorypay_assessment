import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:ivorypay/app/splashScreen/splashscreen.dart';
import 'package:ivorypay/services/navigation/bottom_navigation.dart';
import 'package:ivorypay/services/navigation/navigator_service.dart';
import 'package:ivorypay/services/navigation/router.dart';
import 'package:ivorypay/utils/app_colors.dart';
import 'package:ivorypay/utils/locator.dart';
import 'package:ivorypay/utils/progress_bar_manager/dialog_manager.dart';
import 'package:ivorypay/utils/progress_bar_manager/dialog_service.dart';
import 'package:ivorypay/utils/storage_util.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  StorageUtil.createSharedPref();
  setupLocator();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(360, 800),
      minTextAdapt: true,
      builder: (context, child) {
        return StyledToast(
          locale: const Locale('en', 'US'),
          toastAnimation: StyledToastAnimation.slideFromTop,
          reverseAnimation: StyledToastAnimation.fade,
          toastPositions: StyledToastPosition.top,
          animDuration: const Duration(seconds: 1),
          duration: const Duration(seconds: 7),
          curve: Curves.elasticOut,
          reverseCurve: Curves.fastLinearToSlowEaseIn,
          dismissOtherOnShow: true,
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              dialogTheme: const DialogTheme(
                backgroundColor: Colors.white,
              ),
              bottomSheetTheme: const BottomSheetThemeData(
                backgroundColor: Colors.white, // Set your default color here
              ),
              scaffoldBackgroundColor: Colors.grey.shade100,
              textTheme: GoogleFonts.interTextTheme(
                Theme.of(context).textTheme,
              ),
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              useMaterial3: true,
              appBarTheme: const AppBarTheme(
                  centerTitle: true,
                  color: Color(0xFFFFFFFF),
                  elevation: 0.0,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Color(0xFFFFFFFF),
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.dark,
                  )),
            ),
            // theme: ThemeData(
            //   colorScheme:
            //       ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
            //   useMaterial3: true,
            // ),
            builder: (context, child) => Navigator(
              key: locator<ProgressService>().progressNavigationKey,
              onGenerateRoute: (settings) =>
                  MaterialPageRoute(builder: (context) {
                return ProgressManager(
                  child: child!,
                );
              }),
            ),
            navigatorKey: locator<NavigatorService>().navigationKey,
            home: const SplashScreen(),
            onGenerateRoute: generateRoute,
          ),
        );
      },
    );
  }
}
