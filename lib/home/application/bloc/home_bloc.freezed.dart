// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) selectedIndex,
    required TResult Function(String category) selectedCategory,
    required TResult Function() isSearching,
    required TResult Function(File photo) uploadBanner,
    required TResult Function() getBanners,
    required TResult Function(String bannerId) deletePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? selectedIndex,
    TResult? Function(String category)? selectedCategory,
    TResult? Function()? isSearching,
    TResult? Function(File photo)? uploadBanner,
    TResult? Function()? getBanners,
    TResult? Function(String bannerId)? deletePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? selectedIndex,
    TResult Function(String category)? selectedCategory,
    TResult Function()? isSearching,
    TResult Function(File photo)? uploadBanner,
    TResult Function()? getBanners,
    TResult Function(String bannerId)? deletePhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedIndex value) selectedIndex,
    required TResult Function(_SelectedCategory value) selectedCategory,
    required TResult Function(_IsSearching value) isSearching,
    required TResult Function(_UploadBanner value) uploadBanner,
    required TResult Function(_GetBanners value) getBanners,
    required TResult Function(_DeleteBanner value) deletePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedIndex value)? selectedIndex,
    TResult? Function(_SelectedCategory value)? selectedCategory,
    TResult? Function(_IsSearching value)? isSearching,
    TResult? Function(_UploadBanner value)? uploadBanner,
    TResult? Function(_GetBanners value)? getBanners,
    TResult? Function(_DeleteBanner value)? deletePhoto,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedIndex value)? selectedIndex,
    TResult Function(_SelectedCategory value)? selectedCategory,
    TResult Function(_IsSearching value)? isSearching,
    TResult Function(_UploadBanner value)? uploadBanner,
    TResult Function(_GetBanners value)? getBanners,
    TResult Function(_DeleteBanner value)? deletePhoto,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'HomeEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) selectedIndex,
    required TResult Function(String category) selectedCategory,
    required TResult Function() isSearching,
    required TResult Function(File photo) uploadBanner,
    required TResult Function() getBanners,
    required TResult Function(String bannerId) deletePhoto,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? selectedIndex,
    TResult? Function(String category)? selectedCategory,
    TResult? Function()? isSearching,
    TResult? Function(File photo)? uploadBanner,
    TResult? Function()? getBanners,
    TResult? Function(String bannerId)? deletePhoto,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? selectedIndex,
    TResult Function(String category)? selectedCategory,
    TResult Function()? isSearching,
    TResult Function(File photo)? uploadBanner,
    TResult Function()? getBanners,
    TResult Function(String bannerId)? deletePhoto,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedIndex value) selectedIndex,
    required TResult Function(_SelectedCategory value) selectedCategory,
    required TResult Function(_IsSearching value) isSearching,
    required TResult Function(_UploadBanner value) uploadBanner,
    required TResult Function(_GetBanners value) getBanners,
    required TResult Function(_DeleteBanner value) deletePhoto,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedIndex value)? selectedIndex,
    TResult? Function(_SelectedCategory value)? selectedCategory,
    TResult? Function(_IsSearching value)? isSearching,
    TResult? Function(_UploadBanner value)? uploadBanner,
    TResult? Function(_GetBanners value)? getBanners,
    TResult? Function(_DeleteBanner value)? deletePhoto,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedIndex value)? selectedIndex,
    TResult Function(_SelectedCategory value)? selectedCategory,
    TResult Function(_IsSearching value)? isSearching,
    TResult Function(_UploadBanner value)? uploadBanner,
    TResult Function(_GetBanners value)? getBanners,
    TResult Function(_DeleteBanner value)? deletePhoto,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SelectedIndexImplCopyWith<$Res> {
  factory _$$SelectedIndexImplCopyWith(
          _$SelectedIndexImpl value, $Res Function(_$SelectedIndexImpl) then) =
      __$$SelectedIndexImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$SelectedIndexImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$SelectedIndexImpl>
    implements _$$SelectedIndexImplCopyWith<$Res> {
  __$$SelectedIndexImplCopyWithImpl(
      _$SelectedIndexImpl _value, $Res Function(_$SelectedIndexImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$SelectedIndexImpl(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SelectedIndexImpl implements _SelectedIndex {
  const _$SelectedIndexImpl(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'HomeEvent.selectedIndex(index: $index)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedIndexImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedIndexImplCopyWith<_$SelectedIndexImpl> get copyWith =>
      __$$SelectedIndexImplCopyWithImpl<_$SelectedIndexImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) selectedIndex,
    required TResult Function(String category) selectedCategory,
    required TResult Function() isSearching,
    required TResult Function(File photo) uploadBanner,
    required TResult Function() getBanners,
    required TResult Function(String bannerId) deletePhoto,
  }) {
    return selectedIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? selectedIndex,
    TResult? Function(String category)? selectedCategory,
    TResult? Function()? isSearching,
    TResult? Function(File photo)? uploadBanner,
    TResult? Function()? getBanners,
    TResult? Function(String bannerId)? deletePhoto,
  }) {
    return selectedIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? selectedIndex,
    TResult Function(String category)? selectedCategory,
    TResult Function()? isSearching,
    TResult Function(File photo)? uploadBanner,
    TResult Function()? getBanners,
    TResult Function(String bannerId)? deletePhoto,
    required TResult orElse(),
  }) {
    if (selectedIndex != null) {
      return selectedIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedIndex value) selectedIndex,
    required TResult Function(_SelectedCategory value) selectedCategory,
    required TResult Function(_IsSearching value) isSearching,
    required TResult Function(_UploadBanner value) uploadBanner,
    required TResult Function(_GetBanners value) getBanners,
    required TResult Function(_DeleteBanner value) deletePhoto,
  }) {
    return selectedIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedIndex value)? selectedIndex,
    TResult? Function(_SelectedCategory value)? selectedCategory,
    TResult? Function(_IsSearching value)? isSearching,
    TResult? Function(_UploadBanner value)? uploadBanner,
    TResult? Function(_GetBanners value)? getBanners,
    TResult? Function(_DeleteBanner value)? deletePhoto,
  }) {
    return selectedIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedIndex value)? selectedIndex,
    TResult Function(_SelectedCategory value)? selectedCategory,
    TResult Function(_IsSearching value)? isSearching,
    TResult Function(_UploadBanner value)? uploadBanner,
    TResult Function(_GetBanners value)? getBanners,
    TResult Function(_DeleteBanner value)? deletePhoto,
    required TResult orElse(),
  }) {
    if (selectedIndex != null) {
      return selectedIndex(this);
    }
    return orElse();
  }
}

