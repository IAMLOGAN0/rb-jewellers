import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failures.freezed.dart';

@freezed
abstract class AppFailures with _$AppFailures {
  const factory AppFailures.failureWithMessage(String message) =
      _FailureWithMessage;
  const factory AppFailures.unexpected() = _Unexpected;
  const factory AppFailures.insufficientPermission() = _InsufficientPermission;
  const factory AppFailures.firestoreFailure(String message) =
      _FirestoreFailure;
  const factory AppFailures.networkFailure() = _NetworkFailure;
}

Either<AppFailures, T> handleException<T>(dynamic e) {
  if (e is FirebaseException) {
    return left(AppFailures.firestoreFailure(e.message ?? ''));
  } else if (e is SocketException) {
    return left(const AppFailures.networkFailure());
  } else {
    return left(const AppFailures.unexpected());
  }
}
