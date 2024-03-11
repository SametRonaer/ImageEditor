import 'dart:typed_data';

import 'package:drag_training/services/drag_area_service.dart';
import 'package:drag_training/template_fill_part/screens/template_result_screen.dart';
import 'package:drag_training/widgets/drag_widgets/drag_area.dart';
import 'package:drag_training/widgets/post_edit_bottom_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'dart:ui' as ui;
import 'package:image_gallery_saver/image_gallery_saver.dart';

class PostEditor extends StatefulWidget {
  @override
  State<PostEditor> createState() => _PostEditorState();
}

class _PostEditorState extends State<PostEditor> {
  final GlobalKey _globalKey = GlobalKey();
  bool isSaving = false;

  // final ValueNotifier<TextAreaConfig?> _activeTextAreaConfigNotifier =
  //     ValueNotifier<TextAreaConfig?>(null);
  TemplateResultScreen templateResultScreen = TemplateResultScreen();
  Image? templateImage;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: !isSaving ? _getAppBar() : null,
        body: ValueListenableBuilder(
          valueListenable: DragAreaService.shared.isDragAreaVisible,
          builder: (context, value, widget) {
            return Stack(
              children: [
                if (templateImage != null) templateImage!,
                if (DragAreaService.shared.templateImage != null)
                  SizedBox(
                    width: 500,
                    child: DragAreaService.shared.templateImage!,
                  ),
                if (value) DragArea(),
                if (!isSaving) PostEditBottomBar(),
              ],
            );
          },
        ),
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        "Minimal 3",
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            _saveLocalImage();
          },
          child: Icon(
            Icons.file_download,
            color: Colors.pink,
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }

  _saveLocalImage() async {
    setState(() {
      isSaving = true;
    });
    await Future.delayed(const Duration(milliseconds: 50));
    RenderRepaintBoundary boundary =
        // ignore: use_build_context_synchronously
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      await ImageGallerySaver.saveImage(
        byteData.buffer.asUint8List(),
        quality: 100,
      );
    }
    setState(() {
      isSaving = false;
    });
  }
}
