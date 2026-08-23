// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalculatorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getGoldPrice,
    required TResult Function(String gram) calculateGoldPrice,
    required TResult Function(String price) calculateGoldQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getGoldPrice,
    TResult? Function(String gram)? calculateGoldPrice,
    TResult? Function(String price)? calculateGoldQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getGoldPrice,
    TResult Function(String gram)? calculateGoldPrice,
    TResult Function(String price)? calculateGoldQuantity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetGoldPrice value) getGoldPrice,
    required TResult Function(_CalculateGoldPrice value) calculateGoldPrice,
    required TResult Function(_CalculateGoldQuantity value)
        calculateGoldQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetGoldPrice value)? getGoldPrice,
    TResult? Function(_CalculateGoldPrice value)? calculateGoldPrice,
    TResult? Function(_CalculateGoldQuantity value)? calculateGoldQuantity,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetGoldPrice value)? getGoldPrice,
    TResult Function(_CalculateGoldPrice value)? calculateGoldPrice,
    TResult Function(_CalculateGoldQuantity value)? calculateGoldQuantity,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorEventCopyWith<$Res> {
  factory $CalculatorEventCopyWith(
          CalculatorEvent value, $Res Function(CalculatorEvent) then) =
      _$CalculatorEventCopyWithImpl<$Res, CalculatorEvent>;
}

/// @nodoc
class _$CalculatorEventCopyWithImpl<$Res, $Val extends CalculatorEvent>
    implements $CalculatorEventCopyWith<$Res> {
  _$CalculatorEventCopyWithImpl(this._value, this._then);

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
    extends _$CalculatorEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'CalculatorEvent.started()';
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
    required TResult Function() getGoldPrice,
    required TResult Function(String gram) calculateGoldPrice,
    required TResult Function(String price) calculateGoldQuantity,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getGoldPrice,
    TResult? Function(String gram)? calculateGoldPrice,
    TResult? Function(String price)? calculateGoldQuantity,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getGoldPrice,
    TResult Function(String gram)? calculateGoldPrice,
    TResult Function(String price)? calculateGoldQuantity,
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
    required TResult Function(_GetGoldPrice value) getGoldPrice,
    required TResult Function(_CalculateGoldPrice value) calculateGoldPrice,
    required TResult Function(_CalculateGoldQuantity value)
        calculateGoldQuantity,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetGoldPrice value)? getGoldPrice,
    TResult? Function(_CalculateGoldPrice value)? calculateGoldPrice,
    TResult? Function(_CalculateGoldQuantity value)? calculateGoldQuantity,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetGoldPrice value)? getGoldPrice,
    TResult Function(_CalculateGoldPrice value)? calculateGoldPrice,
    TResult Function(_CalculateGoldQuantity value)? calculateGoldQuantity,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CalculatorEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetGoldPriceImplCopyWith<$Res> {
  factory _$$GetGoldPriceImplCopyWith(
          _$GetGoldPriceImpl value, $Res Function(_$GetGoldPriceImpl) then) =
      __$$GetGoldPriceImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetGoldPriceImplCopyWithImpl<$Res>
    extends _$CalculatorEventCopyWithImpl<$Res, _$GetGoldPriceImpl>
    implements _$$GetGoldPriceImplCopyWith<$Res> {
  __$$GetGoldPriceImplCopyWithImpl(
      _$GetGoldPriceImpl _value, $Res Function(_$GetGoldPriceImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetGoldPriceImpl implements _GetGoldPrice {
  const _$GetGoldPriceImpl();

  @override
  String toString() {
    return 'CalculatorEvent.getGoldPrice()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetGoldPriceImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getGoldPrice,
    required TResult Function(String gram) calculateGoldPrice,
    required TResult Function(String price) calculateGoldQuantity,
  }) {
    return getGoldPrice();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getGoldPrice,
    TResult? Function(String gram)? calculateGoldPrice,
    TResult? Function(String price)? calculateGoldQuantity,
  }) {
    return getGoldPrice?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getGoldPrice,
    TResult Function(String gram)? calculateGoldPrice,
    TResult Function(String price)? calculateGoldQuantity,
    required TResult orElse(),
  }) {
    if (getGoldPrice != null) {
      return getGoldPrice();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetGoldPrice value) getGoldPrice,
    required TResult Function(_CalculateGoldPrice value) calculateGoldPrice,
    required TResult Function(_CalculateGoldQuantity value)
        calculateGoldQuantity,
  }) {
    return getGoldPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetGoldPrice value)? getGoldPrice,
    TResult? Function(_CalculateGoldPrice value)? calculateGoldPrice,
    TResult? Function(_CalculateGoldQuantity value)? calculateGoldQuantity,
  }) {
    return getGoldPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetGoldPrice value)? getGoldPrice,
    TResult Function(_CalculateGoldPrice value)? calculateGoldPrice,
    TResult Function(_CalculateGoldQuantity value)? calculateGoldQuantity,
    required TResult orElse(),
  }) {
    if (getGoldPrice != null) {
      return getGoldPrice(this);
    }
    return orElse();
  }
}

