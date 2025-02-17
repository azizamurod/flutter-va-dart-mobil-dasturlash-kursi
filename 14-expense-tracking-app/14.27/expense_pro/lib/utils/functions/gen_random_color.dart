import 'dart:math';

import 'package:flutter/material.dart';

Color genRandomColor() {
  return Color.fromRGBO(
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
    1,
  );
}
