import 'package:flutter/material.dart';

import '../utils/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Device aspect ratio");
    Size size = MediaQuery.of(context).size;
    print(size.width / size.height);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pushNamed(AppRoutes.imageSelectScreenRoute);
          },
          child: Text("Select Image"),
        ),
      ),
    );
  }
}
