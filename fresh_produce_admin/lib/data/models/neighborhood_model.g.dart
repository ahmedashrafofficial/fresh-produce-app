// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'neighborhood_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NeighborhoodModel _$NeighborhoodModelFromJson(Map<String, dynamic> json) =>
    _NeighborhoodModel(
      id: json['id'] as String,
      name: json['name'] as String,
      city: json['city'] as String,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 20.0,
      pickupPointAddress: json['pickupPointAddress'] as String?,
      pickupPointNotes: json['pickupPointNotes'] as String?,
    );

Map<String, dynamic> _$NeighborhoodModelToJson(_NeighborhoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'city': instance.city,
      'deliveryFee': instance.deliveryFee,
      'pickupPointAddress': instance.pickupPointAddress,
      'pickupPointNotes': instance.pickupPointNotes,
    };
