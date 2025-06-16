// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MLocation _$MLocationFromJson(Map<String, dynamic> json) => MLocation(
  id: json['id'] as int,
  name: json['name'] as String,
  latitude: json['latitude'] as String,
  longitude: json['longitude'] as String,
  zone: MZone.fromJson(json['zone']),
  notes: json['notes'] as String?,
);

Map<String, dynamic> _$MLocationToJson(MLocation instance) => <String, dynamic>{
  'name': instance.name,
  if (instance.notes case final value?) 'notes': value,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'zone_id': instance.zone.id,
};
