import 'package:ashafaq/core/constants/json_keys.dart';
import 'package:ashafaq/features/auth/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'm_user.g.dart';

@JsonSerializable()
final class UserModel extends User {
  UserModel({
    super.id,
    required super.userId,
    required super.name,
    required super.email,
    required super.phoneNumber,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  Map<String, dynamic> toSqlJson(int localId) => {
    JsonKeys.id: localId,
    ...toJson(),
  };

  @override
  String toString() {
    final user = {'id': id, ...toJson()};
    return '$user';
  }
}

/*

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['userId'] as num).toInt(),
  name: json['name'] as String,
  email: json['email'] as String,
  phoneNumber: json['phoneNumber'] as String,
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'name': instance.name,
  'phoneNumber': instance.phoneNumber,
  'email': instance.email,
};
 */