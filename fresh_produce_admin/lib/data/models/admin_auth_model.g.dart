// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_auth_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminAuthModel _$AdminAuthModelFromJson(Map<String, dynamic> json) =>
    _AdminAuthModel(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AdminAuthModelToJson(_AdminAuthModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };
