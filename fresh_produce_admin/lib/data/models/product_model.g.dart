// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProductModel _$ProductModelFromJson(Map<String, dynamic> json) =>
    _ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      unit: json['unit'] as String,
      minInventoryAmount: (json['minInventoryAmount'] as num).toDouble(),
      imageUrl: json['imageUrl'] as String?,
      estimatedWholesalePrice: (json['estimatedWholesalePrice'] as num?)
          ?.toDouble(),
    );

Map<String, dynamic> _$ProductModelToJson(_ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'unit': instance.unit,
      'minInventoryAmount': instance.minInventoryAmount,
      'imageUrl': instance.imageUrl,
      'estimatedWholesalePrice': instance.estimatedWholesalePrice,
    };
