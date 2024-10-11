import 'package:example_pattern/app/data/model/user_model.dart';

class ListUserEntity {
  List<UserModel> listUser;
  String? message;

  ListUserEntity({required this.listUser, this.message});
}
