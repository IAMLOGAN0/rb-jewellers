// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'golden_secure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GoldenSecure {
  String get id => throw _privateConstructorUsedError;
  String get planId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;
  Address get address => throw _privateConstructorUsedError;
  PhoneNumber get contactNumber => throw _privateConstructorUsedError;
  PhoneNumber get whatsappNumber => throw _privateConstructorUsedError;
  EmailAddress? get emailAddress => throw _privateConstructorUsedError;
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  DateTime? get dateOfAnniversary => throw _privateConstructorUsedError;
  String get schemeType => throw _privateConstructorUsedError;
  int get noOfInstallment => throw _privateConstructorUsedError;
  double get totalBookedGold => throw _privateConstructorUsedError;
  double get totalBookingAmount => throw _privateConstructorUsedError;
  DateTime get startDate => throw _privateConstructorUsedError;
  DateTime get endDate => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get adminComment => throw _privateConstructorUsedError;
  bool get isTermsAndConditonsAccepted => throw _privateConstructorUsedError;
  List<TransactionHistory>? get transactionHistory =>
      throw _privateConstructorUsedError;
  List<GoldBookingHistory>? get goldBookingHistory =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GoldenSecureCopyWith<GoldenSecure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoldenSecureCopyWith<$Res> {
  factory $GoldenSecureCopyWith(
          GoldenSecure value, $Res Function(GoldenSecure) then) =
      _$GoldenSecureCopyWithImpl<$Res, GoldenSecure>;
  @useResult
  $Res call(
      {String id,
      String planId,
      String userId,
      Name name,
      Address address,
      PhoneNumber contactNumber,
      PhoneNumber whatsappNumber,
      EmailAddress? emailAddress,
      DateTime? dateOfBirth,
      DateTime? dateOfAnniversary,
      String schemeType,
      int noOfInstallment,
      double totalBookedGold,
      double totalBookingAmount,
      DateTime startDate,
      DateTime endDate,
      DateTime createdAt,
      String status,
      String adminComment,
      bool isTermsAndConditonsAccepted,
      List<TransactionHistory>? transactionHistory,
      List<GoldBookingHistory>? goldBookingHistory});

  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class _$GoldenSecureCopyWithImpl<$Res, $Val extends GoldenSecure>
    implements $GoldenSecureCopyWith<$Res> {
  _$GoldenSecureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? userId = null,
    Object? name = null,
    Object? address = null,
    Object? contactNumber = null,
    Object? whatsappNumber = null,
    Object? emailAddress = freezed,
    Object? dateOfBirth = freezed,
    Object? dateOfAnniversary = freezed,
    Object? schemeType = null,
    Object? noOfInstallment = null,
    Object? totalBookedGold = null,
    Object? totalBookingAmount = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
    Object? status = null,
    Object? adminComment = null,
    Object? isTermsAndConditonsAccepted = null,
    Object? transactionHistory = freezed,
    Object? goldBookingHistory = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      whatsappNumber: null == whatsappNumber
          ? _value.whatsappNumber
          : whatsappNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateOfAnniversary: freezed == dateOfAnniversary
          ? _value.dateOfAnniversary
          : dateOfAnniversary // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      schemeType: null == schemeType
          ? _value.schemeType
          : schemeType // ignore: cast_nullable_to_non_nullable
              as String,
      noOfInstallment: null == noOfInstallment
          ? _value.noOfInstallment
          : noOfInstallment // ignore: cast_nullable_to_non_nullable
              as int,
      totalBookedGold: null == totalBookedGold
          ? _value.totalBookedGold
          : totalBookedGold // ignore: cast_nullable_to_non_nullable
              as double,
      totalBookingAmount: null == totalBookingAmount
          ? _value.totalBookingAmount
          : totalBookingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      adminComment: null == adminComment
          ? _value.adminComment
          : adminComment // ignore: cast_nullable_to_non_nullable
              as String,
      isTermsAndConditonsAccepted: null == isTermsAndConditonsAccepted
          ? _value.isTermsAndConditonsAccepted
          : isTermsAndConditonsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionHistory: freezed == transactionHistory
          ? _value.transactionHistory
          : transactionHistory // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>?,
      goldBookingHistory: freezed == goldBookingHistory
          ? _value.goldBookingHistory
          : goldBookingHistory // ignore: cast_nullable_to_non_nullable
              as List<GoldBookingHistory>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res> get address {
    return $AddressCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GoldenSecureImplCopyWith<$Res>
    implements $GoldenSecureCopyWith<$Res> {
  factory _$$GoldenSecureImplCopyWith(
          _$GoldenSecureImpl value, $Res Function(_$GoldenSecureImpl) then) =
      __$$GoldenSecureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String planId,
      String userId,
      Name name,
      Address address,
      PhoneNumber contactNumber,
      PhoneNumber whatsappNumber,
      EmailAddress? emailAddress,
      DateTime? dateOfBirth,
      DateTime? dateOfAnniversary,
      String schemeType,
      int noOfInstallment,
      double totalBookedGold,
      double totalBookingAmount,
      DateTime startDate,
      DateTime endDate,
      DateTime createdAt,
      String status,
      String adminComment,
      bool isTermsAndConditonsAccepted,
      List<TransactionHistory>? transactionHistory,
      List<GoldBookingHistory>? goldBookingHistory});

  @override
  $AddressCopyWith<$Res> get address;
}

/// @nodoc
class __$$GoldenSecureImplCopyWithImpl<$Res>
    extends _$GoldenSecureCopyWithImpl<$Res, _$GoldenSecureImpl>
    implements _$$GoldenSecureImplCopyWith<$Res> {
  __$$GoldenSecureImplCopyWithImpl(
      _$GoldenSecureImpl _value, $Res Function(_$GoldenSecureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? planId = null,
    Object? userId = null,
    Object? name = null,
    Object? address = null,
    Object? contactNumber = null,
    Object? whatsappNumber = null,
    Object? emailAddress = freezed,
    Object? dateOfBirth = freezed,
    Object? dateOfAnniversary = freezed,
    Object? schemeType = null,
    Object? noOfInstallment = null,
    Object? totalBookedGold = null,
    Object? totalBookingAmount = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? createdAt = null,
    Object? status = null,
    Object? adminComment = null,
    Object? isTermsAndConditonsAccepted = null,
    Object? transactionHistory = freezed,
    Object? goldBookingHistory = freezed,
  }) {
    return _then(_$GoldenSecureImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      planId: null == planId
          ? _value.planId
          : planId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      whatsappNumber: null == whatsappNumber
          ? _value.whatsappNumber
          : whatsappNumber // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
      emailAddress: freezed == emailAddress
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateOfAnniversary: freezed == dateOfAnniversary
          ? _value.dateOfAnniversary
          : dateOfAnniversary // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      schemeType: null == schemeType
          ? _value.schemeType
          : schemeType // ignore: cast_nullable_to_non_nullable
              as String,
      noOfInstallment: null == noOfInstallment
          ? _value.noOfInstallment
          : noOfInstallment // ignore: cast_nullable_to_non_nullable
              as int,
      totalBookedGold: null == totalBookedGold
          ? _value.totalBookedGold
          : totalBookedGold // ignore: cast_nullable_to_non_nullable
              as double,
      totalBookingAmount: null == totalBookingAmount
          ? _value.totalBookingAmount
          : totalBookingAmount // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      adminComment: null == adminComment
          ? _value.adminComment
          : adminComment // ignore: cast_nullable_to_non_nullable
              as String,
      isTermsAndConditonsAccepted: null == isTermsAndConditonsAccepted
          ? _value.isTermsAndConditonsAccepted
          : isTermsAndConditonsAccepted // ignore: cast_nullable_to_non_nullable
              as bool,
      transactionHistory: freezed == transactionHistory
          ? _value._transactionHistory
          : transactionHistory // ignore: cast_nullable_to_non_nullable
              as List<TransactionHistory>?,
      goldBookingHistory: freezed == goldBookingHistory
          ? _value._goldBookingHistory
          : goldBookingHistory // ignore: cast_nullable_to_non_nullable
              as List<GoldBookingHistory>?,
    ));
  }
}

