// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_missions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainMissions _$MainMissionsFromJson(Map<String, dynamic> json) => MainMissions(
      levels: (json['levels'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Level.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
