import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@Freezed()
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    required String token,
    required String refreshToken,
    required String userId,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
}
