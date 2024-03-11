// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui' as ui;

import 'package:drag_training/template_fill_part/data/painter_object_interface.dart';

class LayerModel implements PainterObject {
  @override
  int depth;

  @override
  String id;

  String layerData;
  ui.Image? image;

  LayerModel({
    required this.depth,
    required this.id,
    required this.layerData,
  });

  LayerModel copyWith({
    int? depth,
    String? id,
    String? layerData,
  }) {
    return LayerModel(
      depth: depth ?? this.depth,
      id: id ?? this.id,
      layerData: layerData ?? this.layerData,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'depth': depth,
      'id': id,
      'layerData': layerData,
    };
  }

  factory LayerModel.fromMap(Map<String, dynamic> map) {
    return LayerModel(
      depth: map['depth'] as int,
      id: map['id'] as String,
      layerData: map['layerData'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory LayerModel.fromJson(String source) =>
      LayerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LayerModel(depth: $depth, id: $id, layerData: $layerData)';

  @override
  bool operator ==(covariant LayerModel other) {
    if (identical(this, other)) return true;

    return other.depth == depth &&
        other.id == id &&
        other.layerData == layerData;
  }

  @override
  int get hashCode => depth.hashCode ^ id.hashCode ^ layerData.hashCode;
}
