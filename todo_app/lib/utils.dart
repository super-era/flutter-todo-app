import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static void getCurrentSnackBar(BuildContext context, String text) => 
    ScaffoldMessenger.of(context)
      .removeCurrentSnackBar(reason: SnackBarClosedReason.remove);
      .showSnackBar(content: Text(text));
}
    