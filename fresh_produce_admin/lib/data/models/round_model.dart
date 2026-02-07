import 'package:freezed_annotation/freezed_annotation.dart';

import 'neighborhood_model.dart';
import 'product_model.dart';

part 'round_model.freezed.dart';
part 'round_model.g.dart';

@Freezed()
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
    @Default([]) List<RoundProductModel> roundProducts,
  }) = _RoundModel;

  factory RoundModel.fromJson(Map<String, dynamic> json) =>
      _$RoundModelFromJson(json);
}

@Freezed()
abstract class RoundProductModel with _$RoundProductModel {
  const factory RoundProductModel({
    @Default('') String id,
    required String productId,
    ProductModel? product,
    required double targetQuantityKg,
    @Default(0.0) double accumulatedQuantityKg,
    required double estimatedWholesalePrice,
    double? actualWholesalePrice,
    required double marginPerKg,
    required double operationalSharePerKg,
  }) = _RoundProductModel;

  factory RoundProductModel.fromJson(Map<String, dynamic> json) =>
      _$RoundProductModelFromJson(json);
}
