part of 'profile_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required Profile profile,
    required PhoneNumber? phoneNumber,
    required Name? name,
    required DateTime? dateOfBirth,
    required String? mariatialStatus,
    required DateTime? anniversaryDate,
    required String? location,
    required bool couponRedeemed,
    required bool showErrorMessages,
    required bool enableEdit,
    required Option<Either<ProfileFailure, Unit>> submitFailedOrSuccess,
    required Option<Either<dynamic, Profile>> responseFailedOrSuccess,
    required Option<Either<ProfileFailure, Unit>> kycSubmitFailedOrSuccess,
    required Option<Either<dynamic, KYC>> kycResponseFailedOrSuccess,
  }) = _ProfileState;

  factory ProfileState.initial() => ProfileState(
        profile: Profile.empty(),
        phoneNumber: null,
        name: null,
        dateOfBirth: null,
        mariatialStatus: null,
        anniversaryDate: null,
        location: '',
        couponRedeemed: false,
        enableEdit: false,
        showErrorMessages: false,
        submitFailedOrSuccess: none(),
        responseFailedOrSuccess: none(),
        kycSubmitFailedOrSuccess: none(),
        kycResponseFailedOrSuccess: none(),
      );
}
