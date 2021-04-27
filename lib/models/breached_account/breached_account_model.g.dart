// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breached_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BreachedAccountModel _$_$_BreachedAccountModelFromJson(
    Map<String, dynamic> json) {
  return _$_BreachedAccountModel(
    name: json['Name'] as String,
    title: json['Title'] as String,
    domain: json['Domain'] as String,
    breachDate: DateTime.parse(json['BreachDate'] as String),
    addedDate: DateTime.parse(json['AddedDate'] as String),
    modifiedDate: DateTime.parse(json['ModifiedDate'] as String),
    pwnCount: json['PwnCount'] as int,
    description: json['Description'] as String,
    logoPath: json['LogoPath'] as String,
    dataClasses:
        (json['DataClasses'] as List<dynamic>).map((e) => e as String).toList(),
    isVerified: json['IsVerified'] as bool,
    isFabricated: json['IsFabricated'] as bool,
    isSensitive: json['IsSensitive'] as bool,
    isRetired: json['IsRetired'] as bool,
    isSpamList: json['IsSpamList'] as bool,
  );
}

Map<String, dynamic> _$_$_BreachedAccountModelToJson(
        _$_BreachedAccountModel instance) =>
    <String, dynamic>{
      'Name': instance.name,
      'Title': instance.title,
      'Domain': instance.domain,
      'BreachDate': instance.breachDate.toIso8601String(),
      'AddedDate': instance.addedDate.toIso8601String(),
      'ModifiedDate': instance.modifiedDate.toIso8601String(),
      'PwnCount': instance.pwnCount,
      'Description': instance.description,
      'LogoPath': instance.logoPath,
      'DataClasses': instance.dataClasses,
      'IsVerified': instance.isVerified,
      'IsFabricated': instance.isFabricated,
      'IsSensitive': instance.isSensitive,
      'IsRetired': instance.isRetired,
      'IsSpamList': instance.isSpamList,
    };
