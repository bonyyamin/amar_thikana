import 'package:freezed_annotation/freezed_annotation.dart';

part 'property_rules.freezed.dart';
part 'property_rules.g.dart';

@freezed
class PropertyRules with _$PropertyRules {
  const factory PropertyRules({
    required String genderPreference, // "male", "female", "family", "any"
    required bool smokingAllowed,
    required bool petsAllowed,
    required String guestPolicy, // "allowed", "restricted", "not_allowed"
    String? additionalRules,
  }) = _PropertyRules;

  factory PropertyRules.fromJson(Map<String, dynamic> json) => _$PropertyRulesFromJson(json);
}
