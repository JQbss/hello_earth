// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Family _$FamilyFromJson(Map<String, dynamic> json) => Family(
      child: Child.fromJson(json['child'] as Map<String, dynamic>),
      parent: Parent.fromJson(json['parent'] as Map<String, dynamic>),
    );
