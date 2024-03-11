// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:drag_training/template_fill_part/data/layer_model.dart';
import 'package:drag_training/template_fill_part/data/user_image_layer_model.dart';
import 'package:flutter/foundation.dart';

class DesignDocumentModel {
  dynamic version;
  String backgroundColor;
  String? thumbnail;
  List<LayerModel> layers;
  List<UserImageLayerModel> images;
  num canvasHeight;
  num canvasWidth;
  DesignDocumentModel({
    required this.version,
    required this.backgroundColor,
    this.thumbnail,
    required this.layers,
    required this.images,
    required this.canvasHeight,
    required this.canvasWidth,
  });

  DesignDocumentModel copyWith({
    dynamic? version,
    String? backgroundColor,
    String? thumbnail,
    List<LayerModel>? layers,
    List<UserImageLayerModel>? images,
    num? canvasHeight,
    num? canvasWidth,
  }) {
    return DesignDocumentModel(
      version: version ?? this.version,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      thumbnail: thumbnail ?? this.thumbnail,
      layers: layers ?? this.layers,
      images: images ?? this.images,
      canvasHeight: canvasHeight ?? this.canvasHeight,
      canvasWidth: canvasWidth ?? this.canvasWidth,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'version': version,
      'backgroundColor': backgroundColor,
      'thumbnail': thumbnail,
      'layers': layers.map((x) => x.toMap()).toList(),
      'images': images.map((x) => x.toMap()).toList(),
      'canvasHeight': canvasHeight,
      'canvasWidth': canvasWidth,
    };
  }

  factory DesignDocumentModel.fromMap(Map<String, dynamic> map) {
    return DesignDocumentModel(
      version: map['version'] as dynamic,
      backgroundColor: map['backgroundColor'] as String,
      thumbnail: map['thumbnail'] != null ? map['thumbnail'] as String : null,
      layers: List<LayerModel>.from(
        (map['layers'] as List<dynamic>).map<LayerModel>(
          (x) => LayerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      images: List<UserImageLayerModel>.from(
        (map['images'] as List<dynamic>).map<UserImageLayerModel>(
          (x) => UserImageLayerModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      canvasHeight: map['canvasHeight'] as num,
      canvasWidth: map['canvasWidth'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory DesignDocumentModel.fromJson(String source) =>
      DesignDocumentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DesignDocumentModel(version: $version, backgroundColor: $backgroundColor, thumbnail: $thumbnail, layers: $layers, images: $images, canvasHeight: $canvasHeight, canvasWidth: $canvasWidth)';
  }

  @override
  bool operator ==(covariant DesignDocumentModel other) {
    if (identical(this, other)) return true;

    return other.version == version &&
        other.backgroundColor == backgroundColor &&
        other.thumbnail == thumbnail &&
        listEquals(other.layers, layers) &&
        listEquals(other.images, images) &&
        other.canvasHeight == canvasHeight &&
        other.canvasWidth == canvasWidth;
  }

  @override
  int get hashCode {
    return version.hashCode ^
        backgroundColor.hashCode ^
        thumbnail.hashCode ^
        layers.hashCode ^
        images.hashCode ^
        canvasHeight.hashCode ^
        canvasWidth.hashCode;
  }
}
