// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_category_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductCategoryDto _$ProductCategoryDtoFromJson(Map<String, dynamic> json) {
  return _ProductCategoryDto.fromJson(json);
}

/// @nodoc
mixin _$ProductCategoryDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get categoryImageUrl => throw _privateConstructorUsedError;
  String get sexCategory => throw _privateConstructorUsedError;
  String? get position => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCategoryDtoCopyWith<ProductCategoryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCategoryDtoCopyWith<$Res> {
  factory $ProductCategoryDtoCopyWith(
          ProductCategoryDto value, $Res Function(ProductCategoryDto) then) =
      _$ProductCategoryDtoCopyWithImpl<$Res, ProductCategoryDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String categoryImageUrl,
      String sexCategory,
      String? position});
}

/// @nodoc
class _$ProductCategoryDtoCopyWithImpl<$Res, $Val extends ProductCategoryDto>
    implements $ProductCategoryDtoCopyWith<$Res> {
  _$ProductCategoryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? categoryImageUrl = null,
    Object? sexCategory = null,
    Object? position = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImageUrl: null == categoryImageUrl
          ? _value.categoryImageUrl
          : categoryImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sexCategory: null == sexCategory
          ? _value.sexCategory
          : sexCategory // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCategoryDtoImplCopyWith<$Res>
    implements $ProductCategoryDtoCopyWith<$Res> {
  factory _$$ProductCategoryDtoImplCopyWith(_$ProductCategoryDtoImpl value,
          $Res Function(_$ProductCategoryDtoImpl) then) =
      __$$ProductCategoryDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      String categoryImageUrl,
      String sexCategory,
      String? position});
}

/// @nodoc
class __$$ProductCategoryDtoImplCopyWithImpl<$Res>
    extends _$ProductCategoryDtoCopyWithImpl<$Res, _$ProductCategoryDtoImpl>
    implements _$$ProductCategoryDtoImplCopyWith<$Res> {
  __$$ProductCategoryDtoImplCopyWithImpl(_$ProductCategoryDtoImpl _value,
      $Res Function(_$ProductCategoryDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? categoryImageUrl = null,
    Object? sexCategory = null,
    Object? position = freezed,
  }) {
    return _then(_$ProductCategoryDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      categoryImageUrl: null == categoryImageUrl
          ? _value.categoryImageUrl
          : categoryImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      sexCategory: null == sexCategory
          ? _value.sexCategory
          : sexCategory // ignore: cast_nullable_to_non_nullable
              as String,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductCategoryDtoImpl extends _ProductCategoryDto
    with DiagnosticableTreeMixin {
  const _$ProductCategoryDtoImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.categoryImageUrl,
      required this.sexCategory,
      required this.position})
      : super._();

  factory _$ProductCategoryDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductCategoryDtoImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final String categoryImageUrl;
  @override
  final String sexCategory;
  @override
  final String? position;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProductCategoryDto(id: $id, title: $title, description: $description, categoryImageUrl: $categoryImageUrl, sexCategory: $sexCategory, position: $position)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProductCategoryDto'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('categoryImageUrl', categoryImageUrl))
      ..add(DiagnosticsProperty('sexCategory', sexCategory))
      ..add(DiagnosticsProperty('position', position));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCategoryDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryImageUrl, categoryImageUrl) ||
                other.categoryImageUrl == categoryImageUrl) &&
            (identical(other.sexCategory, sexCategory) ||
                other.sexCategory == sexCategory) &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description,
      categoryImageUrl, sexCategory, position);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCategoryDtoImplCopyWith<_$ProductCategoryDtoImpl> get copyWith =>
      __$$ProductCategoryDtoImplCopyWithImpl<_$ProductCategoryDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductCategoryDtoImplToJson(
      this,
    );
  }
}

abstract class _ProductCategoryDto extends ProductCategoryDto {
  const factory _ProductCategoryDto(
      {required final String id,
      required final String title,
      required final String description,
      required final String categoryImageUrl,
      required final String sexCategory,
      required final String? position}) = _$ProductCategoryDtoImpl;
  const _ProductCategoryDto._() : super._();

  factory _ProductCategoryDto.fromJson(Map<String, dynamic> json) =
      _$ProductCategoryDtoImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  String get categoryImageUrl;
  @override
  String get sexCategory;
  @override
  String? get position;
  @override
  @JsonKey(ignore: true)
  _$$ProductCategoryDtoImplCopyWith<_$ProductCategoryDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
