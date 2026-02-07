import 'package:freezed_annotation/freezed_annotation.dart';

part 'neighborhood_model.freezed.dart';
part 'neighborhood_model.g.dart';

@Freezed()
abstract class NeighborhoodModel with _$NeighborhoodModel {
  const factory NeighborhoodModel({
    required String id,
    required String name,
    required String city,
    @Default(20.0) double deliveryFee,
    String? pickupPointAddress,
    String? pickupPointNotes,
  }) = _NeighborhoodModel;

  factory NeighborhoodModel.fromJson(Map<String, dynamic> json) =>
      _$NeighborhoodModelFromJson(json);
}
