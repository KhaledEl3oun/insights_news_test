import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insights_news/core/local_storge.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';

class header extends StatefulWidget {
  const header({
    super.key,
  });

  @override
  State<header> createState() => _headerState();
}

class _headerState extends State<header> {
  String? name;
  String? path;
  @override
  void initState() {
    super.initState();
    appLocal.getCacheData(appLocal.name_key).then((value) {
      setState(() {
        name = value;
      });
    });
    appLocal.getCacheData(appLocal.image_key).then((value) {
      setState(() {
        path = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              'Hello,$name',
              style: getTitleStyle(color: appColors.lemonadaColor),
            ),
            Text(
              'Have a nice day',
              style: getSmallStyle(),
            ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          radius: 27,
          backgroundColor: appColors.whiteColor,
          child: CircleAvatar(
            radius: 25,
            backgroundImage: path != null
                ? FileImage(File(path!)) as ImageProvider
                : const AssetImage('assets/proIcon.png'),
          ),
        )
      ],
    );
  }
}
