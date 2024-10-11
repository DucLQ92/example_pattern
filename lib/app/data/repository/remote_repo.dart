import '../model/response/api_base_response.dart';
import '../provider/api_client.dart';

class RemoteRepo {
  static Future<ApiBaseResponse> getListUser() async {
    return await ApiClient().request(url: 'https://randomuser.me/api/?results=10', method: ApiClient.GET);
  }
}
