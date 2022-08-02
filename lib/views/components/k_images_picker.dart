import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class KImagesPicker extends StatefulWidget {
  const KImagesPicker(
      {Key? key,
        required this.onImagesSaved,
      })
      : super(key: key);

  final Function(List<XFile>? images)? onImagesSaved;

  @override
  State<KImagesPicker> createState() => _KImagesPickerState();
}

class _KImagesPickerState extends State<KImagesPicker> {

  List<XFile>? _images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: _pickImage, icon: Icon(Icons.add_a_photo)),
        if(_images != null && _images!.isNotEmpty)
          Column(
            children: [
              const SizedBox(height: 40),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Wrap(
                  children: _images!
                      .map((e) => _ThumbnailImage(
                    imageFile: File(e.path),
                    onRemove: () {
                      setState(() {
                        _images!.remove(e);
                      });
                      _saveImages();
                    },
                  ))
                      .toList(),
                ),
              )
            ],
          )
    ]
    );
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final List<XFile>? images = await imagePicker.pickMultiImage();
    if (images != null) {
      setState(() {
        if (_images != null && _images!.isNotEmpty) {
          _images = [..._images!, ...images];
        } else {
          _images = images;
        }
        _saveImages();
      });
    }
  }

  void _saveImages() =>
      widget.onImagesSaved!(_images);

}

class _ThumbnailImage extends StatelessWidget {
  const _ThumbnailImage({Key? key, required this.imageFile, required this.onRemove}) : super(key: key);
  final File imageFile;
  final VoidCallback onRemove;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topStart,
      fit: StackFit.passthrough,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(
                    10.0)),
            clipBehavior: Clip.antiAlias,
            child: Image.file(imageFile,
                fit: BoxFit.cover,
                height: 75,
                width: 70),
          ),
        ),
        Container(
            margin: const EdgeInsetsDirectional
                .only(start: 0, top: 0),
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red),
            child: IconButton(
                onPressed: onRemove,
                icon: const Icon(Icons.clear,
                    color: Colors.white),
                iconSize: 15)),
      ],
    );
  }
}


