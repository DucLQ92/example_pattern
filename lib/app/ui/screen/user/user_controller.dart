import 'package:example_pattern/app/action/user/entity/list_user_entitty.dart';
import 'package:example_pattern/app/action/user/user_action.dart';
import 'package:example_pattern/app/data/model/user_model.dart';
import 'package:get/get.dart';

import '../../../data/provider/cache_client.dart';

class UserBinding extends Bindings {
  String title;

  UserBinding({required this.title});

  @override
  void dependencies() {
    Get.put(UserController(title: title));
  }
}

class UserController extends GetxController {
  String title;

  UserController({required this.title});

  RxBool isLoading = false.obs;
  RxString error = ''.obs;
  RxList<UserModel> listUser = RxList();

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  _initData() async {
    isLoading.value = true;
    ListUserEntity listUserEntity = await UserAction.getListUser(cacheOnPriority: true);
    isLoading.value = false;
    error.value = listUserEntity.message ?? '';
    listUser.value = listUserEntity.listUser;
  }

  onPressClearCache() async {
    await CacheClient.instance.clear();
    Get.back();
  }
}
