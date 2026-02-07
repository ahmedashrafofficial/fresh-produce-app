import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_auth_model.freezed.dart';
part 'admin_auth_model.g.dart';

@Freezed()
abstract class AdminAuthModel with _$AdminAuthModel {
  const factory AdminAuthModel({
    required String token,
    required String refreshToken,
  }) = _AdminAuthModel;

  factory AdminAuthModel.fromJson(Map<String, dynamic> json) =>
      _$AdminAuthModelFromJson(json);
}