abstract class _GetGoldPrice implements CalculatorEvent {
  const factory _GetGoldPrice() = _$GetGoldPriceImpl;
}

/// @nodoc
abstract class _$$CalculateGoldPriceImplCopyWith<$Res> {
  factory _$$CalculateGoldPriceImplCopyWith(_$CalculateGoldPriceImpl value,
          $Res Function(_$CalculateGoldPriceImpl) then) =
      __$$CalculateGoldPriceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String gram});
}

/// @nodoc
class __$$CalculateGoldPriceImplCopyWithImpl<$Res>
    extends _$CalculatorEventCopyWithImpl<$Res, _$CalculateGoldPriceImpl>
    implements _$$CalculateGoldPriceImplCopyWith<$Res> {
  __$$CalculateGoldPriceImplCopyWithImpl(_$CalculateGoldPriceImpl _value,
      $Res Function(_$CalculateGoldPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gram = null,
  }) {
    return _then(_$CalculateGoldPriceImpl(
      null == gram
          ? _value.gram
          : gram // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CalculateGoldPriceImpl implements _CalculateGoldPrice {
  const _$CalculateGoldPriceImpl(this.gram);

  @override
  final String gram;

  @override
  String toString() {
    return 'CalculatorEvent.calculateGoldPrice(gram: $gram)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculateGoldPriceImpl &&
            (identical(other.gram, gram) || other.gram == gram));
  }

  @override
  int get hashCode => Object.hash(runtimeType, gram);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculateGoldPriceImplCopyWith<_$CalculateGoldPriceImpl> get copyWith =>
      __$$CalculateGoldPriceImplCopyWithImpl<_$CalculateGoldPriceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getGoldPrice,
    required TResult Function(String gram) calculateGoldPrice,
    required TResult Function(String price) calculateGoldQuantity,
  }) {
    return calculateGoldPrice(gram);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getGoldPrice,
    TResult? Function(String gram)? calculateGoldPrice,
    TResult? Function(String price)? calculateGoldQuantity,
  }) {
    return calculateGoldPrice?.call(gram);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getGoldPrice,
    TResult Function(String gram)? calculateGoldPrice,
    TResult Function(String price)? calculateGoldQuantity,
    required TResult orElse(),
  }) {
    if (calculateGoldPrice != null) {
      return calculateGoldPrice(gram);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetGoldPrice value) getGoldPrice,
    required TResult Function(_CalculateGoldPrice value) calculateGoldPrice,
    required TResult Function(_CalculateGoldQuantity value)
        calculateGoldQuantity,
  }) {
    return calculateGoldPrice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetGoldPrice value)? getGoldPrice,
    TResult? Function(_CalculateGoldPrice value)? calculateGoldPrice,
    TResult? Function(_CalculateGoldQuantity value)? calculateGoldQuantity,
  }) {
    return calculateGoldPrice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetGoldPrice value)? getGoldPrice,
    TResult Function(_CalculateGoldPrice value)? calculateGoldPrice,
    TResult Function(_CalculateGoldQuantity value)? calculateGoldQuantity,
    required TResult orElse(),
  }) {
    if (calculateGoldPrice != null) {
      return calculateGoldPrice(this);
    }
    return orElse();
  }
}

abstract class _CalculateGoldPrice implements CalculatorEvent {
  const factory _CalculateGoldPrice(final String gram) =
      _$CalculateGoldPriceImpl;