abstract class _SelectedIndex implements HomeEvent {
  const factory _SelectedIndex(final int index) = _$SelectedIndexImpl;

  int get index;
  @JsonKey(ignore: true)
  _$$SelectedIndexImplCopyWith<_$SelectedIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedCategoryImplCopyWith<$Res> {
  factory _$$SelectedCategoryImplCopyWith(_$SelectedCategoryImpl value,
          $Res Function(_$SelectedCategoryImpl) then) =
      __$$SelectedCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String category});
}

/// @nodoc
class __$$SelectedCategoryImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$SelectedCategoryImpl>
    implements _$$SelectedCategoryImplCopyWith<$Res> {
  __$$SelectedCategoryImplCopyWithImpl(_$SelectedCategoryImpl _value,
      $Res Function(_$SelectedCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$SelectedCategoryImpl(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectedCategoryImpl implements _SelectedCategory {
  const _$SelectedCategoryImpl(this.category);

  @override
  final String category;

  @override
  String toString() {
    return 'HomeEvent.selectedCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectedCategoryImplCopyWith<_$SelectedCategoryImpl> get copyWith =>
      __$$SelectedCategoryImplCopyWithImpl<_$SelectedCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) selectedIndex,
    required TResult Function(String category) selectedCategory,
    required TResult Function() isSearching,
    required TResult Function(File photo) uploadBanner,
    required TResult Function() getBanners,
    required TResult Function(String bannerId) deletePhoto,
  }) {
    return selectedCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? selectedIndex,
    TResult? Function(String category)? selectedCategory,
    TResult? Function()? isSearching,
    TResult? Function(File photo)? uploadBanner,
    TResult? Function()? getBanners,
    TResult? Function(String bannerId)? deletePhoto,
  }) {
    return selectedCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? selectedIndex,
    TResult Function(String category)? selectedCategory,
    TResult Function()? isSearching,
    TResult Function(File photo)? uploadBanner,
    TResult Function()? getBanners,
    TResult Function(String bannerId)? deletePhoto,
    required TResult orElse(),
  }) {
    if (selectedCategory != null) {
      return selectedCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedIndex value) selectedIndex,
    required TResult Function(_SelectedCategory value) selectedCategory,
    required TResult Function(_IsSearching value) isSearching,
    required TResult Function(_UploadBanner value) uploadBanner,
    required TResult Function(_GetBanners value) getBanners,
    required TResult Function(_DeleteBanner value) deletePhoto,
  }) {
    return selectedCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedIndex value)? selectedIndex,
    TResult? Function(_SelectedCategory value)? selectedCategory,
    TResult? Function(_IsSearching value)? isSearching,
    TResult? Function(_UploadBanner value)? uploadBanner,
    TResult? Function(_GetBanners value)? getBanners,
    TResult? Function(_DeleteBanner value)? deletePhoto,
  }) {
    return selectedCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedIndex value)? selectedIndex,
    TResult Function(_SelectedCategory value)? selectedCategory,
    TResult Function(_IsSearching value)? isSearching,
    TResult Function(_UploadBanner value)? uploadBanner,
    TResult Function(_GetBanners value)? getBanners,
    TResult Function(_DeleteBanner value)? deletePhoto,
    required TResult orElse(),
  }) {
    if (selectedCategory != null) {
      return selectedCategory(this);
    }
    return orElse();
  }
}

