// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchState {
  String get sortBy => throw _privateConstructorUsedError;
  RangeValues get priceRange => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;
  List<String> get selectedFacilities => throw _privateConstructorUsedError;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
    SearchState value,
    $Res Function(SearchState) then,
  ) = _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call({
    String sortBy,
    RangeValues priceRange,
    int rating,
    List<String> selectedFacilities,
  });
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortBy = null,
    Object? priceRange = null,
    Object? rating = null,
    Object? selectedFacilities = null,
  }) {
    return _then(
      _value.copyWith(
            sortBy:
                null == sortBy
                    ? _value.sortBy
                    : sortBy // ignore: cast_nullable_to_non_nullable
                        as String,
            priceRange:
                null == priceRange
                    ? _value.priceRange
                    : priceRange // ignore: cast_nullable_to_non_nullable
                        as RangeValues,
            rating:
                null == rating
                    ? _value.rating
                    : rating // ignore: cast_nullable_to_non_nullable
                        as int,
            selectedFacilities:
                null == selectedFacilities
                    ? _value.selectedFacilities
                    : selectedFacilities // ignore: cast_nullable_to_non_nullable
                        as List<String>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
    _$SearchStateImpl value,
    $Res Function(_$SearchStateImpl) then,
  ) = __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String sortBy,
    RangeValues priceRange,
    int rating,
    List<String> selectedFacilities,
  });
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
    _$SearchStateImpl _value,
    $Res Function(_$SearchStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sortBy = null,
    Object? priceRange = null,
    Object? rating = null,
    Object? selectedFacilities = null,
  }) {
    return _then(
      _$SearchStateImpl(
        sortBy:
            null == sortBy
                ? _value.sortBy
                : sortBy // ignore: cast_nullable_to_non_nullable
                    as String,
        priceRange:
            null == priceRange
                ? _value.priceRange
                : priceRange // ignore: cast_nullable_to_non_nullable
                    as RangeValues,
        rating:
            null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                    as int,
        selectedFacilities:
            null == selectedFacilities
                ? _value._selectedFacilities
                : selectedFacilities // ignore: cast_nullable_to_non_nullable
                    as List<String>,
      ),
    );
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl({
    this.sortBy = 'Lowest rent',
    this.priceRange = const RangeValues(250, 2450),
    this.rating = 4,
    final List<String> selectedFacilities = const [],
  }) : _selectedFacilities = selectedFacilities;

  @override
  @JsonKey()
  final String sortBy;
  @override
  @JsonKey()
  final RangeValues priceRange;
  @override
  @JsonKey()
  final int rating;
  final List<String> _selectedFacilities;
  @override
  @JsonKey()
  List<String> get selectedFacilities {
    if (_selectedFacilities is EqualUnmodifiableListView)
      return _selectedFacilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedFacilities);
  }

  @override
  String toString() {
    return 'SearchState(sortBy: $sortBy, priceRange: $priceRange, rating: $rating, selectedFacilities: $selectedFacilities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.priceRange, priceRange) ||
                other.priceRange == priceRange) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            const DeepCollectionEquality().equals(
              other._selectedFacilities,
              _selectedFacilities,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    sortBy,
    priceRange,
    rating,
    const DeepCollectionEquality().hash(_selectedFacilities),
  );

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState({
    final String sortBy,
    final RangeValues priceRange,
    final int rating,
    final List<String> selectedFacilities,
  }) = _$SearchStateImpl;

  @override
  String get sortBy;
  @override
  RangeValues get priceRange;
  @override
  int get rating;
  @override
  List<String> get selectedFacilities;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
