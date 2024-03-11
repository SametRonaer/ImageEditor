import 'package:drag_training/services/drag_area_service.dart';
import 'package:flutter/material.dart';

class VisibilityBottomItem extends StatefulWidget {
  const VisibilityBottomItem({
    super.key,
  });

  @override
  State<VisibilityBottomItem> createState() => _VisibilityBottomItemState();
}

class _VisibilityBottomItemState extends State<VisibilityBottomItem> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isVisible = !isVisible;
          DragAreaService.shared.setVisibility(isVisible);
        });
      },
      child: Icon(
        isVisible ? Icons.visibility : Icons.visibility_off,
        color: Colors.black,
      ),
    );
  }
}
