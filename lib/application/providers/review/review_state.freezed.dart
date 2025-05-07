// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ReviewState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  List<Review> get reviews => throw _privateConstructorUsedError;
  Map<String, double> get stats => throw _privateConstructorUsedError;
  Review? get currentReview => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;
  String? get successMessage => throw _privateConstructorUsedError;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewStateCopyWith<ReviewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateCopyWith<$Res> {
  factory $ReviewStateCopyWith(
    ReviewState value,
    $Res Function(ReviewState) then,
  ) = _$ReviewStateCopyWithImpl<$Res, ReviewState>;
  @useResult
  $Res call({
    bool isLoading,
    String? errorMessage,
    List<Review> reviews,
    Map<String, double> stats,
    Review? currentReview,
    bool isSubmitting,
    bool isDeleting,
    String? successMessage,
  });

  $ReviewCopyWith<$Res>? get currentReview;
}

/// @nodoc
class _$ReviewStateCopyWithImpl<$Res, $Val extends ReviewState>
    implements $ReviewStateCopyWith<$Res> {
  _$ReviewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? reviews = null,
    Object? stats = null,
    Object? currentReview = freezed,
    Object? isSubmitting = null,
    Object? isDeleting = null,
    Object? successMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            isLoading:
                null == isLoading
                    ? _value.isLoading
                    : isLoading // ignore: cast_nullable_to_non_nullable
                        as bool,
            errorMessage:
                freezed == errorMessage
                    ? _value.errorMessage
                    : errorMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
            reviews:
                null == reviews
                    ? _value.reviews
                    : reviews // ignore: cast_nullable_to_non_nullable
                        as List<Review>,
            stats:
                null == stats
                    ? _value.stats
                    : stats // ignore: cast_nullable_to_non_nullable
                        as Map<String, double>,
            currentReview:
                freezed == currentReview
                    ? _value.currentReview
                    : currentReview // ignore: cast_nullable_to_non_nullable
                        as Review?,
            isSubmitting:
                null == isSubmitting
                    ? _value.isSubmitting
                    : isSubmitting // ignore: cast_nullable_to_non_nullable
                        as bool,
            isDeleting:
                null == isDeleting
                    ? _value.isDeleting
                    : isDeleting // ignore: cast_nullable_to_non_nullable
                        as bool,
            successMessage:
                freezed == successMessage
                    ? _value.successMessage
                    : successMessage // ignore: cast_nullable_to_non_nullable
                        as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReviewCopyWith<$Res>? get currentReview {
    if (_value.currentReview == null) {
      return null;
    }

    return $ReviewCopyWith<$Res>(_value.currentReview!, (value) {
      return _then(_value.copyWith(currentReview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewStateImplCopyWith<$Res>
    implements $ReviewStateCopyWith<$Res> {
  factory _$$ReviewStateImplCopyWith(
    _$ReviewStateImpl value,
    $Res Function(_$ReviewStateImpl) then,
  ) = __$$ReviewStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    bool isLoading,
    String? errorMessage,
    List<Review> reviews,
    Map<String, double> stats,
    Review? currentReview,
    bool isSubmitting,
    bool isDeleting,
    String? successMessage,
  });

  @override
  $ReviewCopyWith<$Res>? get currentReview;
}

/// @nodoc
class __$$ReviewStateImplCopyWithImpl<$Res>
    extends _$ReviewStateCopyWithImpl<$Res, _$ReviewStateImpl>
    implements _$$ReviewStateImplCopyWith<$Res> {
  __$$ReviewStateImplCopyWithImpl(
    _$ReviewStateImpl _value,
    $Res Function(_$ReviewStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? reviews = null,
    Object? stats = null,
    Object? currentReview = freezed,
    Object? isSubmitting = null,
    Object? isDeleting = null,
    Object? successMessage = freezed,
  }) {
    return _then(
      _$ReviewStateImpl(
        isLoading:
            null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                    as bool,
        errorMessage:
            freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
        reviews:
            null == reviews
                ? _value._reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                    as List<Review>,
        stats:
            null == stats
                ? _value._stats
                : stats // ignore: cast_nullable_to_non_nullable
                    as Map<String, double>,
        currentReview:
            freezed == currentReview
                ? _value.currentReview
                : currentReview // ignore: cast_nullable_to_non_nullable
                    as Review?,
        isSubmitting:
            null == isSubmitting
                ? _value.isSubmitting
                : isSubmitting // ignore: cast_nullable_to_non_nullable
                    as bool,
        isDeleting:
            null == isDeleting
                ? _value.isDeleting
                : isDeleting // ignore: cast_nullable_to_non_nullable
                    as bool,
        successMessage:
            freezed == successMessage
                ? _value.successMessage
                : successMessage // ignore: cast_nullable_to_non_nullable
                    as String?,
      ),
    );
  }
}

/// @nodoc

class _$ReviewStateImpl implements _ReviewState {
  const _$ReviewStateImpl({
    this.isLoading = false,
    this.errorMessage = null,
    final List<Review> reviews = const [],
    final Map<String, double> stats = const {},
    this.currentReview = null,
    this.isSubmitting = false,
    this.isDeleting = false,
    this.successMessage = null,
  }) : _reviews = reviews,
       _stats = stats;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String? errorMessage;
  final List<Review> _reviews;
  @override
  @JsonKey()
  List<Review> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  final Map<String, double> _stats;
  @override
  @JsonKey()
  Map<String, double> get stats {
    if (_stats is EqualUnmodifiableMapView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_stats);
  }

  @override
  @JsonKey()
  final Review? currentReview;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  @JsonKey()
  final bool isDeleting;
  @override
  @JsonKey()
  final String? successMessage;

  @override
  String toString() {
    return 'ReviewState(isLoading: $isLoading, errorMessage: $errorMessage, reviews: $reviews, stats: $stats, currentReview: $currentReview, isSubmitting: $isSubmitting, isDeleting: $isDeleting, successMessage: $successMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            (identical(other.currentReview, currentReview) ||
                other.currentReview == currentReview) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting) &&
            (identical(other.successMessage, successMessage) ||
                other.successMessage == successMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    isLoading,
    errorMessage,
    const DeepCollectionEquality().hash(_reviews),
    const DeepCollectionEquality().hash(_stats),
    currentReview,
    isSubmitting,
    isDeleting,
    successMessage,
  );

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      __$$ReviewStateImplCopyWithImpl<_$ReviewStateImpl>(this, _$identity);
}

abstract class _ReviewState implements ReviewState {
  const factory _ReviewState({
    final bool isLoading,
    final String? errorMessage,
    final List<Review> reviews,
    final Map<String, double> stats,
    final Review? currentReview,
    final bool isSubmitting,
    final bool isDeleting,
    final String? successMessage,
  }) = _$ReviewStateImpl;

  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  List<Review> get reviews;
  @override
  Map<String, double> get stats;
  @override
  Review? get currentReview;
  @override
  bool get isSubmitting;
  @override
  bool get isDeleting;
  @override
  String? get successMessage;

  /// Create a copy of ReviewState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewStateImplCopyWith<_$ReviewStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
