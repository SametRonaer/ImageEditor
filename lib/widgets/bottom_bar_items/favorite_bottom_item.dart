import 'package:drag_training/services/drag_area_service.dart';
import 'package:flutter/material.dart';

class FavoriteBottomItem extends StatefulWidget {
  const FavoriteBottomItem({super.key});

  @override
  State<FavoriteBottomItem> createState() => _FavoriteBottomItemState();
}

class _FavoriteBottomItemState extends State<FavoriteBottomItem> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
          DragAreaService.shared.addFavorite();
        });
      },
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_outline,
        color: isFavorite ? Colors.red : Colors.black,
      ),
    );
  }
}
