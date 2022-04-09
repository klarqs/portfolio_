import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lots_/app/modules/login/models/error_login_model.dart';
import 'package:lots_/app/utils/colors.dart';

import '../../bottom_tabs/views/bottom_tabs.dart';

class LoginController extends GetxController {
  TextEditingController tagController = TextEditingController(),
      passwordController = TextEditingController();

  final String uri = 'https://merchant-bk.azapay.ng/api/v1/auth/signin';

  var tagErrorText = ''.obs;
  var passwordErrorText = ''.obs;
  var isLoading = false.obs;

  DateTime? dob;

  clearTagErrorText(val) => tagErrorText.value = '';
  clearPasswordErrorText(val) => passwordErrorText.value = '';

  validateTextForm(context) {
    if (tagController.text == '') {
      return tagErrorText.value = 'Add Tag';
    } else if (passwordController.text == '') {
      return passwordErrorText.value = 'Add Password';
    } else {
      login(context);
    }
  }

  Future<dynamic> login(context) async {
    // try {
      isLoading.value = true;
      var res = await post(
        Uri.parse(uri),
        body: {
          "tag": tagController.text,
          "password": passwordController.text,
        },
        encoding: Encoding.getByName('utf-8'),
      );

      ErrorLoginModel data = ErrorLoginModel.fromJson(jsonDecode(res.body));

      // if (data.status == 409 || data.status == 400) {
      //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //     content: Text(
      //       data.message.toString(),
      //       textAlign: TextAlign.center,
      //     ),
      //     backgroundColor: CustomColors.redColor,
      //     behavior: SnackBarBehavior.floating,
      //   ));
      //   isLoading.value = false;
      // } else {
      //   isLoading.value = false;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomTabs(
              tabIndex: 0,
            ),
          ),
        );
    //   }
    // } catch (e) {
      isLoading.value = false;
    //   if (kDebugMode) {
    //     print('Error: ${e.toString()}');
    //   }
    // }
  }
}
