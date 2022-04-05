import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:lots_/app/modules/transaction_history/models/transaction_history_model.dart';

class TransactionHistoryController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    getTransactionHistory();
    super.onInit();
  }

  final String uri =
      'https://api-sandbox.renmoney.com/deposit-transfer/api/v3/investment/3580016662/transactions';
  final String token =
      'Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiIyMzQ4OTkzOTQ5NjMzIiwiaWF0IjoxNjQ5MTU4MTYxLCJleHAiOjE2NDkyNDQ1NjF9.3lrLEUtExrTgR0vQuYNF7PID2Vq09flx980tSGmtfwb927UjMOY3zhxm94leT4tetNOzNz_aM7UYaNAzJZIFJA';
  final String sourceAppId = 'ckpu7zo0p0000gg5436coo7xs';

  Future<TransactionHistoryModel> getTransactionHistory() async {
    if (kDebugMode) {
      print('Starting...');
    }
    var response = await get(Uri.parse(uri),
        headers: {"Authorization": token, "sourceappid": sourceAppId});
    TransactionHistoryModel data =
        TransactionHistoryModel.fromJson(jsonDecode(response.body));
    return data;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
