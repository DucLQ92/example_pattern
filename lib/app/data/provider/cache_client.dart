import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'mp_cache_data.dart';

class CacheClient {
  CacheClient._();

  String? _dirPath;
  Isar? _isar;

  static final _instance = CacheClient._();

  static CacheClient get instance {
    return _instance;
  }

  Future<void> init() async {
    _dirPath ??= (await getApplicationDocumentsDirectory()).path;
    _isar ??= await Isar.open(
      [MPCachedDataSchema],
      directory: _dirPath!,
    );
  }

  Future<void> save(MPCachedData cachedData) async {
    final existedData = await getByKey(cachedData.key);
    if (existedData != null) {
      await _isar!.writeTxn(() async {
        existedData.data = cachedData.data;
        await _isar!.mPCachedDatas.put(existedData); // insert & update
      });
    } else {
      await _isar!.writeTxn(() async {
        await _isar!.mPCachedDatas.put(cachedData); // insert & update
      });
    }
  }

  Future<MPCachedData?> getLatest() async {
    try {
      return (await _isar!.mPCachedDatas.where().findAll()).last;
    } catch (e) {
      return null;
    }
  }

  Future<MPCachedData?> getByKey(String cachedKey) async {
    return await _isar!.mPCachedDatas.getByKey(cachedKey);
  }

  Future<List<MPCachedData>> getAll() async {
    return await _isar!.mPCachedDatas.where().findAll();
  }

  Future<void> deleteByKey(String cachedKey) async {
    await _isar!.writeTxn(() async {
      await _isar!.mPCachedDatas.deleteByKey(cachedKey);
    });
  }

  Future<void> clear() async {
    await _isar!.writeTxn(() async {
      await _isar!.mPCachedDatas.where().deleteAll();
    });
  }
}
