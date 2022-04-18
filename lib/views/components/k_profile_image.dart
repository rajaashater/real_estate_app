import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_estate_app/utils/theme/app_colors.dart';

class KProfileImage extends StatefulWidget {
  const KProfileImage({Key? key, this.onImageSelected}) : super(key: key);
  final void Function(XFile image)? onImageSelected;
  @override
  State<KProfileImage> createState() => _KProfileImageState();
}

class _KProfileImageState extends State<KProfileImage> {

  final ImagePicker _picker = ImagePicker();

  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 50,
          child: CircleAvatar(
            backgroundColor: AppColors.primary,
            radius: 49,
            child: CircleAvatar(
              radius: 45,
              backgroundImage:
              image != null ? FileImage(File(image!.path)) : const AssetImage('assets/images/personal.jpg') as ImageProvider,
            ),
          ),
        ),
        PositionedDirectional(
          bottom: 0,
          end: 0,
          child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle
              ),
              child: IconButton(icon: const Icon(Icons.edit),
                  onPressed: () async {
                XFile? newImage = await _picker.pickImage(source: ImageSource.gallery);
                    setState(() {
                      image = newImage;
                    });
                    if(widget.onImageSelected != null){
                      widget.onImageSelected!(image!);
                    }
                  }
              )),
        )
      ],
    );
  }
}