abstract class _SelectedCategory implements HomeEvent {
  const factory _SelectedCategory(final String category) =
      _$SelectedCategoryImpl;

  String get category;
  @JsonKey(ignore: true)
  _$$SelectedCategoryImplCopyWith<_$SelectedCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsSearchingImplCopyWith<$Res> {
  factory _$$IsSearchingImplCopyWith(
          _$IsSearchingImpl value, $Res Function(_$IsSearchingImpl) then) =
      __$$IsSearchingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IsSearchingImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$IsSearchingImpl>
    implements _$$IsSearchingImplCopyWith<$Res> {
  __$$IsSearchingImplCopyWithImpl(
      _$IsSearchingImpl _value, $Res Function(_$IsSearchingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IsSearchingImpl implements _IsSearching {
  const _$IsSearchingImpl();

  @override
  String toString() {
    return 'HomeEvent.isSearching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IsSearchingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) selectedIndex,
    required TResult Function(String category) selectedCategory,
    required TResult Function() isSearching,
    required TResult Function(File photo) uploadBanner,
    required TResult Function() getBanners,
    required TResult Function(String bannerId) deletePhoto,
  }) {
    return isSearching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? selectedIndex,
    TResult? Function(String category)? selectedCategory,
    TResult? Function()? isSearching,
    TResult? Function(File photo)? uploadBanner,
    TResult? Function()? getBanners,
    TResult? Function(String bannerId)? deletePhoto,
  }) {
    return isSearching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? selectedIndex,
    TResult Function(String category)? selectedCategory,
    TResult Function()? isSearching,
    TResult Function(File photo)? uploadBanner,
    TResult Function()? getBanners,
    TResult Function(String bannerId)? deletePhoto,
    required TResult orElse(),
  }) {
    if (isSearching != null) {
      return isSearching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedIndex value) selectedIndex,
    required TResult Function(_SelectedCategory value) selectedCategory,
    required TResult Function(_IsSearching value) isSearching,
    required TResult Function(_UploadBanner value) uploadBanner,
    required TResult Function(_GetBanners value) getBanners,
    required TResult Function(_DeleteBanner value) deletePhoto,
  }) {
    return isSearching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedIndex value)? selectedIndex,
    TResult? Function(_SelectedCategory value)? selectedCategory,
    TResult? Function(_IsSearching value)? isSearching,
    TResult? Function(_UploadBanner value)? uploadBanner,
    TResult? Function(_GetBanners value)? getBanners,
    TResult? Function(_DeleteBanner value)? deletePhoto,
  }) {
    return isSearching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedIndex value)? selectedIndex,
    TResult Function(_SelectedCategory value)? selectedCategory,
    TResult Function(_IsSearching value)? isSearching,
    TResult Function(_UploadBanner value)? uploadBanner,
    TResult Function(_GetBanners value)? getBanners,
    TResult Function(_DeleteBanner value)? deletePhoto,
    required TResult orElse(),
  }) {
    if (isSearching != null) {
      return isSearching(this);
    }
    return orElse();
  }
}

