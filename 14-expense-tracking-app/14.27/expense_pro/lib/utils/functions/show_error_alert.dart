import 'package:flutter/material.dart';
import 'package:animated_snack_bar/animated_snack_bar.dart';

void showErrorAlert(
  BuildContext context,
  String message,
) {
  AnimatedSnackBar.material(
    message,
    type: AnimatedSnackBarType.error,
  ).show(context);
}
