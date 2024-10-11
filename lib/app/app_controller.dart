import 'dart:ui';

import 'package:example_pattern/app/data/provider/cache_client.dart';
import 'package:example_pattern/app/util/app_constant.dart';
import 'package:get/get.dart';

class AppController extends SuperController {
  Rx<Locale> rxCurrentLocale = (AppConstant.availableLocales['vi'] ?? const Locale('vi', 'VN')).obs;

  @override
  void onInit() {
    super.onInit();
    CacheClient.instance.init();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onDetached() {}

  @override
  void onInactive() {}

  @override
  void onPaused() {}

  @override
  void onResumed() {}

  @override
  void onHidden() {}
}

class AppGlobalState {
  late AppController _appController;
  static AppGlobalState? _instance;

  AppGlobalState._privateConstructor() {
    _appController = Get.find<AppController>();
  }

  static AppGlobalState get instance {
    return _instance ??= AppGlobalState._privateConstructor();
  }

  updateCurrentLocale(Locale? locale) {
    _appController.rxCurrentLocale.value = locale ?? const Locale('vi', 'VN');
    Get.updateLocale(locale ?? const Locale('vi', 'VN'));
  }

  Rx<Locale> get currentLocale => _appController.rxCurrentLocale;
}
