import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/domain/core/value_objects.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_dialogs.dart';
import 'package:rb_jewellers/profile/domain/kyc.dart';

import '../../../authentication/domain/user.dart';
import '../../domain/i_profile_repository.dart';
import '../../domain/profile.dart';
import '../../domain/profile_failure.dart';
import '../../domain/value_objects.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final IProfileRepository profileRepository;
  ProfileBloc(this.profileRepository) : super(ProfileState.initial()) {
    on<_Started>((event, emit) {});

    on<_EnableEdit>((event, emit) {
      if (state.enableEdit) {
        emit(state.copyWith(
          enableEdit: !state.enableEdit,
          submitFailedOrSuccess: none(),
          showErrorMessages: false,
        ));
        return;
      }
      emit(state.copyWith(
        enableEdit: !state.enableEdit,
        name: state.profile.name,
        phoneNumber: state.profile.phoneNumber,
        dateOfBirth: state.profile.dateOfBirth,
        mariatialStatus: state.profile.mariatialStatus,
        anniversaryDate: state.profile.anniversaryDate,
        location: state.profile.location,
      ));
    });

    on<_CreateUser>((event, emit) async {
      emit(state.copyWith(
        showErrorMessages: true,
        submitFailedOrSuccess: none(),
      ));

      if (!(state.name?.isValid() ?? true)) {
        toastMessage('Enter valid name');
        return;
      }
      if (state.dateOfBirth == null) {
        toastMessage('Select valid date of birth');
        return;
      }
      if (state.mariatialStatus == null) {
        toastMessage('Select valid marital status');
        return;
      }
      if (state.mariatialStatus == 'Married' && state.anniversaryDate == null) {
        toastMessage('Select valid anniversary date');
        return;
      }
      if (state.location == null) {
        toastMessage('Enter valid location');
        return;
      }

      final failureOrSuccess = await profileRepository.createProfile(
        AppUser.uniqueId,
        Profile(
            id: AppUser.uniqueId,
            name: state.name!,
            dateOfBirth: state.dateOfBirth!,
            mariatialStatus: state.mariatialStatus!,
            anniversaryDate: state.anniversaryDate,
            location: state.location!,
            couponRedeemed: state.couponRedeemed,
            couponCode: AppUser.uniqueId.getOrCrash().substring(0, 8),
            phoneNumber: state.phoneNumber!),
      );

      emit(state.copyWith(
        showErrorMessages: false,
        submitFailedOrSuccess: optionOf(failureOrSuccess),
      ));

      add(const _GetUser());
    });

    on<_UpdateUser>((event, emit) async {
      emit(state.copyWith(
        showErrorMessages: true,
        submitFailedOrSuccess: none(),
      ));

      // if (!(state.name?.isValid() ?? true)) {
      //   toastMessage('Enter valid name');
      //   return;
      // }
      if (state.dateOfBirth == null) {
        toastMessage('Select valid date of birth');
        return;
      }
      if (state.mariatialStatus == null) {
        toastMessage('Select valid marital status');
        return;
      }
      if (state.mariatialStatus == 'Married' && state.anniversaryDate == null) {
        toastMessage('Select valid anniversary date');
        return;
      }
      if (state.location == null) {
        toastMessage('Enter valid location');
        return;
      }

      final failureOrSuccess = await profileRepository.updateProfile(
        AppUser.uniqueId,
        Profile(
          id: AppUser.uniqueId,
          name: state.name!,
          dateOfBirth: state.dateOfBirth!,
          mariatialStatus: state.mariatialStatus!,
          anniversaryDate: state.anniversaryDate,
          location: state.location!,
          couponRedeemed: state.profile.couponRedeemed,
          couponCode: state.profile.couponCode,
          phoneNumber: state.phoneNumber!,
        ),
      );

      emit(state.copyWith(
        showErrorMessages: false,
        submitFailedOrSuccess: optionOf(failureOrSuccess),
      ));

      add(const ProfileEvent.getUser());
    });

    on<_GetUser>((event, emit) async {
      emit(state.copyWith(
        showErrorMessages: true,
        submitFailedOrSuccess: none(),
      ));

      final failureOrSuccess =
          await profileRepository.getProfile(AppUser.uniqueId);
      Profile profile = Profile.empty();
      failureOrSuccess.fold(
        (l) => null,
        (r) {
          profile = r;
          AppUser.name = StringSingleLine(profile.name.getOrCrash());
          AppUser.dateOfBirth = profile.dateOfBirth;
          AppUser.mariatialStatus = profile.mariatialStatus;
          AppUser.anniversaryDate = profile.anniversaryDate;
          AppUser.location = profile.location;
          AppUser.couponCode = profile.couponCode;
          AppUser.couponRedeemed = profile.couponRedeemed;
        },
      );

      emit(state.copyWith(
        showErrorMessages: false,
        profile: profile,
        responseFailedOrSuccess: optionOf(failureOrSuccess),
      ));
    });

    on<_PhoneNumber>((event, emit) => emit(
          state.copyWith(phoneNumber: PhoneNumber(event.phoneNumber)),
        ));

    on<_Name>((event, emit) => emit(
          state.copyWith(name: Name(event.name)),
        ));

    on<_DateOfBirth>((event, emit) => emit(
          state.copyWith(dateOfBirth: event.dateOfBirth),
        ));

    on<_MaritalStatus>((event, emit) => emit(
          state.copyWith(
            mariatialStatus: event.maritalStatus,
            anniversaryDate: null,
          ),
        ));

    on<_AnniversaryDate>((event, emit) => emit(
          state.copyWith(anniversaryDate: event.anniversaryDate),
        ));

    on<_Location>((event, emit) => emit(
          state.copyWith(location: event.location),
        ));

    on<_UploadKYC>((event, emit) async {
      emit(state.copyWith(
        showErrorMessages: true,
        kycSubmitFailedOrSuccess: none(),
      ));

      AppDialogs.setLoadingDialog(text: 'Please wait');

      final failureOrSuccess = await profileRepository.uploadKYC(
        AppUser.uniqueId,
        event.aadharFront!,
        event.aadharBack!,
        event.panFront!,
        event.panBack!,
      );

      AppDialogs.closeDialog();

      emit(state.copyWith(
        showErrorMessages: false,
        kycSubmitFailedOrSuccess: optionOf(failureOrSuccess),
      ));
    });

    on<_GetKYC>((event, emit) async {
      emit(state.copyWith(
        showErrorMessages: true,
        kycSubmitFailedOrSuccess: none(),
        kycResponseFailedOrSuccess: none(),
      ));

      final failureOrSuccess = await profileRepository.getKYC(AppUser.uniqueId);

      emit(state.copyWith(
        showErrorMessages: false,
        kycResponseFailedOrSuccess: optionOf(failureOrSuccess),
      ));
    });
  }
}
