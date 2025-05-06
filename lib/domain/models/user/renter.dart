import 'package:freezed_annotation/freezed_annotation.dart';

part 'renter.freezed.dart';
part 'renter.g.dart';

@freezed
class Renter with _$Renter {
  const factory Renter({
    String? occupation,
    bool? isStudent,
    String? universityName,
    String? employerName,
    String? bio,
    List<String>? preferredAreas,
    double? budgetMin,
    double? budgetMax,
    String? preferredPropertyType,
    DateTime? moveInDate,
  }) = _Renter;

  factory Renter.fromJson(Map<String, dynamic> json) => _$RenterFromJson(json);
}