abstract class _IsSearching implements HomeEvent {
  const factory _IsSearching() = _$IsSearchingImpl;
}

/// @nodoc
abstract class _$$UploadBannerImplCopyWith<$Res> {
  factory _$$UploadBannerImplCopyWith(
          _$UploadBannerImpl value, $Res Function(_$UploadBannerImpl) then) =
      __$$UploadBannerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File photo});
}

/// @nodoc
class __$$UploadBannerImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$UploadBannerImpl>
    implements _$$UploadBannerImplCopyWith<$Res> {
  __$$UploadBannerImplCopyWithImpl(
      _$UploadBannerImpl _value, $Res Function(_$UploadBannerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photo = null,
  }) {
    return _then(_$UploadBannerImpl(
      null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$UploadBannerImpl implements _UploadBanner {
  const _$UploadBannerImpl(this.photo);

  @override
  final File photo;

  @override
  String toString() {
    return 'HomeEvent.uploadBanner(photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadBannerImpl &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadBannerImplCopyWith<_$UploadBannerImpl> get copyWith =>
      __$$UploadBannerImplCopyWithImpl<_$UploadBannerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) selectedIndex,
    required TResult Function(String category) selectedCategory,
    required TResult Function() isSearching,
    required TResult Function(File photo) uploadBanner,
    required TResult Function() getBanners,
    required TResult Function(String bannerId) deletePhoto,
  }) {
    return uploadBanner(photo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? selectedIndex,
    TResult? Function(String category)? selectedCategory,
    TResult? Function()? isSearching,
    TResult? Function(File photo)? uploadBanner,
    TResult? Function()? getBanners,
    TResult? Function(String bannerId)? deletePhoto,
  }) {
    return uploadBanner?.call(photo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? selectedIndex,
    TResult Function(String category)? selectedCategory,
    TResult Function()? isSearching,
    TResult Function(File photo)? uploadBanner,
    TResult Function()? getBanners,
    TResult Function(String bannerId)? deletePhoto,
    required TResult orElse(),
  }) {
    if (uploadBanner != null) {
      return uploadBanner(photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedIndex value) selectedIndex,
    required TResult Function(_SelectedCategory value) selectedCategory,
    required TResult Function(_IsSearching value) isSearching,
    required TResult Function(_UploadBanner value) uploadBanner,
    required TResult Function(_GetBanners value) getBanners,
    required TResult Function(_DeleteBanner value) deletePhoto,
  }) {
    return uploadBanner(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedIndex value)? selectedIndex,
    TResult? Function(_SelectedCategory value)? selectedCategory,
    TResult? Function(_IsSearching value)? isSearching,
    TResult? Function(_UploadBanner value)? uploadBanner,
    TResult? Function(_GetBanners value)? getBanners,
    TResult? Function(_DeleteBanner value)? deletePhoto,
  }) {
    return uploadBanner?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedIndex value)? selectedIndex,
    TResult Function(_SelectedCategory value)? selectedCategory,
    TResult Function(_IsSearching value)? isSearching,
    TResult Function(_UploadBanner value)? uploadBanner,
    TResult Function(_GetBanners value)? getBanners,
    TResult Function(_DeleteBanner value)? deletePhoto,
    required TResult orElse(),
  }) {
    if (uploadBanner != null) {
      return uploadBanner(this);
    }
    return orElse();
  }
}

