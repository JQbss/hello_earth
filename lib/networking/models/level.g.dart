// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) => Level(
      missions: (json['missions'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : Mission.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
