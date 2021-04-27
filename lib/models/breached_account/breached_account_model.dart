import 'package:freezed_annotation/freezed_annotation.dart';

part 'breached_account_model.freezed.dart';
part 'breached_account_model.g.dart';

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

  factory BreachedAccountModel.fromJson(Map<String, dynamic> json) =>
      _$BreachedAccountModelFromJson(json);
}