  String get gram;
  @JsonKey(ignore: true)
  _$$CalculateGoldPriceImplCopyWith<_$CalculateGoldPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CalculateGoldQuantityImplCopyWith<$Res> {
  factory _$$CalculateGoldQuantityImplCopyWith(
          _$CalculateGoldQuantityImpl value,
          $Res Function(_$CalculateGoldQuantityImpl) then) =
      __$$CalculateGoldQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String price});
}

/// @nodoc
class __$$CalculateGoldQuantityImplCopyWithImpl<$Res>
    extends _$CalculatorEventCopyWithImpl<$Res, _$CalculateGoldQuantityImpl>
    implements _$$CalculateGoldQuantityImplCopyWith<$Res> {
  __$$CalculateGoldQuantityImplCopyWithImpl(_$CalculateGoldQuantityImpl _value,
      $Res Function(_$CalculateGoldQuantityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
  }) {
    return _then(_$CalculateGoldQuantityImpl(
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CalculateGoldQuantityImpl implements _CalculateGoldQuantity {
  const _$CalculateGoldQuantityImpl(this.price);

  @override
  final String price;

  @override
  String toString() {
    return 'CalculatorEvent.calculateGoldQuantity(price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculateGoldQuantityImpl &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculateGoldQuantityImplCopyWith<_$CalculateGoldQuantityImpl>
      get copyWith => __$$CalculateGoldQuantityImplCopyWithImpl<
          _$CalculateGoldQuantityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getGoldPrice,
    required TResult Function(String gram) calculateGoldPrice,
    required TResult Function(String price) calculateGoldQuantity,
  }) {
    return calculateGoldQuantity(price);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getGoldPrice,
    TResult? Function(String gram)? calculateGoldPrice,
    TResult? Function(String price)? calculateGoldQuantity,
  }) {
    return calculateGoldQuantity?.call(price);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getGoldPrice,
    TResult Function(String gram)? calculateGoldPrice,
    TResult Function(String price)? calculateGoldQuantity,
    required TResult orElse(),
  }) {
    if (calculateGoldQuantity != null) {
      return calculateGoldQuantity(price);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetGoldPrice value) getGoldPrice,
    required TResult Function(_CalculateGoldPrice value) calculateGoldPrice,
    required TResult Function(_CalculateGoldQuantity value)
        calculateGoldQuantity,
  }) {
    return calculateGoldQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetGoldPrice value)? getGoldPrice,
    TResult? Function(_CalculateGoldPrice value)? calculateGoldPrice,
    TResult? Function(_CalculateGoldQuantity value)? calculateGoldQuantity,
  }) {
    return calculateGoldQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetGoldPrice value)? getGoldPrice,
    TResult Function(_CalculateGoldPrice value)? calculateGoldPrice,
    TResult Function(_CalculateGoldQuantity value)? calculateGoldQuantity,
    required TResult orElse(),
  }) {
    if (calculateGoldQuantity != null) {
      return calculateGoldQuantity(this);
    }
    return orElse();
  }
}

abstract class _CalculateGoldQuantity implements CalculatorEvent {
  const factory _CalculateGoldQuantity(final String price) =
      _$CalculateGoldQuantityImpl;

