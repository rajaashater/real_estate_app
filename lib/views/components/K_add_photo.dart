// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:real_estate_app/utils/theme/app_colors.dart';
//
// class KAddImages extends StatefulWidget {
//   const KAddImages({Key? key, this.onImageSelected}) : super(key: key);
//   final void Function(XFile image)? onImageSelected;
//   @override
//   State<KAddImages> createState() => _KAddImagesState();
// }
//
// class _KAddImagesState extends State<KAddImages> {
//
//   final ImagePicker _picker = ImagePicker();
//
//   List<XFile>? images;
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Container(
//         decoration: const BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.rectangle
//         ),
//         child: IconButton(icon: const Icon(Icons.add_a_photo),
//             onPressed: () async {
//               setState(() {
//                 images =
//               });
//               if (widget.onImageSelected != null) {
//                 widget.onImageSelected!(images!);
//               }
//             }
//         ),
//       );
//
//   }
// }
