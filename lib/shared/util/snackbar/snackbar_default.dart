import 'package:flutter/material.dart';

import '../../../state_util.dart';

snowSnackBarPrimary(String message) {
  final snackBar = SnackBar(
    content: Text(message),
  );
  ScaffoldMessenger.of(Get.currentContext).showSnackBar(snackBar);
}
