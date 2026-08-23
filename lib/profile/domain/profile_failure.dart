import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_failure.freezed.dart';

@freezed
class ProfileFailure with _$ProfileFailure {
  const factory ProfileFailure.profileAlreadyExists() = _ProfileAlreadyExists;
  const factory ProfileFailure.profileNotFound() = _ProfileNotFound;
  const factory ProfileFailure.unexpected(String message) = _Unexpected;
}