  String get price;
  @JsonKey(ignore: true)
  _$$CalculateGoldQuantityImplCopyWith<_$CalculateGoldQuantityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CalculatorState {
  bool get isLoading => throw _privateConstructorUsedError;
  GoldPrice get goldPrice => throw _privateConstructorUsedError;
  String get calculatedPrice => throw _privateConstructorUsedError;
  String get calculatedQuantity => throw _privateConstructorUsedError;
  String get calculatedMakingCharges => throw _privateConstructorUsedError;
  String get calculatedGST => throw _privateConstructorUsedError;
  bool get editingQty => throw _privateConstructorUsedError;
  bool get editingPrice => throw _privateConstructorUsedError;
  Option<Either<AppFailures, GoldPrice>>
      get goldResponseFailureOrSuccessOption =>
          throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalculatorStateCopyWith<CalculatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatorStateCopyWith<$Res> {
  factory $CalculatorStateCopyWith(
          CalculatorState value, $Res Function(CalculatorState) then) =
      _$CalculatorStateCopyWithImpl<$Res, CalculatorState>;
  @useResult
  $Res call(
      {bool isLoading,
      GoldPrice goldPrice,
      String calculatedPrice,
      String calculatedQuantity,
      String calculatedMakingCharges,
      String calculatedGST,
      bool editingQty,
      bool editingPrice,
      Option<Either<AppFailures, GoldPrice>>
          goldResponseFailureOrSuccessOption});

  $GoldPriceCopyWith<$Res> get goldPrice;
}

/// @nodoc
class _$CalculatorStateCopyWithImpl<$Res, $Val extends CalculatorState>
    implements $CalculatorStateCopyWith<$Res> {
  _$CalculatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? goldPrice = null,
    Object? calculatedPrice = null,
    Object? calculatedQuantity = null,
    Object? calculatedMakingCharges = null,
    Object? calculatedGST = null,
    Object? editingQty = null,
    Object? editingPrice = null,
    Object? goldResponseFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      goldPrice: null == goldPrice
          ? _value.goldPrice
          : goldPrice // ignore: cast_nullable_to_non_nullable
              as GoldPrice,
      calculatedPrice: null == calculatedPrice
          ? _value.calculatedPrice
          : calculatedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedQuantity: null == calculatedQuantity
          ? _value.calculatedQuantity
          : calculatedQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedMakingCharges: null == calculatedMakingCharges
          ? _value.calculatedMakingCharges
          : calculatedMakingCharges // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedGST: null == calculatedGST
          ? _value.calculatedGST
          : calculatedGST // ignore: cast_nullable_to_non_nullable
              as String,
      editingQty: null == editingQty
          ? _value.editingQty
          : editingQty // ignore: cast_nullable_to_non_nullable
              as bool,
      editingPrice: null == editingPrice
          ? _value.editingPrice
          : editingPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      goldResponseFailureOrSuccessOption: null ==
              goldResponseFailureOrSuccessOption
          ? _value.goldResponseFailureOrSuccessOption
          : goldResponseFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailures, GoldPrice>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GoldPriceCopyWith<$Res> get goldPrice {
    return $GoldPriceCopyWith<$Res>(_value.goldPrice, (value) {
      return _then(_value.copyWith(goldPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CalculatorStateImplCopyWith<$Res>
    implements $CalculatorStateCopyWith<$Res> {
  factory _$$CalculatorStateImplCopyWith(_$CalculatorStateImpl value,
          $Res Function(_$CalculatorStateImpl) then) =
      __$$CalculatorStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      GoldPrice goldPrice,
      String calculatedPrice,
      String calculatedQuantity,
      String calculatedMakingCharges,
      String calculatedGST,
      bool editingQty,
      bool editingPrice,
      Option<Either<AppFailures, GoldPrice>>
          goldResponseFailureOrSuccessOption});

  @override
  $GoldPriceCopyWith<$Res> get goldPrice;
}

/// @nodoc
class __$$CalculatorStateImplCopyWithImpl<$Res>
    extends _$CalculatorStateCopyWithImpl<$Res, _$CalculatorStateImpl>
    implements _$$CalculatorStateImplCopyWith<$Res> {
  __$$CalculatorStateImplCopyWithImpl(
      _$CalculatorStateImpl _value, $Res Function(_$CalculatorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? goldPrice = null,
    Object? calculatedPrice = null,
    Object? calculatedQuantity = null,
    Object? calculatedMakingCharges = null,
    Object? calculatedGST = null,
    Object? editingQty = null,
    Object? editingPrice = null,
    Object? goldResponseFailureOrSuccessOption = null,
  }) {
    return _then(_$CalculatorStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      goldPrice: null == goldPrice
          ? _value.goldPrice
          : goldPrice // ignore: cast_nullable_to_non_nullable
              as GoldPrice,
      calculatedPrice: null == calculatedPrice
          ? _value.calculatedPrice
          : calculatedPrice // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedQuantity: null == calculatedQuantity
          ? _value.calculatedQuantity
          : calculatedQuantity // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedMakingCharges: null == calculatedMakingCharges
          ? _value.calculatedMakingCharges
          : calculatedMakingCharges // ignore: cast_nullable_to_non_nullable
              as String,
      calculatedGST: null == calculatedGST
          ? _value.calculatedGST
          : calculatedGST // ignore: cast_nullable_to_non_nullable
              as String,
      editingQty: null == editingQty
          ? _value.editingQty
          : editingQty // ignore: cast_nullable_to_non_nullable
              as bool,
      editingPrice: null == editingPrice
          ? _value.editingPrice
          : editingPrice // ignore: cast_nullable_to_non_nullable
              as bool,
      goldResponseFailureOrSuccessOption: null ==
              goldResponseFailureOrSuccessOption
          ? _value.goldResponseFailureOrSuccessOption
          : goldResponseFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<AppFailures, GoldPrice>>,
    ));
  }
}

/// @nodoc

class _$CalculatorStateImpl implements _CalculatorState {
  const _$CalculatorStateImpl(
      {required this.isLoading,
      required this.goldPrice,
      required this.calculatedPrice,
      required this.calculatedQuantity,
      required this.calculatedMakingCharges,
      required this.calculatedGST,
      required this.editingQty,
      required this.editingPrice,
      required this.goldResponseFailureOrSuccessOption});

  @override
  final bool isLoading;
  @override
  final GoldPrice goldPrice;
  @override
  final String calculatedPrice;
  @override
  final String calculatedQuantity;
  @override
  final String calculatedMakingCharges;
  @override
  final String calculatedGST;
  @override
  final bool editingQty;
  @override
  final bool editingPrice;
  @override
  final Option<Either<AppFailures, GoldPrice>>
      goldResponseFailureOrSuccessOption;

  @override
  String toString() {
    return 'CalculatorState(isLoading: $isLoading, goldPrice: $goldPrice, calculatedPrice: $calculatedPrice, calculatedQuantity: $calculatedQuantity, calculatedMakingCharges: $calculatedMakingCharges, calculatedGST: $calculatedGST, editingQty: $editingQty, editingPrice: $editingPrice, goldResponseFailureOrSuccessOption: $goldResponseFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculatorStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.goldPrice, goldPrice) ||
                other.goldPrice == goldPrice) &&
            (identical(other.calculatedPrice, calculatedPrice) ||
                other.calculatedPrice == calculatedPrice) &&
            (identical(other.calculatedQuantity, calculatedQuantity) ||
                other.calculatedQuantity == calculatedQuantity) &&
            (identical(
                    other.calculatedMakingCharges, calculatedMakingCharges) ||
                other.calculatedMakingCharges == calculatedMakingCharges) &&
            (identical(other.calculatedGST, calculatedGST) ||
                other.calculatedGST == calculatedGST) &&
            (identical(other.editingQty, editingQty) ||
                other.editingQty == editingQty) &&
            (identical(other.editingPrice, editingPrice) ||
                other.editingPrice == editingPrice) &&
            (identical(other.goldResponseFailureOrSuccessOption,
                    goldResponseFailureOrSuccessOption) ||
                other.goldResponseFailureOrSuccessOption ==
                    goldResponseFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoading,
      goldPrice,
      calculatedPrice,
      calculatedQuantity,
      calculatedMakingCharges,
      calculatedGST,
      editingQty,
      editingPrice,
      goldResponseFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculatorStateImplCopyWith<_$CalculatorStateImpl> get copyWith =>
      __$$CalculatorStateImplCopyWithImpl<_$CalculatorStateImpl>(
          this, _$identity);
}

abstract class _CalculatorState implements CalculatorState {
  const factory _CalculatorState(
      {required final bool isLoading,
      required final GoldPrice goldPrice,
      required final String calculatedPrice,
      required final String calculatedQuantity,
      required final String calculatedMakingCharges,
      required final String calculatedGST,
      required final bool editingQty,
      required final bool editingPrice,
      required final Option<Either<AppFailures, GoldPrice>>
          goldResponseFailureOrSuccessOption}) = _$CalculatorStateImpl;

  @override
  bool get isLoading;
  @override
  GoldPrice get goldPrice;
  @override
  String get calculatedPrice;
  @override
  String get calculatedQuantity;
  @override
  String get calculatedMakingCharges;
  @override
  String get calculatedGST;
  @override
  bool get editingQty;
  @override
  bool get editingPrice;
  @override
  Option<Either<AppFailures, GoldPrice>> get goldResponseFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$CalculatorStateImplCopyWith<_$CalculatorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
