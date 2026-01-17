// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'round_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RoundModel _$RoundModelFromJson(Map<String, dynamic> json) => _RoundModel(
  id: json['id'] as String,
  roundNumber: (json['roundNumber'] as num?)?.toInt() ?? 0,
  neighborhoodId: json['neighborhoodId'] as String,
  neighborhood: json['neighborhood'] == null
      ? null
      : NeighborhoodModel.fromJson(
          json['neighborhood'] as Map<String, dynamic>,
        ),
  status: (json['status'] as num).toInt(),
  startDate: DateTime.parse(json['startDate'] as String),
  endDate: DateTime.parse(json['endDate'] as String),
  totalTransportCost: (json['totalTransportCost'] as num).toDouble(),
  roundProducts:
      (json['roundProducts'] as List<dynamic>?)
          ?.map((e) => RoundProductModel.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$RoundModelToJson(_RoundModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roundNumber': instance.roundNumber,
      'neighborhoodId': instance.neighborhoodId,
      'neighborhood': instance.neighborhood,
      'status': instance.status,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'totalTransportCost': instance.totalTransportCost,
      'roundProducts': instance.roundProducts,
    };

_RoundProductModel _$RoundProductModelFromJson(Map<String, dynamic> json) =>
    _RoundProductModel(
      id: json['id'] as String? ?? '',
      productId: json['productId'] as String,
      product: json['product'] == null
          ? null
          : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
      targetQuantityKg: (json['targetQuantityKg'] as num).toDouble(),
      accumulatedQuantityKg:
          (json['accumulatedQuantityKg'] as num?)?.toDouble() ?? 0.0,
      estimatedWholesalePrice: (json['estimatedWholesalePrice'] as num)
          .toDouble(),
      actualWholesalePrice: (json['actualWholesalePrice'] as num?)?.toDouble(),
      marginPerKg: (json['marginPerKg'] as num).toDouble(),
      operationalSharePerKg: (json['operationalSharePerKg'] as num).toDouble(),
    );

Map<String, dynamic> _$RoundProductModelToJson(_RoundProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'product': instance.product,
      'targetQuantityKg': instance.targetQuantityKg,
      'accumulatedQuantityKg': instance.accumulatedQuantityKg,
      'estimatedWholesalePrice': instance.estimatedWholesalePrice,
      'actualWholesalePrice': instance.actualWholesalePrice,
      'marginPerKg': instance.marginPerKg,
      'operationalSharePerKg': instance.operationalSharePerKg,
    };
