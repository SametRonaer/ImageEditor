import 'package:drag_training/services/drag_area_service.dart';
import 'package:drag_training/widgets/bottom_bar_items/copy_bottom_item.dart';
import 'package:drag_training/widgets/bottom_bar_items/favorite_bottom_item.dart';
import 'package:drag_training/widgets/bottom_bar_items/remove_bottom_item.dart';
import 'package:drag_training/widgets/bottom_bar_items/visibility_bottom_item.dart';
import 'package:flutter/material.dart';

import 'bottom_bar_items/font_bottom_item.dart';

class PostEditBottomBar extends StatefulWidget {
  const PostEditBottomBar({
    super.key,
  });

  @override
  State<PostEditBottomBar> createState() => _PostEditBottomBarState();
}

class _PostEditBottomBarState extends State<PostEditBottomBar> {
  addEditWidget(Widget? w) {
    editWidget = w;
    setState(() {});
  }

  Widget? editWidget;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (editWidget != null) editWidget!,
          Container(
            color: const Color.fromARGB(255, 239, 242, 244),
            constraints: const BoxConstraints(minHeight: 85),
            padding: const EdgeInsets.only(
              left: 25,
              right: 25,
              bottom: 16,
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const VisibilityBottomItem(),
                const FavoriteBottomItem(),
                FontBottomItem(
                  notifier: DragAreaService.shared.activeAreaConfig,
                  toggleEditWidget: addEditWidget,
                ),
                const CopyBottomItem(),
                const RemoveBottomItem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
