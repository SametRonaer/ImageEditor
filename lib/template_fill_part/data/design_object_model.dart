// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DesignObjectModel {
  String type;
  String id;
  num? top;
  num? left;
  num? height;
  num? width;
  int? zIndex;
  String? color;
  String? strokeColor;
  num? strokeWidth;
  String? text;
  num? fontSize;
  num? opacity;
  num? angle;
  num? radius;
  String? imageUrl;
  DesignObjectModel({
    required this.type,
    required this.id,
    this.top,
    this.left,
    this.height,
    this.width,
    this.zIndex,
    this.color,
    this.strokeColor,
    this.strokeWidth,
    this.text,
    this.fontSize,
    this.opacity,
    this.angle,
    this.radius,
    this.imageUrl,
  });

  DesignObjectModel copyWith({
    String? type,
    String? id,
    num? top,
    num? left,
    num? height,
    num? width,
    int? zIndex,
    String? color,
    String? strokeColor,
    num? strokeWidth,
    String? text,
    num? fontSize,
    num? opacity,
    num? angle,
    num? radius,
    String? imageUrl,
  }) {
    return DesignObjectModel(
      type: type ?? this.type,
      id: id ?? this.id,
      top: top ?? this.top,
      left: left ?? this.left,
      height: height ?? this.height,
      width: width ?? this.width,
      zIndex: zIndex ?? this.zIndex,
      color: color ?? this.color,
      strokeColor: strokeColor ?? this.strokeColor,
      strokeWidth: strokeWidth ?? this.strokeWidth,
      text: text ?? this.text,
      fontSize: fontSize ?? this.fontSize,
      opacity: opacity ?? this.opacity,
      angle: angle ?? this.angle,
      radius: radius ?? this.radius,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'id': id,
      'top': top,
      'left': left,
      'height': height,
      'width': width,
      'zIndex': zIndex,
      'color': color,
      'strokeColor': strokeColor,
      'strokeWidth': strokeWidth,
      'text': text,
      'fontSize': fontSize,
      'opacity': opacity,
      'angle': angle,
      'radius': radius,
      'imageUrl': imageUrl,
    };
  }

  factory DesignObjectModel.fromMap(Map<String, dynamic> map) {
    return DesignObjectModel(
      type: map['type'] as String,
      id: map['id'] as String,
      top: map['top'] != null ? map['top'] as num : null,
      left: map['left'] != null ? map['left'] as num : null,
      height: map['height'] != null ? map['height'] as num : null,
      width: map['width'] != null ? map['width'] as num : null,
      zIndex: map['zIndex'] != null ? map['zIndex'] as int : null,
      color: map['color'] != null ? map['color'] as String : null,
      strokeColor:
          map['strokeColor'] != null ? map['strokeColor'] as String : null,
      strokeWidth:
          map['strokeWidth'] != null ? map['strokeWidth'] as num : null,
      text: map['text'] != null ? map['text'] as String : null,
      fontSize:
          map['fontSize'] != null ? num.tryParse(map['fontSize']) as num : null,
      opacity: map['opacity'] != null ? map['opacity'] as num : null,
      angle: map['angle'] != null ? map['angle'] as num : null,
      radius: map['radius'] != null ? map['radius'] as num : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DesignObjectModel.fromJson(String source) =>
      DesignObjectModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DesignObjectModel(type: $type, id: $id, top: $top, left: $left, height: $height, width: $width, zIndex: $zIndex, color: $color, strokeColor: $strokeColor, strokeWidth: $strokeWidth, text: $text, fontSize: $fontSize, opacity: $opacity, angle: $angle, radius: $radius, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant DesignObjectModel other) {
    if (identical(this, other)) return true;

    return other.type == type &&
        other.id == id &&
        other.top == top &&
        other.left == left &&
        other.height == height &&
        other.width == width &&
        other.zIndex == zIndex &&
        other.color == color &&
        other.strokeColor == strokeColor &&
        other.strokeWidth == strokeWidth &&
        other.text == text &&
        other.fontSize == fontSize &&
        other.opacity == opacity &&
        other.angle == angle &&
        other.radius == radius &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return type.hashCode ^
        id.hashCode ^
        top.hashCode ^
        left.hashCode ^
        height.hashCode ^
        width.hashCode ^
        zIndex.hashCode ^
        color.hashCode ^
        strokeColor.hashCode ^
        strokeWidth.hashCode ^
        text.hashCode ^
        fontSize.hashCode ^
        opacity.hashCode ^
        angle.hashCode ^
        radius.hashCode ^
        imageUrl.hashCode;
  }
}
