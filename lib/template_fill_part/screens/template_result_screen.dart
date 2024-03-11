import 'dart:typed_data';

import 'package:drag_training/services/drag_area_service.dart';
import 'package:drag_training/template_fill_part/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../helperFunctions/size_setter_functions.dart';
import '../services/app_draw_service.dart';
import '../services/current_template_service.dart';
import 'dart:ui' as ui;

class TemplateResultScreen extends StatefulWidget {
  const TemplateResultScreen({super.key});

  @override
  State<TemplateResultScreen> createState() => _TemplateResultScreenState();
}

class _TemplateResultScreenState extends State<TemplateResultScreen>
    with SizeSetterFunctions {
  final GlobalKey _globalKey = GlobalKey();

  @override
  void initState() {
    setTemplateImage();
    super.initState();
  }

  bool showTopBar = false;

  @override
  Widget build(BuildContext context) {
    Size canvasSize = calculateDeviceCanvasSize();
    return RepaintBoundary(
      key: _globalKey,
      child: Scaffold(
        appBar: showTopBar
            ? AppBar(
                actions: [
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.postEditorScreenRoute);
                      },
                      child: const Icon(Icons.navigate_next))
                ],
              )
            : null,
        backgroundColor: Colors.black,
        body: Center(
          child: Container(
            height: canvasSize.height,
            width: canvasSize.width,
            color: hexToColor(CurrentTemplateService
                .instance.currentDesignDocument!.backgroundColor),
            child: CustomPaint(
                painter: AppDrawService(
              canvasSize: canvasSize,
              context: context,
            )),
          ),
        ),
      ),
    );
  }

  setTemplateImage() async {
    await Future.delayed(const Duration(milliseconds: 50));
    RenderRepaintBoundary boundary =
        // ignore: use_build_context_synchronously
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));

    if (byteData != null) {
      DragAreaService.shared.templateImage = Image.memory(
        byteData.buffer.asUint8List(),
        fit: BoxFit.fitWidth,
      );
      setState(() {
        showTopBar = true;
      });
    }
  }

  Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
