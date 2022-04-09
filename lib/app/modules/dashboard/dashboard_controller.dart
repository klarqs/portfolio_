import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class DashboardController extends GetxController {
  RxList<dynamic> monitor = [].obs;
  Rx<bool> isVisible = false.obs;

  void toggle() {
    isVisible.value = !isVisible.value;
  }

  void addToList(value) {
    monitor.add(value);
  }

  void removeFromList() {
    if (monitor.isNotEmpty) {
      monitor.removeLast();
    }
  }


}
