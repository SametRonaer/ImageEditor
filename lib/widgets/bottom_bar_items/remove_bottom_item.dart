import 'package:flutter/material.dart';

import '../../services/drag_area_service.dart';

class RemoveBottomItem extends StatefulWidget {
  const RemoveBottomItem({super.key});

  @override
  State<RemoveBottomItem> createState() => _RemoveBottomItemState();
}

class _RemoveBottomItemState extends State<RemoveBottomItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        DragAreaService.shared.removeItem();
      },
      child: const Icon(
        Icons.delete_outline,
        color: Colors.black,
      ),
    );
  }
}
