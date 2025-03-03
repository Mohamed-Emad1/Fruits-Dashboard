import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;
  // FileImage ?fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          isLoading = true;
          final ImagePicker picker = ImagePicker();
          setState(() {});
          // Pick an image.
          try {
            await pickImage(picker);
          } on Exception catch (e) {
            log(e.toString());
          }
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child: imageFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(imageFile!),
                    )
                  : const Icon(
                      Icons.image_outlined,
                      size: 180,
                    ),
            ),
            IconButton(
              onPressed: () {
                imageFile = null;
                widget.onFileChanged(imageFile);
                setState(() {});
              },
              icon: Visibility(
                visible: imageFile != null,
                child: const Icon(
                  color: Colors.black,
                  size: 32,
                  Icons.close,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> pickImage(ImagePicker picker) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    widget.onFileChanged(imageFile!);
  }
}
