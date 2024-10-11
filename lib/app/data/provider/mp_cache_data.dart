import 'package:isar/isar.dart';

part 'mp_cache_data.g.dart';

@collection
class MPCachedData {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late final String key;
  String? data;

  T? parseData<T>(T Function(String) fromJson) {
    if (data == null || data!.isEmpty) {
      return null;
    }

    try {
      T result = fromJson(data!);
      return result;
    } catch (e) {
      return null;
    }
  }

  @override
  String toString() => 'MPCachedData(id: $id, key: $key, data: $data)';

  @override
  bool operator ==(covariant MPCachedData other) {
    if (identical(this, other)) return true;

    return other.id == id;
  }

  @override
  int get hashCode => id.hashCode ^ key.hashCode ^ data.hashCode;
}
