// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

KYCDto _$KYCDtoFromJson(Map<String, dynamic> json) {
  return _KYCDto.fromJson(json);
}

/// @nodoc
mixin _$KYCDto {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get aadharFront => throw _privateConstructorUsedError;
  String get aadharBack => throw _privateConstructorUsedError;
  String get panFront => throw _privateConstructorUsedError;
  String get panBack => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KYCDtoCopyWith<KYCDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KYCDtoCopyWith<$Res> {
  factory $KYCDtoCopyWith(KYCDto value, $Res Function(KYCDto) then) =
      _$KYCDtoCopyWithImpl<$Res, KYCDto>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String aadharFront,
      String aadharBack,
      String panFront,
      String panBack});
}

/// @nodoc
class _$KYCDtoCopyWithImpl<$Res, $Val extends KYCDto>
    implements $KYCDtoCopyWith<$Res> {
  _$KYCDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? aadharFront = null,
    Object? aadharBack = null,
    Object? panFront = null,
    Object? panBack = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      aadharFront: null == aadharFront
          ? _value.aadharFront
          : aadharFront // ignore: cast_nullable_to_non_nullable
              as String,
      aadharBack: null == aadharBack
          ? _value.aadharBack
          : aadharBack // ignore: cast_nullable_to_non_nullable
              as String,
      panFront: null == panFront
          ? _value.panFront
          : panFront // ignore: cast_nullable_to_non_nullable
              as String,
      panBack: null == panBack
          ? _value.panBack
          : panBack // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$KYCDtoImplCopyWith<$Res> implements $KYCDtoCopyWith<$Res> {
  factory _$$KYCDtoImplCopyWith(
          _$KYCDtoImpl value, $Res Function(_$KYCDtoImpl) then) =
      __$$KYCDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String aadharFront,
      String aadharBack,
      String panFront,
      String panBack});
}

/// @nodoc
class __$$KYCDtoImplCopyWithImpl<$Res>
    extends _$KYCDtoCopyWithImpl<$Res, _$KYCDtoImpl>
    implements _$$KYCDtoImplCopyWith<$Res> {
  __$$KYCDtoImplCopyWithImpl(
      _$KYCDtoImpl _value, $Res Function(_$KYCDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? aadharFront = null,
    Object? aadharBack = null,
    Object? panFront = null,
    Object? panBack = null,
  }) {
    return _then(_$KYCDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      aadharFront: null == aadharFront
          ? _value.aadharFront
          : aadharFront // ignore: cast_nullable_to_non_nullable
              as String,
      aadharBack: null == aadharBack
          ? _value.aadharBack
          : aadharBack // ignore: cast_nullable_to_non_nullable
              as String,
      panFront: null == panFront
          ? _value.panFront
          : panFront // ignore: cast_nullable_to_non_nullable
              as String,
      panBack: null == panBack
          ? _value.panBack
          : panBack // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$KYCDtoImpl extends _KYCDto {
  const _$KYCDtoImpl(
      {required this.id,
      required this.userId,
      required this.aadharFront,
      required this.aadharBack,
      required this.panFront,
      required this.panBack})
      : super._();

  factory _$KYCDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$KYCDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String aadharFront;
  @override
  final String aadharBack;
  @override
  final String panFront;
  @override
  final String panBack;

  @override
  String toString() {
    return 'KYCDto(id: $id, userId: $userId, aadharFront: $aadharFront, aadharBack: $aadharBack, panFront: $panFront, panBack: $panBack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KYCDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.aadharFront, aadharFront) ||
                other.aadharFront == aadharFront) &&
            (identical(other.aadharBack, aadharBack) ||
                other.aadharBack == aadharBack) &&
            (identical(other.panFront, panFront) ||
                other.panFront == panFront) &&
            (identical(other.panBack, panBack) || other.panBack == panBack));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, aadharFront, aadharBack, panFront, panBack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$KYCDtoImplCopyWith<_$KYCDtoImpl> get copyWith =>
      __$$KYCDtoImplCopyWithImpl<_$KYCDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$KYCDtoImplToJson(
      this,
    );
  }
}

abstract class _KYCDto extends KYCDto {
  const factory _KYCDto(
      {required final String id,
      required final String userId,
      required final String aadharFront,
      required final String aadharBack,
      required final String panFront,
      required final String panBack}) = _$KYCDtoImpl;
  const _KYCDto._() : super._();

  factory _KYCDto.fromJson(Map<String, dynamic> json) = _$KYCDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get aadharFront;
  @override
  String get aadharBack;
  @override
  String get panFront;
  @override
  String get panBack;
  @override
  @JsonKey(ignore: true)
  _$$KYCDtoImplCopyWith<_$KYCDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
