import 'package:flutter/material.dart';

import '../model/text_area_config.dart';

class DragAreaService {
  static DragAreaService shared = DragAreaService();
  Image? templateImage;

  final ValueNotifier<List<TextAreaConfig>> configs = ValueNotifier([
    TextAreaConfig(color: Colors.black, text: "Your text"),
    // TextAreaConfig(),
    // TextAreaConfig(),
  ]);

  ValueNotifier<TextAreaConfig?> activeAreaConfig = ValueNotifier(null);
  ValueNotifier<bool> isDragAreaVisible = ValueNotifier(true);

  setActiveAreaConfig(TextAreaConfig? textAreaConfig) {
    activeAreaConfig.value = textAreaConfig;
    activeAreaConfig.notifyListeners();
  }

  addCopyOfItem() {
    if (activeAreaConfig.value != null) {
      activeAreaConfig.value?.focusNode.unfocus();
      TextAreaConfig copyConfig =
          activeAreaConfig.value!.copyWith(top: 10, left: 10);
      copyConfig.isActive = false;
      configs.value.add(copyConfig);
      configs.notifyListeners();
    }
  }

  removeItem() {
    if (activeAreaConfig.value != null) {
      activeAreaConfig.value?.focusNode.unfocus();
      configs.value.remove(activeAreaConfig.value);
      activeAreaConfig.value = null;
      configs.notifyListeners();
    }
  }

  setVisibility(bool isVisible) {
    isDragAreaVisible.value = isVisible;
    isDragAreaVisible.notifyListeners();
  }

  addFavorite() {}
}
