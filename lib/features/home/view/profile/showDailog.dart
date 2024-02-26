import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/local_storge.dart';
import 'package:insights_news/core/utils/appColors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/features/home/view/profile/profileView.dart';
import 'package:insights_news/features/uploadView.dart';

showImageailog(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: appColors.containerBgColor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      uploadFromCamera();
                      setState(() {});
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: appColors.lemonadaColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Upload From Camera ',
                          style: TextStyle(color: appColors.scaffColor)),
                    ),
                  ),
                  const Gap(20),
                  GestureDetector(
                    onTap: () {
                      uploadFromGallery();
                      setState(() {});
                    },
                    child: Container(
                      height: 45,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: appColors.lemonadaColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('Upload From Gallery',
                          style: TextStyle(color: appColors.scaffColor)),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

showNameeDailog(context) {
  var textcon = TextEditingController(text: name);
  var formKey = GlobalKey<FormState>();
  showModalBottomSheet(
    isScrollControlled: true,
    backgroundColor: appColors.containerBgColor,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))),
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      style:
                          getSmallStyle(color: Theme.of(context).primaryColor),
                      controller: textcon,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'your Name mustn\'t be empty';
                        } else {
                          return null;
                        }
                      },
                      decoration:
                          const InputDecoration(hintText: 'Enter Your Name'),
                    ),
                    const Gap(20),
                    GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          appLocal.cacheData(appLocal.name_key, textcon.text);
                          Navigator.of(context).pop();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => const profileView()));
                        }
                      },
                      child: Container(
                        height: 45,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: appColors.lemonadaColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text('Upload  Your Name',
                            style: TextStyle(color: appColors.whiteColor)),
                      ),
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}

uploadFromGallery({setState}) async {
  var pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    path = pickedImage.path;
    appLocal.cacheData(appLocal.image_key, pickedImage.path);
  }
}

uploadFromCamera({setState}) async {
  var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

  if (pickedImage != null) {
    path = pickedImage.path;
    appLocal.cacheData(appLocal.image_key, pickedImage.path);
  }
}
