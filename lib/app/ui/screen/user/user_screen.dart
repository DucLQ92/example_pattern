import 'package:example_pattern/app/data/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'user_controller.dart';

class UserScreen extends GetWidget<UserController> {
  const UserScreen({super.key});

  Widget _buildListView(List<UserModel> listUser) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemBuilder: (c, index) {
        UserModel userModel = listUser[index];
        return Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.network(
                  userModel.picture?.medium ?? '',
                  width: 48,
                  height: 48,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${userModel.name?.title} ${userModel.name?.first}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${userModel.location?.state}, ${userModel.location?.city}, ${userModel.location?.country}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black45,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      itemCount: listUser.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text(controller.title),
        actions: [
          TextButton(
            onPressed: controller.onPressClearCache,
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            child: Text(
              'Xoá bộ nhớ đệm'.tr,
            ),
          ),
        ],
      ),
      body: Center(
        child: Obx(
          () => controller.isLoading.value
              ? const CupertinoActivityIndicator()
              : controller.listUser.value.isNotEmpty
                  ? _buildListView(controller.listUser.value)
                  : Text(controller.error.value),
        ),
      ),
    );
  }
}
