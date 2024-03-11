// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui' as ui;
import 'dart:ui';

import 'package:drag_training/template_fill_part/data/painter_object_interface.dart';

class UserImageLayerModel implements PainterObject {
  @override
  int depth;

  @override
  String id;

  ui.Image? image;
  Size? relativeSize;
  Size? relativePosition;

  num top;
  num angle;
  num left;
  num strokeWidth;
  num height;
  num width;
  num opacity;
  String? strokeColor;

  UserImageLayerModel({
    required this.depth,
    required this.id,
    required this.top,
    required this.angle,
    required this.left,
    required this.strokeWidth,
    required this.height,
    required this.width,
    required this.opacity,
    this.strokeColor,
  });

  UserImageLayerModel copyWith({
    int? depth,
    String? id,
    num? top,
    num? angle,
    num? left,
    num? strokeWidth,
    num? height,
    num? width,
    num? opacity,
    String? strokeColor,
  }) {
    return UserImageLayerModel(
      depth: depth ?? this.depth,
      id: id ?? this.id,
      top: top ?? this.top,
      angle: angle ?? this.angle,
      left: left ?? this.left,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      height: height ?? this.height,
      width: width ?? this.width,
      opacity: opacity ?? this.opacity,
      strokeColor: strokeColor ?? this.strokeColor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'depth': depth,
      'id': id,
      'top': top,
      'angle': angle,
      'left': left,
      'strokeWidth': strokeWidth,
      'height': height,
      'width': width,
      'opacity': opacity,
      'strokeColor': strokeColor,
    };
  }

  factory UserImageLayerModel.fromMap(Map<String, dynamic> map) {
    return UserImageLayerModel(
      depth: map['depth'] as int,
      id: map['id'] as String,
      top: map['top'] as num,
      angle: map['angle'] as num,
      left: map['left'] as num,
      strokeWidth: map['strokeWidth'] as num,
      height: map['height'] as num,
      width: map['width'] as num,
      opacity: map['opacity'] as num,
      strokeColor:
          map['strokeColor'] != null ? map['strokeColor'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserImageLayerModel.fromJson(String source) =>
      UserImageLayerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserImageLayerModel(depth: $depth, id: $id, top: $top, angle: $angle, left: $left, strokeWidth: $strokeWidth, height: $height, width: $width, opacity: $opacity, strokeColor: $strokeColor)';
  }

  @override
  bool operator ==(covariant UserImageLayerModel other) {
    if (identical(this, other)) return true;

    return other.depth == depth &&
        other.id == id &&
        other.top == top &&
        other.angle == angle &&
        other.left == left &&
        other.strokeWidth == strokeWidth &&
        other.height == height &&
        other.width == width &&
        other.opacity == opacity &&
        other.strokeColor == strokeColor;
  }

  @override
  int get hashCode {
    return depth.hashCode ^
        id.hashCode ^
        top.hashCode ^
        angle.hashCode ^
        left.hashCode ^
        strokeWidth.hashCode ^
        height.hashCode ^
        width.hashCode ^
        opacity.hashCode ^
        strokeColor.hashCode;
  }
}
