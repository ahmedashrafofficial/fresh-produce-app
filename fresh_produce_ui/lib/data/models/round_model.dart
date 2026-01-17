import 'package:freezed_annotation/freezed_annotation.dart';

import 'neighborhood_model.dart';
import 'product_model.dart';

part 'round_model.freezed.dart';
part 'round_model.g.dart';

@freezed
abstract class RoundModel with _$RoundModel {
  const factory RoundModel({
    required String id,
    @Default(0) int roundNumber,
    required String neighborhoodId,
    NeighborhoodModel? neighborhood,
    required int status,
    required DateTime startDate,
    required DateTime endDate,
    required double totalTransportCost,
    @JsonKey(name: 'roundProducts')
    @Default([])
    List<RoundProductModel> products,
  }) = _RoundModel;

  factory RoundModel.fromJson(Map<String, dynamic> json) =>
      _$RoundModelFromJson(json);
}

@freezed
abstract class RoundProductModel with _$RoundProductModel {
  const factory RoundProductModel({
    required String id,
    required String productId,
    ProductModel? product,
    required double targetQuantityKg,
    required double minQuantityKg,
    required double accumulatedQuantityKg,
    required double estimatedWholesalePrice,
    double? actualWholesalePrice,
    required double marginPerKg,
    required double operationalSharePerKg,
  }) = _RoundProductModel;

  factory RoundProductModel.fromJson(Map<String, dynamic> json) =>
      _$RoundProductModelFromJson(json);
}
