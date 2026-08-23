// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getProductCategories,
    required TResult Function(String categoryId) getProductsInCategory,
    required TResult Function(String query) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProductCategories,
    TResult? Function(String categoryId)? getProductsInCategory,
    TResult? Function(String query)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProductCategories,
    TResult Function(String categoryId)? getProductsInCategory,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProductCategories value) getProductCategories,
    required TResult Function(_GetProductsInCategory value)
        getProductsInCategory,
    required TResult Function(_Search value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProductCategories value)? getProductCategories,
    TResult? Function(_GetProductsInCategory value)? getProductsInCategory,
    TResult? Function(_Search value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProductCategories value)? getProductCategories,
    TResult Function(_GetProductsInCategory value)? getProductsInCategory,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res, ProductEvent>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res, $Val extends ProductEvent>
    implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

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
    extends _$ProductEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'ProductEvent.started()';
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
    required TResult Function() getProductCategories,
    required TResult Function(String categoryId) getProductsInCategory,
    required TResult Function(String query) search,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProductCategories,
    TResult? Function(String categoryId)? getProductsInCategory,
    TResult? Function(String query)? search,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProductCategories,
    TResult Function(String categoryId)? getProductsInCategory,
    TResult Function(String query)? search,
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
    required TResult Function(_GetProductCategories value) getProductCategories,
    required TResult Function(_GetProductsInCategory value)
        getProductsInCategory,
    required TResult Function(_Search value) search,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProductCategories value)? getProductCategories,
    TResult? Function(_GetProductsInCategory value)? getProductsInCategory,
    TResult? Function(_Search value)? search,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProductCategories value)? getProductCategories,
    TResult Function(_GetProductsInCategory value)? getProductsInCategory,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ProductEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetProductCategoriesImplCopyWith<$Res> {
  factory _$$GetProductCategoriesImplCopyWith(_$GetProductCategoriesImpl value,
          $Res Function(_$GetProductCategoriesImpl) then) =
      __$$GetProductCategoriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetProductCategoriesImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$GetProductCategoriesImpl>
    implements _$$GetProductCategoriesImplCopyWith<$Res> {
  __$$GetProductCategoriesImplCopyWithImpl(_$GetProductCategoriesImpl _value,
      $Res Function(_$GetProductCategoriesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetProductCategoriesImpl implements _GetProductCategories {
  const _$GetProductCategoriesImpl();

  @override
  String toString() {
    return 'ProductEvent.getProductCategories()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductCategoriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getProductCategories,
    required TResult Function(String categoryId) getProductsInCategory,
    required TResult Function(String query) search,
  }) {
    return getProductCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProductCategories,
    TResult? Function(String categoryId)? getProductsInCategory,
    TResult? Function(String query)? search,
  }) {
    return getProductCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProductCategories,
    TResult Function(String categoryId)? getProductsInCategory,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (getProductCategories != null) {
      return getProductCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProductCategories value) getProductCategories,
    required TResult Function(_GetProductsInCategory value)
        getProductsInCategory,
    required TResult Function(_Search value) search,
  }) {
    return getProductCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProductCategories value)? getProductCategories,
    TResult? Function(_GetProductsInCategory value)? getProductsInCategory,
    TResult? Function(_Search value)? search,
  }) {
    return getProductCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProductCategories value)? getProductCategories,
    TResult Function(_GetProductsInCategory value)? getProductsInCategory,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (getProductCategories != null) {
      return getProductCategories(this);
    }
    return orElse();
  }
}

abstract class _GetProductCategories implements ProductEvent {
  const factory _GetProductCategories() = _$GetProductCategoriesImpl;
}

/// @nodoc
abstract class _$$GetProductsInCategoryImplCopyWith<$Res> {
  factory _$$GetProductsInCategoryImplCopyWith(
          _$GetProductsInCategoryImpl value,
          $Res Function(_$GetProductsInCategoryImpl) then) =
      __$$GetProductsInCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String categoryId});
}

