import 'package:drag_training/post_editor.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen.dart';
import '../screens/image_select_screen.dart';
import '../screens/template_result_screen.dart';
import '../screens/template_selection_screen.dart';
import '../utils/routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutes.homeScreenRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.imageSelectScreenRoute:
        return MaterialPageRoute(builder: (_) => const ImageSelectScreen());
      case AppRoutes.templateResultScreenRoute:
        return MaterialPageRoute(builder: (_) => TemplateResultScreen());
      case AppRoutes.templateSelectionScreenRoute:
        return MaterialPageRoute(
            builder: (_) => const TemplateSelectionScreen());
      case AppRoutes.postEditorScreenRoute:
        return MaterialPageRoute(builder: (_) => PostEditor());

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
