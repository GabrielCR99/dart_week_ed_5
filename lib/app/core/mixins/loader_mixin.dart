import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void loaderListener(RxBool loading) {
    ever(
      loading,
      (_) async {
        if (loading.isTrue) {
          await Get.dialog(
            WillPopScope(
              onWillPop: () async => false,
              child: const Center(child: CircularProgressIndicator.adaptive()),
            ),
            barrierDismissible: false,
          );
        } else {
          Get.back();
        }
      },
    );
  }
}