/// @nodoc
class __$$GetProductsInCategoryImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$GetProductsInCategoryImpl>
    implements _$$GetProductsInCategoryImplCopyWith<$Res> {
  __$$GetProductsInCategoryImplCopyWithImpl(_$GetProductsInCategoryImpl _value,
      $Res Function(_$GetProductsInCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
  }) {
    return _then(_$GetProductsInCategoryImpl(
      null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetProductsInCategoryImpl implements _GetProductsInCategory {
  const _$GetProductsInCategoryImpl(this.categoryId);

  @override
  final String categoryId;

  @override
  String toString() {
    return 'ProductEvent.getProductsInCategory(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetProductsInCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetProductsInCategoryImplCopyWith<_$GetProductsInCategoryImpl>
      get copyWith => __$$GetProductsInCategoryImplCopyWithImpl<
          _$GetProductsInCategoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getProductCategories,
    required TResult Function(String categoryId) getProductsInCategory,
    required TResult Function(String query) search,
  }) {
    return getProductsInCategory(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProductCategories,
    TResult? Function(String categoryId)? getProductsInCategory,
    TResult? Function(String query)? search,
  }) {
    return getProductsInCategory?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProductCategories,
    TResult Function(String categoryId)? getProductsInCategory,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (getProductsInCategory != null) {
      return getProductsInCategory(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProductCategories value) getProductCategories,
    required TResult Function(_GetProductsInCategory value)
        getProductsInCategory,
    required TResult Function(_Search value) search,
  }) {
    return getProductsInCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProductCategories value)? getProductCategories,
    TResult? Function(_GetProductsInCategory value)? getProductsInCategory,
    TResult? Function(_Search value)? search,
  }) {
    return getProductsInCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProductCategories value)? getProductCategories,
    TResult Function(_GetProductsInCategory value)? getProductsInCategory,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (getProductsInCategory != null) {
      return getProductsInCategory(this);
    }
    return orElse();
  }
}

abstract class _GetProductsInCategory implements ProductEvent {
  const factory _GetProductsInCategory(final String categoryId) =
      _$GetProductsInCategoryImpl;

