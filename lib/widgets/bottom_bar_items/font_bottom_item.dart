// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:drag_training/widgets/color_editor/color_editor_widget.dart';
import 'package:flutter/material.dart';

import 'package:drag_training/model/text_area_config.dart';
import 'package:google_fonts/google_fonts.dart';

class FontBottomItem extends StatefulWidget {
  final ValueNotifier<TextAreaConfig?> notifier;
  final VoidCallback? onTap;
  final ValueSetter<Widget?> toggleEditWidget;
  const FontBottomItem({
    Key? key,
    required this.notifier,
    this.onTap,
    required this.toggleEditWidget,
  }) : super(key: key);

  @override
  State<FontBottomItem> createState() => _FontBottomItemState();
}

class _FontBottomItemState extends State<FontBottomItem> {
  bool isFontEditWidgetOpen = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleFontEditWidget(!isFontEditWidgetOpen);
      },
      child: const Icon(
        Icons.font_download,
        color: Colors.black,
      ),
    );
  }

  toggleFontEditWidget(bool toggleValue) {
    isFontEditWidgetOpen = toggleValue;
    if (isFontEditWidgetOpen) {
      widget.toggleEditWidget(_FontEditWidget(
        notifier: widget.notifier,
        close: toggleFontEditWidget,
      ));
    } else {
      widget.toggleEditWidget(null);
    }
  }
}

class _FontEditWidget extends StatefulWidget {
  const _FontEditWidget({
    super.key,
    required this.notifier,
    required this.close,
  });
  final ValueNotifier<TextAreaConfig?> notifier;
  final ValueSetter<bool> close;
  @override
  State<_FontEditWidget> createState() => __FontEditWidgetState();
}

class __FontEditWidgetState extends State<_FontEditWidget> {
  bool? isColorEditMode = true;

  setEditMode(bool? mode) {
    isColorEditMode = mode;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return isColorEditMode == null
        ? const SizedBox()
        : isColorEditMode == false
            ? Container(
                height: 170,
                margin: const EdgeInsets.only(
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: getFontFamilyArea(),
              )
            : ColorEditorWidget(
                notifier: widget.notifier,
                setEditMode: setEditMode,
              );
  }

  getFontFamilyArea() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  isColorEditMode = true;
                  setState(() {});
                },
                child: Icon(Icons.palette)),
            const Text("Fonts"),
            GestureDetector(
              onTap: () {
                widget.close(false);
              },
              child: const Icon(Icons.arrow_downward_rounded),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Wrap(
          runSpacing: 20,
          spacing: 30,
          children: [
            getFontSelectionButton(GoogleFonts.lato()),
            getFontSelectionButton(GoogleFonts.aBeeZee()),
            getFontSelectionButton(GoogleFonts.aboreto()),
            getFontSelectionButton(GoogleFonts.abrilFatface()),
            getFontSelectionButton(GoogleFonts.b612()),
            getFontSelectionButton(GoogleFonts.cabin()),
            getFontSelectionButton(GoogleFonts.daiBannaSil()),
            getFontSelectionButton(GoogleFonts.fahkwang()),
          ],
        ),
      ],
    );
  }

  Widget getFontSelectionButton(TextStyle textStyle) {
    return GestureDetector(
        onTap: () {
          widget.notifier.value?.textStyle = textStyle;
          widget.notifier.notifyListeners();
        },
        child: Text(
          "Story",
          style: textStyle.copyWith(
            fontSize: 24,
          ),
        ));
  }
}
