import 'package:drag_training/post_editor.dart';
import 'package:drag_training/template_fill_part/services/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StorioApp());
}

class StorioApp extends StatelessWidget {
  const StorioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Storio Demo',
      onGenerateRoute: AppRouter().onGenerateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PostEditor(),
      //home: const TemplateSelectionScreen(),
    );
  }
}
