import 'package:example_pattern/app/app_controller.dart';
import 'package:example_pattern/app/res/string/app_strings.dart';
import 'package:example_pattern/app/ui/screen/user/user_controller.dart';
import 'package:example_pattern/app/ui/screen/user/user_screen.dart';
import 'package:example_pattern/app/util/app_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
        actions: [
          TextButton(
            onPressed: () {
              Locale? locale = AppConstant.availableLocales['vi'];
              if (AppGlobalState.instance.currentLocale.value.languageCode == 'vi') {
                locale = AppConstant.availableLocales['en'];
              }
              AppGlobalState.instance.updateCurrentLocale(locale);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: Text(
              'Đổi ngôn ngữ'.tr,
            ),
          ),
        ],
        leading: const SizedBox.shrink(),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Xin chào'.tr,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 24),
            TextButton(
              onPressed: () {
                Get.to(() => const UserScreen(),
                    binding: UserBinding(title: AppStrings.getString('Danh sách người dùng')));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.black87,
                foregroundColor: Colors.white,
              ),
              child: Text(
                'Danh sách người dùng'.tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