abstract class _UploadBanner implements HomeEvent {
  const factory _UploadBanner(final File photo) = _$UploadBannerImpl;

  File get photo;
  @JsonKey(ignore: true)
  _$$UploadBannerImplCopyWith<_$UploadBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetBannersImplCopyWith<$Res> {
  factory _$$GetBannersImplCopyWith(
          _$GetBannersImpl value, $Res Function(_$GetBannersImpl) then) =
      __$$GetBannersImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetBannersImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetBannersImpl>
    implements _$$GetBannersImplCopyWith<$Res> {
  __$$GetBannersImplCopyWithImpl(
      _$GetBannersImpl _value, $Res Function(_$GetBannersImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetBannersImpl implements _GetBanners {
  const _$GetBannersImpl();

  @override
  String toString() {
    return 'HomeEvent.getBanners()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetBannersImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) selectedIndex,
    required TResult Function(String category) selectedCategory,
    required TResult Function() isSearching,
    required TResult Function(File photo) uploadBanner,
    required TResult Function() getBanners,
    required TResult Function(String bannerId) deletePhoto,
  }) {
    return getBanners();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? selectedIndex,
    TResult? Function(String category)? selectedCategory,
    TResult? Function()? isSearching,
    TResult? Function(File photo)? uploadBanner,
    TResult? Function()? getBanners,
    TResult? Function(String bannerId)? deletePhoto,
  }) {
    return getBanners?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? selectedIndex,
    TResult Function(String category)? selectedCategory,
    TResult Function()? isSearching,
    TResult Function(File photo)? uploadBanner,
    TResult Function()? getBanners,
    TResult Function(String bannerId)? deletePhoto,
    required TResult orElse(),
  }) {
    if (getBanners != null) {
      return getBanners();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedIndex value) selectedIndex,
    required TResult Function(_SelectedCategory value) selectedCategory,
    required TResult Function(_IsSearching value) isSearching,
    required TResult Function(_UploadBanner value) uploadBanner,
    required TResult Function(_GetBanners value) getBanners,
    required TResult Function(_DeleteBanner value) deletePhoto,
  }) {
    return getBanners(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedIndex value)? selectedIndex,
    TResult? Function(_SelectedCategory value)? selectedCategory,
    TResult? Function(_IsSearching value)? isSearching,
    TResult? Function(_UploadBanner value)? uploadBanner,
    TResult? Function(_GetBanners value)? getBanners,
    TResult? Function(_DeleteBanner value)? deletePhoto,
  }) {
    return getBanners?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedIndex value)? selectedIndex,
    TResult Function(_SelectedCategory value)? selectedCategory,
    TResult Function(_IsSearching value)? isSearching,
    TResult Function(_UploadBanner value)? uploadBanner,
    TResult Function(_GetBanners value)? getBanners,
    TResult Function(_DeleteBanner value)? deletePhoto,
    required TResult orElse(),
  }) {
    if (getBanners != null) {
      return getBanners(this);
    }
    return orElse();
  }
}

abstract class _GetBanners implements HomeEvent {
  const factory _GetBanners() = _$GetBannersImpl;
}

