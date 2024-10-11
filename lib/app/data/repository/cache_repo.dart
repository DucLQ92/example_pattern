import 'dart:convert';

import 'package:example_pattern/app/data/provider/cache_client.dart';
import 'package:example_pattern/app/data/provider/mp_cache_data.dart';

import '../model/user_model.dart';

class CacheRepo {
  static saveListUser(List<UserModel> listUser) async {
    await CacheClient.instance.save(MPCachedData()
      ..key = 'cacheListUser'
      ..data = jsonEncode(listUser.map((e) => e.toJson()).toList()));
  }

  static Future<List<UserModel>> getListUser() async {
    MPCachedData? cachedData = await CacheClient.instance.getByKey('cacheListUser');
    if (cachedData?.data != null) {
      return (jsonDecode(cachedData!.data ?? '[]') as List).map((e) => UserModel.fromJson(e)).toList();
    }
    return [];
  }
}