/// @nodoc

class _$GoldenSecureImpl extends _GoldenSecure {
  const _$GoldenSecureImpl(
      {required this.id,
      required this.planId,
      required this.userId,
      required this.name,
      required this.address,
      required this.contactNumber,
      required this.whatsappNumber,
      required this.emailAddress,
      required this.dateOfBirth,
      required this.dateOfAnniversary,
      required this.schemeType,
      required this.noOfInstallment,
      required this.totalBookedGold,
      required this.totalBookingAmount,
      required this.startDate,
      required this.endDate,
      required this.createdAt,
      required this.status,
      required this.adminComment,
      required this.isTermsAndConditonsAccepted,
      required final List<TransactionHistory>? transactionHistory,
      required final List<GoldBookingHistory>? goldBookingHistory})
      : _transactionHistory = transactionHistory,
        _goldBookingHistory = goldBookingHistory,
        super._();

  @override
  final String id;
  @override
  final String planId;
  @override
  final String userId;
  @override
  final Name name;
  @override
  final Address address;
  @override
  final PhoneNumber contactNumber;
  @override
  final PhoneNumber whatsappNumber;
  @override
  final EmailAddress? emailAddress;
  @override
  final DateTime? dateOfBirth;
  @override
  final DateTime? dateOfAnniversary;
  @override
  final String schemeType;
  @override
  final int noOfInstallment;
  @override
  final double totalBookedGold;
  @override
  final double totalBookingAmount;
  @override
  final DateTime startDate;
  @override
  final DateTime endDate;
  @override
  final DateTime createdAt;
  @override
  final String status;
  @override
  final String adminComment;
  @override
  final bool isTermsAndConditonsAccepted;
  final List<TransactionHistory>? _transactionHistory;
  @override
  List<TransactionHistory>? get transactionHistory {
    final value = _transactionHistory;
    if (value == null) return null;
    if (_transactionHistory is EqualUnmodifiableListView)
      return _transactionHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<GoldBookingHistory>? _goldBookingHistory;
  @override
  List<GoldBookingHistory>? get goldBookingHistory {
    final value = _goldBookingHistory;
    if (value == null) return null;
    if (_goldBookingHistory is EqualUnmodifiableListView)
      return _goldBookingHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GoldenSecure(id: $id, planId: $planId, userId: $userId, name: $name, address: $address, contactNumber: $contactNumber, whatsappNumber: $whatsappNumber, emailAddress: $emailAddress, dateOfBirth: $dateOfBirth, dateOfAnniversary: $dateOfAnniversary, schemeType: $schemeType, noOfInstallment: $noOfInstallment, totalBookedGold: $totalBookedGold, totalBookingAmount: $totalBookingAmount, startDate: $startDate, endDate: $endDate, createdAt: $createdAt, status: $status, adminComment: $adminComment, isTermsAndConditonsAccepted: $isTermsAndConditonsAccepted, transactionHistory: $transactionHistory, goldBookingHistory: $goldBookingHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoldenSecureImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.planId, planId) || other.planId == planId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            (identical(other.whatsappNumber, whatsappNumber) ||
                other.whatsappNumber == whatsappNumber) &&
            (identical(other.emailAddress, emailAddress) ||
                other.emailAddress == emailAddress) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.dateOfAnniversary, dateOfAnniversary) ||
                other.dateOfAnniversary == dateOfAnniversary) &&
            (identical(other.schemeType, schemeType) ||
                other.schemeType == schemeType) &&
            (identical(other.noOfInstallment, noOfInstallment) ||
                other.noOfInstallment == noOfInstallment) &&
            (identical(other.totalBookedGold, totalBookedGold) ||
                other.totalBookedGold == totalBookedGold) &&
            (identical(other.totalBookingAmount, totalBookingAmount) ||
                other.totalBookingAmount == totalBookingAmount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.adminComment, adminComment) ||
                other.adminComment == adminComment) &&
            (identical(other.isTermsAndConditonsAccepted,
                    isTermsAndConditonsAccepted) ||
                other.isTermsAndConditonsAccepted ==
                    isTermsAndConditonsAccepted) &&
            const DeepCollectionEquality()
                .equals(other._transactionHistory, _transactionHistory) &&
            const DeepCollectionEquality()
                .equals(other._goldBookingHistory, _goldBookingHistory));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        planId,
        userId,
        name,
        address,
        contactNumber,
        whatsappNumber,
        emailAddress,
        dateOfBirth,
        dateOfAnniversary,
        schemeType,
        noOfInstallment,
        totalBookedGold,
        totalBookingAmount,
        startDate,
        endDate,
        createdAt,
        status,
        adminComment,
        isTermsAndConditonsAccepted,
        const DeepCollectionEquality().hash(_transactionHistory),
        const DeepCollectionEquality().hash(_goldBookingHistory)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GoldenSecureImplCopyWith<_$GoldenSecureImpl> get copyWith =>
      __$$GoldenSecureImplCopyWithImpl<_$GoldenSecureImpl>(this, _$identity);
}