/// @nodoc
abstract class _$$DeleteBannerImplCopyWith<$Res> {
  factory _$$DeleteBannerImplCopyWith(
          _$DeleteBannerImpl value, $Res Function(_$DeleteBannerImpl) then) =
      __$$DeleteBannerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String bannerId});
}

/// @nodoc
class __$$DeleteBannerImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$DeleteBannerImpl>
    implements _$$DeleteBannerImplCopyWith<$Res> {
  __$$DeleteBannerImplCopyWithImpl(
      _$DeleteBannerImpl _value, $Res Function(_$DeleteBannerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bannerId = null,
  }) {
    return _then(_$DeleteBannerImpl(
      null == bannerId
          ? _value.bannerId
          : bannerId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteBannerImpl implements _DeleteBanner {
  const _$DeleteBannerImpl(this.bannerId);

  @override
  final String bannerId;

  @override
  String toString() {
    return 'HomeEvent.deletePhoto(bannerId: $bannerId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteBannerImpl &&
            (identical(other.bannerId, bannerId) ||
                other.bannerId == bannerId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bannerId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteBannerImplCopyWith<_$DeleteBannerImpl> get copyWith =>
      __$$DeleteBannerImplCopyWithImpl<_$DeleteBannerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int index) selectedIndex,
    required TResult Function(String category) selectedCategory,
    required TResult Function() isSearching,
    required TResult Function(File photo) uploadBanner,
    required TResult Function() getBanners,
    required TResult Function(String bannerId) deletePhoto,
  }) {
    return deletePhoto(bannerId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int index)? selectedIndex,
    TResult? Function(String category)? selectedCategory,
    TResult? Function()? isSearching,
    TResult? Function(File photo)? uploadBanner,
    TResult? Function()? getBanners,
    TResult? Function(String bannerId)? deletePhoto,
  }) {
    return deletePhoto?.call(bannerId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int index)? selectedIndex,
    TResult Function(String category)? selectedCategory,
    TResult Function()? isSearching,
    TResult Function(File photo)? uploadBanner,
    TResult Function()? getBanners,
    TResult Function(String bannerId)? deletePhoto,
    required TResult orElse(),
  }) {
    if (deletePhoto != null) {
      return deletePhoto(bannerId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_SelectedIndex value) selectedIndex,
    required TResult Function(_SelectedCategory value) selectedCategory,
    required TResult Function(_IsSearching value) isSearching,
    required TResult Function(_UploadBanner value) uploadBanner,
    required TResult Function(_GetBanners value) getBanners,
    required TResult Function(_DeleteBanner value) deletePhoto,
  }) {
    return deletePhoto(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_SelectedIndex value)? selectedIndex,
    TResult? Function(_SelectedCategory value)? selectedCategory,
    TResult? Function(_IsSearching value)? isSearching,
    TResult? Function(_UploadBanner value)? uploadBanner,
    TResult? Function(_GetBanners value)? getBanners,
    TResult? Function(_DeleteBanner value)? deletePhoto,
  }) {
    return deletePhoto?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_SelectedIndex value)? selectedIndex,
    TResult Function(_SelectedCategory value)? selectedCategory,
    TResult Function(_IsSearching value)? isSearching,
    TResult Function(_UploadBanner value)? uploadBanner,
    TResult Function(_GetBanners value)? getBanners,
    TResult Function(_DeleteBanner value)? deletePhoto,
    required TResult orElse(),
  }) {
    if (deletePhoto != null) {
      return deletePhoto(this);
    }
    return orElse();
  }
}

abstract class _DeleteBanner implements HomeEvent {
  const factory _DeleteBanner(final String bannerId) = _$DeleteBannerImpl;

