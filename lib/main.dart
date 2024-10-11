// File main

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/app_binding.dart';
import 'app/res/string/app_strings.dart';
import 'app/ui/screen/splash_screen.dart';
import 'app/util/app_constant.dart';

void mainDelegate() async {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: true,
      initialBinding: AppBinding(),
      home: const SplashScreen(),
      defaultTransition: Transition.fade,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations: AppStrings(),
      supportedLocales: AppConstant.availableLocales.values,
      locale: AppConstant.availableLocales['vi'],
      fallbackLocale: AppConstant.availableLocales['vi'],
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.cyan,
        fontFamily: 'BeVietnamPro',
        textSelectionTheme: const TextSelectionThemeData(selectionHandleColor: Colors.transparent),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.cyan,
        ),
      ),
    ),
  );
}
