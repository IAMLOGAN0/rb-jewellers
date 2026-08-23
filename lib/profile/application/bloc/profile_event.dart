part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.started() = _Started;
  const factory ProfileEvent.createUser() = _CreateUser;
  const factory ProfileEvent.getUser() = _GetUser;
  const factory ProfileEvent.updateUser() = _UpdateUser;
  const factory ProfileEvent.phoneNumber(String phoneNumber) = _PhoneNumber;
  const factory ProfileEvent.name(String name) = _Name;
  const factory ProfileEvent.dateOfBirth(DateTime dateOfBirth) = _DateOfBirth;
  const factory ProfileEvent.maritalStatus(String maritalStatus) =_MaritalStatus;
  const factory ProfileEvent.anniversaryDate(DateTime anniversaryDate) =
      _AnniversaryDate;
  const factory ProfileEvent.location(String location) = _Location;
  const factory ProfileEvent.enableEdit() = _EnableEdit;
  const factory ProfileEvent.uploadKYC(
    File? aadharFront,
    File? aadharBack,
    File? panFront,
    File? panBack,
  ) = _UploadKYC;
  const factory ProfileEvent.getKYC() = _GetKYC;
}
