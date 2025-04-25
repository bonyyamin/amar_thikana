import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:amar_thikana/domain/models/property/property.dart';

part 'properties_state.freezed.dart';

@freezed
class PropertiesState with _$PropertiesState {
  const factory PropertiesState.initial() = _Initial;
  const factory PropertiesState.loading() = _Loading;
  const factory PropertiesState.loaded(List<Property> properties) = _Loaded;
  const factory PropertiesState.error(String message) = _Error;
}