abstract class _GoldenSecure extends GoldenSecure {
  const factory _GoldenSecure(
          {required final String id,
          required final String planId,
          required final String userId,
          required final Name name,
          required final Address address,
          required final PhoneNumber contactNumber,
          required final PhoneNumber whatsappNumber,
          required final EmailAddress? emailAddress,
          required final DateTime? dateOfBirth,
          required final DateTime? dateOfAnniversary,
          required final String schemeType,
          required final int noOfInstallment,
          required final double totalBookedGold,
          required final double totalBookingAmount,
          required final DateTime startDate,
          required final DateTime endDate,
          required final DateTime createdAt,
          required final String status,
          required final String adminComment,
          required final bool isTermsAndConditonsAccepted,
          required final List<TransactionHistory>? transactionHistory,
          required final List<GoldBookingHistory>? goldBookingHistory}) =
      _$GoldenSecureImpl;
  const _GoldenSecure._() : super._();

  @override
  String get id;
  @override
  String get planId;
  @override
  String get userId;
  @override
  Name get name;
  @override
  Address get address;
  @override
  PhoneNumber get contactNumber;
  @override
  PhoneNumber get whatsappNumber;
  @override
  EmailAddress? get emailAddress;
  @override
  DateTime? get dateOfBirth;
  @override
  DateTime? get dateOfAnniversary;
  @override
  String get schemeType;
  @override
  int get noOfInstallment;
  @override
  double get totalBookedGold;
  @override
  double get totalBookingAmount;
  @override
  DateTime get startDate;
  @override
  DateTime get endDate;
  @override
  DateTime get createdAt;
  @override
  String get status;
  @override
  String get adminComment;
  @override
  bool get isTermsAndConditonsAccepted;
  @override
  List<TransactionHistory>? get transactionHistory;
  @override
  List<GoldBookingHistory>? get goldBookingHistory;
  @override
  @JsonKey(ignore: true)
  _$$GoldenSecureImplCopyWith<_$GoldenSecureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
