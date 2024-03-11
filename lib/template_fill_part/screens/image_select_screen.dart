import 'package:flutter/material.dart';
import '../helperFunctions/relative_value_functions_mixin.dart';
import '../utils/routes.dart';
import '../services/current_template_service.dart';
import '../widgets/image_selector.dart';

class ImageSelectScreen extends StatefulWidget {
  const ImageSelectScreen({
    super.key,
  });

  @override
  State<ImageSelectScreen> createState() => _ImageSelectScreenState();
}

class _ImageSelectScreenState extends State<ImageSelectScreen>
    with RelativeValueFunctions {
  @override
  void initState() {
    super.initState();
  }

  getImagePickersLayout() {
    List images = CurrentTemplateService.instance.imageLayers;
    List<Widget> imageAreas = [];
    for (var element in images) {
      imageAreas.add(ImageSelector(userImage: element));
    }
    return imageAreas;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Center(
              child: Stack(children: [
            SizedBox(
              height: CurrentTemplateService.instance.deviceSize!.height,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: getImagePickersLayout(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(width: double.infinity),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AppRoutes.templateResultScreenRoute);
                      },
                      child: const Text("See Result")),
                ),
              ],
            )
          ])),
        ),
      ),
    );
  }
}