  String get categoryId;
  @JsonKey(ignore: true)
  _$$GetProductsInCategoryImplCopyWith<_$GetProductsInCategoryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchImplCopyWith<$Res> {
  factory _$$SearchImplCopyWith(
          _$SearchImpl value, $Res Function(_$SearchImpl) then) =
      __$$SearchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$SearchImpl>
    implements _$$SearchImplCopyWith<$Res> {
  __$$SearchImplCopyWithImpl(
      _$SearchImpl _value, $Res Function(_$SearchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchImpl(
      null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchImpl implements _Search {
  const _$SearchImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'ProductEvent.search(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      __$$SearchImplCopyWithImpl<_$SearchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getProductCategories,
    required TResult Function(String categoryId) getProductsInCategory,
    required TResult Function(String query) search,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getProductCategories,
    TResult? Function(String categoryId)? getProductsInCategory,
    TResult? Function(String query)? search,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getProductCategories,
    TResult Function(String categoryId)? getProductsInCategory,
    TResult Function(String query)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetProductCategories value) getProductCategories,
    required TResult Function(_GetProductsInCategory value)
        getProductsInCategory,
    required TResult Function(_Search value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetProductCategories value)? getProductCategories,
    TResult? Function(_GetProductsInCategory value)? getProductsInCategory,
    TResult? Function(_Search value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetProductCategories value)? getProductCategories,
    TResult Function(_GetProductsInCategory value)? getProductsInCategory,
    TResult Function(_Search value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _Search implements ProductEvent {
  const factory _Search(final String query) = _$SearchImpl;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchImplCopyWith<_$SearchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductState {
  bool get isLoading => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  List<ProductCategory> get allCategories => throw _privateConstructorUsedError;
  List<Product> get allProducts => throw _privateConstructorUsedError;
  List<ProductCategory> get goldCategories =>
      throw _privateConstructorUsedError;
  List<ProductCategory> get silverCategories =>
      throw _privateConstructorUsedError;
  List<ProductCategory> get daimondCategories =>
      throw _privateConstructorUsedError;
  List<ProductCategory> get categoriesSearchResult =>
      throw _privateConstructorUsedError;
  List<Product> get productsSearchResult => throw _privateConstructorUsedError;
  Option<Either<AppFailures, List<ProductCategory>>>
      get productCategoryResponseFailureOrSuccessOption =>
          throw _privateConstructorUsedError;
  Option<Either<AppFailures, List<Product>>>
      get productResponseFailureOrSuccessOption =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call(
      {bool isLoading,
      String searchQuery,
      List<ProductCategory> allCategories,
      List<Product> allProducts,
      List<ProductCategory> goldCategories,
      List<ProductCategory> silverCategories,
      List<ProductCategory> daimondCategories,
      List<ProductCategory> categoriesSearchResult,
      List<Product> productsSearchResult,
      Option<Either<AppFailures, List<ProductCategory>>>
          productCategoryResponseFailureOrSuccessOption,
      Option<Either<AppFailures, List<Product>>>
          productResponseFailureOrSuccessOption});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? searchQuery = null,
    Object? allCategories = null,
    Object? allProducts = null,
    Object? goldCategories = null,
    Object? silverCategories = null,
    Object? daimondCategories = null,
    Object? categoriesSearchResult = null,
    Object? productsSearchResult = null,
    Object? productCategoryResponseFailureOrSuccessOption = null,
    Object? productResponseFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      allCategories: null == allCategories
          ? _value.allCategories
          : allCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      allProducts: null == allProducts
          ? _value.allProducts
          : allProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      goldCategories: null == goldCategories
          ? _value.goldCategories
          : goldCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      silverCategories: null == silverCategories
          ? _value.silverCategories
          : silverCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      daimondCategories: null == daimondCategories
          ? _value.daimondCategories
          : daimondCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      categoriesSearchResult: null == categoriesSearchResult
          ? _value.categoriesSearchResult
          : categoriesSearchResult // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      productsSearchResult: null == productsSearchResult
          ? _value.productsSearchResult
          : productsSearchResult // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      productCategoryResponseFailureOrSuccessOption: null ==
              productCategoryResponseFailureOrSuccessOption
          ? _value.productCategoryResponseFailureOrSuccessOption
          : productCategoryResponseFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailures, List<ProductCategory>>>,
      productResponseFailureOrSuccessOption: null ==
              productResponseFailureOrSuccessOption
          ? _value.productResponseFailureOrSuccessOption
          : productResponseFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailures, List<Product>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStateImplCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory _$$ProductStateImplCopyWith(
          _$ProductStateImpl value, $Res Function(_$ProductStateImpl) then) =
      __$$ProductStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      String searchQuery,
      List<ProductCategory> allCategories,
      List<Product> allProducts,
      List<ProductCategory> goldCategories,
      List<ProductCategory> silverCategories,
      List<ProductCategory> daimondCategories,
      List<ProductCategory> categoriesSearchResult,
      List<Product> productsSearchResult,
      Option<Either<AppFailures, List<ProductCategory>>>
          productCategoryResponseFailureOrSuccessOption,
      Option<Either<AppFailures, List<Product>>>
          productResponseFailureOrSuccessOption});
}

/// @nodoc
class __$$ProductStateImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$ProductStateImpl>
    implements _$$ProductStateImplCopyWith<$Res> {
  __$$ProductStateImplCopyWithImpl(
      _$ProductStateImpl _value, $Res Function(_$ProductStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? searchQuery = null,
    Object? allCategories = null,
    Object? allProducts = null,
    Object? goldCategories = null,
    Object? silverCategories = null,
    Object? daimondCategories = null,
    Object? categoriesSearchResult = null,
    Object? productsSearchResult = null,
    Object? productCategoryResponseFailureOrSuccessOption = null,
    Object? productResponseFailureOrSuccessOption = null,
  }) {
    return _then(_$ProductStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
      allCategories: null == allCategories
          ? _value._allCategories
          : allCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      allProducts: null == allProducts
          ? _value._allProducts
          : allProducts // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      goldCategories: null == goldCategories
          ? _value._goldCategories
          : goldCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      silverCategories: null == silverCategories
          ? _value._silverCategories
          : silverCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      daimondCategories: null == daimondCategories
          ? _value._daimondCategories
          : daimondCategories // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      categoriesSearchResult: null == categoriesSearchResult
          ? _value._categoriesSearchResult
          : categoriesSearchResult // ignore: cast_nullable_to_non_nullable
              as List<ProductCategory>,
      productsSearchResult: null == productsSearchResult
          ? _value._productsSearchResult
          : productsSearchResult // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      productCategoryResponseFailureOrSuccessOption: null ==
              productCategoryResponseFailureOrSuccessOption
          ? _value.productCategoryResponseFailureOrSuccessOption
          : productCategoryResponseFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailures, List<ProductCategory>>>,
      productResponseFailureOrSuccessOption: null ==
              productResponseFailureOrSuccessOption
          ? _value.productResponseFailureOrSuccessOption
          : productResponseFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailures, List<Product>>>,
    ));
  }
}

/// @nodoc

class _$ProductStateImpl implements _ProductState {
  const _$ProductStateImpl(
      {required this.isLoading,
      required this.searchQuery,
      required final List<ProductCategory> allCategories,
      required final List<Product> allProducts,
      required final List<ProductCategory> goldCategories,
      required final List<ProductCategory> silverCategories,
      required final List<ProductCategory> daimondCategories,
      required final List<ProductCategory> categoriesSearchResult,
      required final List<Product> productsSearchResult,
      required this.productCategoryResponseFailureOrSuccessOption,
      required this.productResponseFailureOrSuccessOption})
      : _allCategories = allCategories,
        _allProducts = allProducts,
        _goldCategories = goldCategories,
        _silverCategories = silverCategories,
        _daimondCategories = daimondCategories,
        _categoriesSearchResult = categoriesSearchResult,
        _productsSearchResult = productsSearchResult;

  @override
  final bool isLoading;
  @override
  final String searchQuery;
  final List<ProductCategory> _allCategories;
  @override
  List<ProductCategory> get allCategories {
    if (_allCategories is EqualUnmodifiableListView) return _allCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allCategories);
  }

  final List<Product> _allProducts;
  @override
  List<Product> get allProducts {
    if (_allProducts is EqualUnmodifiableListView) return _allProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allProducts);
  }

  final List<ProductCategory> _goldCategories;
  @override
  List<ProductCategory> get goldCategories {
    if (_goldCategories is EqualUnmodifiableListView) return _goldCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goldCategories);
  }

  final List<ProductCategory> _silverCategories;
  @override
  List<ProductCategory> get silverCategories {
    if (_silverCategories is EqualUnmodifiableListView)
      return _silverCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_silverCategories);
  }

  final List<ProductCategory> _daimondCategories;
  @override
  List<ProductCategory> get daimondCategories {
    if (_daimondCategories is EqualUnmodifiableListView)
      return _daimondCategories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daimondCategories);
  }

