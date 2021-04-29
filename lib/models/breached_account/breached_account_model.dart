import 'package:freezed_annotation/freezed_annotation.dart';

part 'breached_account_model.freezed.dart';
part 'breached_account_model.g.dart';

//I used freezed package for generate some methods for me whihout i need write boilerplate of code.
//It works like Kotlin DataClass
@freezed
class BreachedAccountModel with _$BreachedAccountModel {
  @JsonSerializable(fieldRename: FieldRename.pascal)
  factory BreachedAccountModel({
    required String name,
    required String title,
    required String domain,
    required DateTime breachDate,
    required DateTime addedDate,
    required DateTime modifiedDate,
    required int pwnCount,
    required String description,
    required String logoPath,
    required List<String> dataClasses,
    required bool isVerified,
    required bool isFabricated,
    required bool isSensitive,
    required bool isRetired,
    required bool isSpamList,
  }) = _BreachedAccountModel;

  //Json serializeble and deserializeble
  factory BreachedAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BreachedAccountModelFromJson(json);
}
