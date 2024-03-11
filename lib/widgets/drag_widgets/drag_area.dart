import 'package:drag_training/services/drag_area_service.dart';
import 'package:drag_training/widgets/drag_widgets/draggable_text_field.dart';
import 'package:flutter/material.dart';

class DragArea extends StatefulWidget {
  const DragArea({
    super.key,
  });

  @override
  State<DragArea> createState() => _DragAreaState();
}

class _DragAreaState extends State<DragArea> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        if (DragAreaService.shared.activeAreaConfig.value != null) {
          bool hasFocus = DragAreaService
                  .shared.activeAreaConfig.value?.focusNode.hasFocus ??
              false;
          if (!hasFocus) {
            DragAreaService.shared.activeAreaConfig.value = null;
            DragAreaService.shared.activeAreaConfig?.notifyListeners();
          }
        }
      },
      child: ValueListenableBuilder(
        valueListenable: DragAreaService.shared.configs,
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: textAreaList,
            ),
          );
        },
      ),
    );
  }

  List<Widget> get textAreaList => DragAreaService.shared.configs.value
      .map((e) => DraggableTextField(
            config: ValueNotifier(e),
          ))
      .toList();
}