  final List<ProductCategory> _categoriesSearchResult;
  @override
  List<ProductCategory> get categoriesSearchResult {
    if (_categoriesSearchResult is EqualUnmodifiableListView)
      return _categoriesSearchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoriesSearchResult);
  }

  final List<Product> _productsSearchResult;
  @override
  List<Product> get productsSearchResult {
    if (_productsSearchResult is EqualUnmodifiableListView)
      return _productsSearchResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productsSearchResult);
  }

  @override
  final Option<Either<AppFailures, List<ProductCategory>>>
      productCategoryResponseFailureOrSuccessOption;
  @override
  final Option<Either<AppFailures, List<Product>>>
      productResponseFailureOrSuccessOption;

  @override
  String toString() {
    return 'ProductState(isLoading: $isLoading, searchQuery: $searchQuery, allCategories: $allCategories, allProducts: $allProducts, goldCategories: $goldCategories, silverCategories: $silverCategories, daimondCategories: $daimondCategories, categoriesSearchResult: $categoriesSearchResult, productsSearchResult: $productsSearchResult, productCategoryResponseFailureOrSuccessOption: $productCategoryResponseFailureOrSuccessOption, productResponseFailureOrSuccessOption: $productResponseFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality()
                .equals(other._allCategories, _allCategories) &&
            const DeepCollectionEquality()
                .equals(other._allProducts, _allProducts) &&
            const DeepCollectionEquality()
                .equals(other._goldCategories, _goldCategories) &&
            const DeepCollectionEquality()
                .equals(other._silverCategories, _silverCategories) &&
            const DeepCollectionEquality()
                .equals(other._daimondCategories, _daimondCategories) &&
            const DeepCollectionEquality().equals(
                other._categoriesSearchResult, _categoriesSearchResult) &&
            const DeepCollectionEquality()
                .equals(other._productsSearchResult, _productsSearchResult) &&
            (identical(other.productCategoryResponseFailureOrSuccessOption,
                    productCategoryResponseFailureOrSuccessOption) ||
                other.productCategoryResponseFailureOrSuccessOption ==
                    productCategoryResponseFailureOrSuccessOption) &&
            (identical(other.productResponseFailureOrSuccessOption,
                    productResponseFailureOrSuccessOption) ||
                other.productResponseFailureOrSuccessOption ==
                    productResponseFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      searchQuery,
      const DeepCollectionEquality().hash(_allCategories),
      const DeepCollectionEquality().hash(_allProducts),
      const DeepCollectionEquality().hash(_goldCategories),
      const DeepCollectionEquality().hash(_silverCategories),
      const DeepCollectionEquality().hash(_daimondCategories),
      const DeepCollectionEquality().hash(_categoriesSearchResult),
      const DeepCollectionEquality().hash(_productsSearchResult),
      productCategoryResponseFailureOrSuccessOption,
      productResponseFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      __$$ProductStateImplCopyWithImpl<_$ProductStateImpl>(this, _$identity);
}

abstract class _ProductState implements ProductState {
  const factory _ProductState(
      {required final bool isLoading,
      required final String searchQuery,
      required final List<ProductCategory> allCategories,
      required final List<Product> allProducts,
      required final List<ProductCategory> goldCategories,
      required final List<ProductCategory> silverCategories,
      required final List<ProductCategory> daimondCategories,
      required final List<ProductCategory> categoriesSearchResult,
      required final List<Product> productsSearchResult,
      required final Option<Either<AppFailures, List<ProductCategory>>>
          productCategoryResponseFailureOrSuccessOption,
      required final Option<Either<AppFailures, List<Product>>>
          productResponseFailureOrSuccessOption}) = _$ProductStateImpl;

  @override
  bool get isLoading;
  @override
  String get searchQuery;
  @override
  List<ProductCategory> get allCategories;
  @override
  List<Product> get allProducts;
  @override
  List<ProductCategory> get goldCategories;
  @override
  List<ProductCategory> get silverCategories;
  @override
  List<ProductCategory> get daimondCategories;
  @override
  List<ProductCategory> get categoriesSearchResult;
  @override
  List<Product> get productsSearchResult;
  @override
  Option<Either<AppFailures, List<ProductCategory>>>
      get productCategoryResponseFailureOrSuccessOption;
  @override
  Option<Either<AppFailures, List<Product>>>
      get productResponseFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$ProductStateImplCopyWith<_$ProductStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
