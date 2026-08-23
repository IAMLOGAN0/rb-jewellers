// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banners_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BannersDto _$BannersDtoFromJson(Map<String, dynamic> json) {
  return _BannersDto.fromJson(json);
}

/// @nodoc
mixin _$BannersDto {
  String get id => throw _privateConstructorUsedError;
  String get bannerUrl => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannersDtoCopyWith<BannersDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannersDtoCopyWith<$Res> {
  factory $BannersDtoCopyWith(
          BannersDto value, $Res Function(BannersDto) then) =
      _$BannersDtoCopyWithImpl<$Res, BannersDto>;
  @useResult
  $Res call({String id, String bannerUrl, String url});
}

/// @nodoc
class _$BannersDtoCopyWithImpl<$Res, $Val extends BannersDto>
    implements $BannersDtoCopyWith<$Res> {
  _$BannersDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bannerUrl = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bannerUrl: null == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BannersDtoImplCopyWith<$Res>
    implements $BannersDtoCopyWith<$Res> {
  factory _$$BannersDtoImplCopyWith(
          _$BannersDtoImpl value, $Res Function(_$BannersDtoImpl) then) =
      __$$BannersDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String bannerUrl, String url});
}

/// @nodoc
class __$$BannersDtoImplCopyWithImpl<$Res>
    extends _$BannersDtoCopyWithImpl<$Res, _$BannersDtoImpl>
    implements _$$BannersDtoImplCopyWith<$Res> {
  __$$BannersDtoImplCopyWithImpl(
      _$BannersDtoImpl _value, $Res Function(_$BannersDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bannerUrl = null,
    Object? url = null,
  }) {
    return _then(_$BannersDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bannerUrl: null == bannerUrl
          ? _value.bannerUrl
          : bannerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BannersDtoImpl extends _BannersDto with DiagnosticableTreeMixin {
  const _$BannersDtoImpl(
      {required this.id, required this.bannerUrl, required this.url})
      : super._();

  factory _$BannersDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BannersDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String bannerUrl;
  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BannersDto(id: $id, bannerUrl: $bannerUrl, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'BannersDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('bannerUrl', bannerUrl))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannersDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, bannerUrl, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannersDtoImplCopyWith<_$BannersDtoImpl> get copyWith =>
      __$$BannersDtoImplCopyWithImpl<_$BannersDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BannersDtoImplToJson(
      this,
    );
  }
}

abstract class _BannersDto extends BannersDto {
  const factory _BannersDto(
      {required final String id,
      required final String bannerUrl,
      required final String url}) = _$BannersDtoImpl;
  const _BannersDto._() : super._();

  factory _BannersDto.fromJson(Map<String, dynamic> json) =
      _$BannersDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get bannerUrl;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$BannersDtoImplCopyWith<_$BannersDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
