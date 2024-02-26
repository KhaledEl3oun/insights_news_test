import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/local_storge.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/view/profile/showDailog.dart';
import 'package:insights_news/features/uploadView.dart';

class profileView extends StatefulWidget {
  const profileView({super.key});

  @override
  State<profileView> createState() => _profileViewState();
}

class _profileViewState extends State<profileView> {
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: path != null
                      ? FileImage(File(path!)) as ImageProvider
                      : const AssetImage('assets/person.png'),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: GestureDetector(
                    onTap: () {},
                    child: GestureDetector(
                      onTap: () {
                        showImageailog(context);
                      },
                      child: CircleAvatar(
                        backgroundColor: appColors.lemonadaColor,
                        radius: 20,
                        child: Icon(
                          Icons.camera_alt,
                          size: 30,
                          color: appColors.whiteColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(20),
            Divider(
              height: 50,
              thickness: 1,
              color: appColors.lemonadaColor,
            ),
            const Gap(20),
            TextFormField(
              onChanged: (value) {},
              style: getSmallStyle(color: appColors.whiteColor),
              decoration: InputDecoration(
                  hintText: name,
                  hintStyle: TextStyle(
                    color: appColors.lemonadaColor,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
