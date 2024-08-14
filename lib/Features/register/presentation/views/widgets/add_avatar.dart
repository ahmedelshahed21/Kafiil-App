import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kafiil_app/Features/register/presentation/views/register_view.dart';
import 'package:kafiil_app/Features/register/presentation/views/widgets/image_source_card.dart';
import 'package:kafiil_app/core/functions/the_image_source_enum.dart';
import 'package:kafiil_app/core/utils/assets_app.dart';
import 'package:kafiil_app/core/utils/constants.dart';

class AddAvatar extends StatefulWidget {
  const AddAvatar({super.key});

  @override
  State<AddAvatar> createState() => _AddAvatarState();
}

class _AddAvatarState extends State<AddAvatar> {


  final imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            buildImageBottomSheet(context);
          },
          child: CircleAvatar(
            backgroundImage: avatar != null
                ? FileImage(avatar!) as ImageProvider
                : const AssetImage(ImagesApp.completeDataImage),
            backgroundColor: kPrimary100Color,
            radius: 41.5,
          ),
        ),
        Positioned(
          bottom: 2,
          left: 58,
          child: GestureDetector(
            onTap: () {
              buildImageBottomSheet(context);
            },
            child: const CircleAvatar(
              backgroundColor: kPrimary900Color,
              radius: 12,
              child: Icon(
                Icons.add,
                size: 20,
              ),
            ),
          ),
        )
      ],
    );
  }

  Future<dynamic> buildImageBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.greenAccent,
      context: context,
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ImageSourceCard(
              icon: Icons.camera_alt,
              iconColor: Colors.black,
              onPressed: () {
                pickImage(imageSource: TheImageSource.camera);
              },
              name: 'Camera',
            ),
            ImageSourceCard(
              icon: Icons.image_rounded,
              iconColor: Colors.black,
              onPressed: () {
                pickImage(imageSource: TheImageSource.gallery);
              },
              name: 'Gallery',
            ),
          ],
        );
      },
    );
  }

  pickImage({required TheImageSource imageSource}) async {
    XFile? pickedImage;
    if (imageSource == TheImageSource.camera) {
      pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
    } else if (imageSource == TheImageSource.gallery) {
      pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    }

    if (pickedImage != null) {
      setState(() {
        avatar = File(pickedImage!.path);
      });
    }
  }
}
