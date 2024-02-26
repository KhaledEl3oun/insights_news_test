import 'package:flutter/material.dart';

showDailog(context, String error) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(error),
    backgroundColor: Colors.red,
  ));
}
