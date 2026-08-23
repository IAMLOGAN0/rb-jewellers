// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'banners.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Banners {
  String get id => throw _privateConstructorUsedError;
  String get bannerUrl => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BannersCopyWith<Banners> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannersCopyWith<$Res> {
  factory $BannersCopyWith(Banners value, $Res Function(Banners) then) =
      _$BannersCopyWithImpl<$Res, Banners>;
  @useResult
  $Res call({String id, String bannerUrl, String url});
}

/// @nodoc
class _$BannersCopyWithImpl<$Res, $Val extends Banners>
    implements $BannersCopyWith<$Res> {
  _$BannersCopyWithImpl(this._value, this._then);

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
abstract class _$$BannersImplCopyWith<$Res> implements $BannersCopyWith<$Res> {
  factory _$$BannersImplCopyWith(
          _$BannersImpl value, $Res Function(_$BannersImpl) then) =
      __$$BannersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String bannerUrl, String url});
}

/// @nodoc
class __$$BannersImplCopyWithImpl<$Res>
    extends _$BannersCopyWithImpl<$Res, _$BannersImpl>
    implements _$$BannersImplCopyWith<$Res> {
  __$$BannersImplCopyWithImpl(
      _$BannersImpl _value, $Res Function(_$BannersImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bannerUrl = null,
    Object? url = null,
  }) {
    return _then(_$BannersImpl(
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

class _$BannersImpl extends _Banners {
  const _$BannersImpl(
      {required this.id, required this.bannerUrl, required this.url})
      : super._();

  @override
  final String id;
  @override
  final String bannerUrl;
  @override
  final String url;

  @override
  String toString() {
    return 'Banners(id: $id, bannerUrl: $bannerUrl, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BannersImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bannerUrl, bannerUrl) ||
                other.bannerUrl == bannerUrl) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, bannerUrl, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BannersImplCopyWith<_$BannersImpl> get copyWith =>
      __$$BannersImplCopyWithImpl<_$BannersImpl>(this, _$identity);
}

abstract class _Banners extends Banners {
  const factory _Banners(
      {required final String id,
      required final String bannerUrl,
      required final String url}) = _$BannersImpl;
  const _Banners._() : super._();

  @override
  String get id;
  @override
  String get bannerUrl;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$BannersImplCopyWith<_$BannersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
