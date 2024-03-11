import 'package:drag_training/services/drag_area_service.dart';
import 'package:flutter/material.dart';

class CopyBottomItem extends StatefulWidget {
  const CopyBottomItem({super.key});

  @override
  State<CopyBottomItem> createState() => _CopyBottomItemState();
}

class _CopyBottomItemState extends State<CopyBottomItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DragAreaService.shared.addCopyOfItem();
      },
      child: const Icon(
        Icons.copy,
        color: Colors.black,
      ),
    );
  }
}
