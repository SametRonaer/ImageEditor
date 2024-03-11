import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/user_image_layer_model.dart';
import '../helperFunctions/size_setter_functions.dart';
import '../services/current_template_service.dart';

class ImageSelector extends StatefulWidget {
  const ImageSelector({super.key, required this.userImage, this.isTile = true});
  final UserImageLayerModel userImage;
  final bool isTile;
  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector>
    with SizeSetterFunctions {
  XFile? selectedImage;

  getTileImageSelector() {
    Size imageSize = calculateUserImageSize(widget.userImage);
    return GestureDetector(
      onTap: () async {
        ImagePicker picker = ImagePicker();
        selectedImage = await picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: imageSize.height,
          maxWidth: imageSize.width,
        );
        if (selectedImage == null) {
          return;
        }

        Uint8List imageBytes = await selectedImage!.readAsBytes();

        await decodeImageFromList(imageBytes).then((value) async {
          UserImageLayerModel imageLayer = CurrentTemplateService
              .instance.currentDesignDocument!.images
              .firstWhere((element) => element.id == widget.userImage.id);
          imageLayer.image = value;
          // imageLayer.angle = 90;
          // await CurrentTemplateService.instance
          //     .setRotatedImages(userImage: imageLayer);
        });
        setState(() {});
      },
      child: Container(
        width: double.infinity,
        height: 120,
        color: Colors.black12,
        alignment: Alignment.centerLeft,
        child: selectedImage != null
            ? SizedBox(
                width: 120,
                height: 120,
                child: Image.file(File(selectedImage!.path)))
            : Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.black,
                  width: 2,
                )),
                width: 110,
                height: 110,
              ),
      ),
    );
  }

  getImageArea() {
    return Positioned(
      top: widget.userImage.relativePosition!.height,
      left: widget.userImage.relativePosition!.width,
      child: GestureDetector(
        onTap: () async {
          ImagePicker picker = ImagePicker();
          selectedImage = await picker.pickImage(
            source: ImageSource.gallery,
            //maxHeight: widget.userImage.relativeSize!.height,
            //maxWidth: widget.userImage.relativeSize!.width,
          );
          if (selectedImage == null) {
            return;
          }

          Uint8List imageBytes = await selectedImage!.readAsBytes();

          await decodeImageFromList(imageBytes).then((value) {
            CurrentTemplateService.instance.currentDesignDocument!.images
                .firstWhere((element) => element.id == widget.userImage.id)
                .image = value;
          });
          setState(() {});
        },
        child: Container(
            width: widget.userImage.relativeSize!.height,
            height: widget.userImage.relativeSize!.height,
            color: Colors.blue,
            child: selectedImage != null
                ? Image.file(File(selectedImage!.path))
                : null),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.isTile ? getTileImageSelector() : getImageArea();
  }
}
