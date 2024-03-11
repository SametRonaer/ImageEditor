import 'dart:convert';

import 'package:flutter/material.dart';

import '../dummy_data/image_dummy_data.dart';
import '../dummy_data/template_data_with_thumbnalils.dart';
import '../services/current_template_service.dart';
import '../utils/routes.dart';

class TemplateSelectionScreen extends StatelessWidget {
  const TemplateSelectionScreen({super.key});

  Future<void> renderLayers(String template, BuildContext context) async {
    CurrentTemplateService.instance.setScaleOfUserImages(context);
    CurrentTemplateService.instance.deviceSize = context.size;
    await CurrentTemplateService.instance.renderLayerImages();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Please select a story template...",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.lightBlue,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      //alignment: WrapAlignment.center,
                      children: [
                        // const SizedBox(width: double.infinity),
                        // getSelectionWidget(
                        //     context: context,
                        //     template: demoTemplate,
                        //     templateName: "Template 1"),
                        // getSelectionWidget(
                        //     context: context,
                        //     template: workOutToday,
                        //     templateName: "Template 2"),
                        // getSelectionWidget(
                        //   context: context,
                        //   template: love,
                        //   templateName: "Template 3",
                        // ),
                        // getSelectionWidget(
                        //   context: context,
                        //   template: demoSecond,
                        //   templateName: "Template 4",
                        // ),
                        // getSelectionWidget(
                        //   context: context,
                        //   template: calibration1,
                        //   templateName: "Template 5",
                        // ),
                        // getSelectionWidget(
                        //   context: context,
                        //   template: calibrationWithImage,
                        //   templateName: "Template 6",
                        // ),
                        getSelectionWidget(
                          context: context,
                          template: demoWithThumbnail,
                          templateName: "Template 8",
                        ),
                        getSelectionWidget(
                          context: context,
                          template: newAdventuresWithThumbnail,
                          templateName: "Template 7",
                        ),
                        getSelectionWidget(
                          context: context,
                          template: newAdventuresWithThumbnail2,
                          templateName: "Template 7",
                        ),
                        // getSelectionWidget(
                        //   context: context,
                        //   template: calibrationWithThumbnail,
                        //   templateName: "Template 8",
                        // ),
                        // getSelectionWidget(
                        //   context: context,
                        //   template: calibrationWithThumbnail2,
                        //   templateName: "Template 8",
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector getSelectionWidget({
    required BuildContext context,
    required String template,
    required String templateName,
  }) {
    CurrentTemplateService.instance.setCurrentDesignDocument(template);
    String? thumbnail =
        CurrentTemplateService.instance.currentDesignDocument?.thumbnail;

    return GestureDetector(
        onTap: () async {
          CurrentTemplateService.instance.setCurrentDesignDocument(template);
          await renderLayers(template, context).then((value) {
            Navigator.of(context).pushNamed(AppRoutes.imageSelectScreenRoute);
          });
        },
        child:
            //thumbnail == null ?
            Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(8),
          height: 250,
          width: 130,
          color: thumbnail == null ? Colors.blue : Colors.grey,
          child: thumbnail == null
              ? Text(templateName)
              : Image.memory(
                  (base64Decode(thumbnail)),
                  fit: BoxFit.fitWidth,
                ),
        )
        // : SizedBox(
        //     height: 250,
        //     child: Image.memory(
        //       (base64Decode(thumbnail)),
        //       fit: BoxFit.fitWidth,
        //     ),
        //   ),
        );
  }
}