  String get bannerId;
  @JsonKey(ignore: true)
  _$$DeleteBannerImplCopyWith<_$DeleteBannerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  int get selectedIndex => throw _privateConstructorUsedError;
  String get selectedCategory => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSearching => throw _privateConstructorUsedError;
  Option<Either<AppFailures, List<Banners>>>
      get bannersResponseFailureOrSuccessOption =>
          throw _privateConstructorUsedError;
  Option<Either<AppFailures, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {int selectedIndex,
      String selectedCategory,
      bool isLoading,
      bool isSearching,
      Option<Either<AppFailures, List<Banners>>>
          bannersResponseFailureOrSuccessOption,
      Option<Either<AppFailures, Unit>> saveFailureOrSuccessOption});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? selectedCategory = null,
    Object? isLoading = null,
    Object? isSearching = null,
    Object? bannersResponseFailureOrSuccessOption = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      bannersResponseFailureOrSuccessOption: null ==
              bannersResponseFailureOrSuccessOption
          ? _value.bannersResponseFailureOrSuccessOption
          : bannersResponseFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailures, List<Banners>>>,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailures, Unit>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int selectedIndex,
      String selectedCategory,
      bool isLoading,
      bool isSearching,
      Option<Either<AppFailures, List<Banners>>>
          bannersResponseFailureOrSuccessOption,
      Option<Either<AppFailures, Unit>> saveFailureOrSuccessOption});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? selectedCategory = null,
    Object? isLoading = null,
    Object? isSearching = null,
    Object? bannersResponseFailureOrSuccessOption = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_$HomeStateImpl(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategory: null == selectedCategory
          ? _value.selectedCategory
          : selectedCategory // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSearching: null == isSearching
          ? _value.isSearching
          : isSearching // ignore: cast_nullable_to_non_nullable
              as bool,
      bannersResponseFailureOrSuccessOption: null ==
              bannersResponseFailureOrSuccessOption
          ? _value.bannersResponseFailureOrSuccessOption
          : bannersResponseFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailures, List<Banners>>>,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailures, Unit>>,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {required this.selectedIndex,
      required this.selectedCategory,
      required this.isLoading,
      required this.isSearching,
      required this.bannersResponseFailureOrSuccessOption,
      required this.saveFailureOrSuccessOption});

  @override
  final int selectedIndex;
  @override
  final String selectedCategory;
  @override
  final bool isLoading;
  @override
  final bool isSearching;
  @override
  final Option<Either<AppFailures, List<Banners>>>
      bannersResponseFailureOrSuccessOption;
  @override
  final Option<Either<AppFailures, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'HomeState(selectedIndex: $selectedIndex, selectedCategory: $selectedCategory, isLoading: $isLoading, isSearching: $isSearching, bannersResponseFailureOrSuccessOption: $bannersResponseFailureOrSuccessOption, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.selectedCategory, selectedCategory) ||
                other.selectedCategory == selectedCategory) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSearching, isSearching) ||
                other.isSearching == isSearching) &&
            (identical(other.bannersResponseFailureOrSuccessOption,
                    bannersResponseFailureOrSuccessOption) ||
                other.bannersResponseFailureOrSuccessOption ==
                    bannersResponseFailureOrSuccessOption) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                other.saveFailureOrSuccessOption ==
                    saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedIndex,
      selectedCategory,
      isLoading,
      isSearching,
      bannersResponseFailureOrSuccessOption,
      saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final int selectedIndex,
      required final String selectedCategory,
      required final bool isLoading,
      required final bool isSearching,
      required final Option<Either<AppFailures, List<Banners>>>
          bannersResponseFailureOrSuccessOption,
      required final Option<Either<AppFailures, Unit>>
          saveFailureOrSuccessOption}) = _$HomeStateImpl;

  @override
  int get selectedIndex;
  @override
  String get selectedCategory;
  @override
  bool get isLoading;
  @override
  bool get isSearching;
  @override
  Option<Either<AppFailures, List<Banners>>>
      get bannersResponseFailureOrSuccessOption;
  @override
  Option<Either<AppFailures, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
