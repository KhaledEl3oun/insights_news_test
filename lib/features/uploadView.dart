import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/local_storge.dart';
import 'package:insights_news/core/navigator.dart';
import 'package:insights_news/core/showDailog.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widget/custom_button.dart';
import 'package:insights_news/features/home/view/navBar.dart';

class uploadView extends StatefulWidget {
  const uploadView({super.key});

  @override
  State<uploadView> createState() => _uploadViewState();
}

String name = '';
String? path;

class _uploadViewState extends State<uploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  appLocal.cacheData(appLocal.name_key, name);
                  appLocal.cacheData(appLocal.image_key, path);
                  appLocal.cacheData(appLocal.isUpload_key, true);
                  routingWithReplaceMent(context, const navBar());
                } else if (path == null && name.isNotEmpty) {
                  showDailog(context, 'please upload your image');
                } else if (path != null && name.isEmpty) {
                  showDailog(context, 'please upload your name');
                } else {
                  showDailog(context, 'please upload your image and your name');
                }
              },
              child: Text(
                'Done',
                style: getSmallStyle(color: appColors.lemonadaColor),
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: path != null
                      ? FileImage(File(path!)) as ImageProvider
                      : const AssetImage('assets/proIcon.png'),
                ),
                const Gap(25),
                SizedBox(
                  height: 40,
                  width: 220,
                  child: customButton(
                      onPressed: () {
                        uploadFromCamera();
                      },
                      text: 'Upload from camera'),
                ),
                const Gap(10),
                SizedBox(
                  width: 220,
                  height: 40,
                  child: customButton(
                      onPressed: () {
                        uploadFromGallery();
                      },
                      text: 'Upload from gallery'),
                ),
                const Gap(20),
                Divider(
                  color: appColors.lemonadaColor,
                  endIndent: 10,
                  indent: 10,
                ),
                const Gap(25),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: appColors.lemonadaColor,
                    ),
                    hintText: 'Enter Your Name',
                  ),
                  style: TextStyle(color: appColors.whiteColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  uploadFromCamera() async {
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }

  uploadFromGallery() async {
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        path = pickedImage.path;
      });
    }
  }
}
