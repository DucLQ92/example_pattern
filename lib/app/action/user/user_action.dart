import 'package:example_pattern/app/data/model/response/api_base_response.dart';
import 'package:example_pattern/app/data/model/user_model.dart';
import 'package:example_pattern/app/data/repository/cache_repo.dart';
import 'package:example_pattern/app/data/repository/remote_repo.dart';

import 'entity/list_user_entitty.dart';

class UserAction {
  static Future<ListUserEntity> getListUser({bool cacheOnError = false, bool cacheOnPriority = false}) async {
    ListUserEntity listUserEntityResult = ListUserEntity(listUser: []);
    List<UserModel> listUserCache = await CacheRepo.getListUser();
    if (cacheOnPriority && listUserCache.isNotEmpty) {
      return listUserEntityResult..listUser = listUserCache;
    }
    ApiBaseResponse apiBaseResponse = await RemoteRepo.getListUser();
    if (apiBaseResponse.success == true) {
      List<UserModel> listUserRemote =
          (apiBaseResponse.data['results'] as List).map((e) => UserModel.fromJson(e)).toList();
      listUserEntityResult.listUser = listUserRemote;
      CacheRepo.saveListUser(listUserRemote);
    } else {
      listUserEntityResult.listUser = cacheOnError ? listUserCache : [];
      listUserEntityResult.message = apiBaseResponse.message;
    }
    return listUserEntityResult;
  }
}
