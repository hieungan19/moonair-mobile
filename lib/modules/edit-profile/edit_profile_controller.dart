import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:moonair/core/values/api_url.dart';
import 'package:moonair/data/models/user.dart';
import 'package:moonair/data/services/data_center.dart';
import 'package:moonair/data/services/http_service.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  final name = TextEditingController(text: DataCenter.user?.name).obs;
  final email = TextEditingController(text: DataCenter.user?.email).obs;
  final phoneNumber =
      TextEditingController(text: DataCenter.user?.phoneNumber).obs;
  final country = TextEditingController(text: "Việt Nam").obs;
  Rx<String> gender = (DataCenter.user!.gender ?? 'male').obs;
  Rx<DateTime?> dob = DataCenter.user!.dob.obs;
  final dobText = TextEditingController(
          text: DateFormat('dd/MM/yyyy')
              .format(DataCenter.user!.dob ?? DateTime.now()))
      .obs;
  void setGender(String selectedGender) {
    gender.value = selectedGender;
  }

  Future<void> saveProfile() async {
    try {
      final data = {
        "name": name.value.text,
        "email": email.value.text,
        "phoneNumber": phoneNumber.value.text,
        "country": country.value.text,
        "gender": gender.value,
        "dob": dob.value?.toIso8601String(),
      };

      final response = await HttpService.patchRequest(
          url: UrlValue.editProfile, body: jsonEncode(data));
      if (response.statusCode == 200) {
        print("Edit success");
        final idTemp = DataCenter.user!.id;
        DataCenter.user = UserModel.fromJson(data);
        DataCenter.user!.id = idTemp;
        DataCenter.user!.printUserInfo();
      }
    } catch (error) {
      throw new Error();
    }
  }
}
