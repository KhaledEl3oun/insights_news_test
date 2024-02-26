import 'package:flutter/material.dart';

routingWithReplaceMent(context, Widget newView) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => newView,
  ));
}
