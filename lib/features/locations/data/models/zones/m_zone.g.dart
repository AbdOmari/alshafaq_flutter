// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_zone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MZone _$MZoneFromJson(Map<String, dynamic> json) => MZone(
  (json['id'] as num).toInt(),
  json['name'] as String,
  MCoordinates.fromJson(json['coordinates']),
);


Map<String, dynamic> _$MZoneToJson(MZone instance) => <String, dynamic>{
  'id': instance.id,
  
};
