import 'package:flutter/material.dart';

routingWithReplaceMent(context,Widget newView ){
   Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>  newView,
        ));
}