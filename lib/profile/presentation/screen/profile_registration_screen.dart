import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_button_widget.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_text_field.dart';
import 'package:rb_jewellers/app/presentation/widgets/dotted_red_bg.dart';
import 'package:rb_jewellers/home/presentation/home_screen.dart';
import 'package:rb_jewellers/profile/application/bloc/profile_bloc.dart';
import 'package:rb_jewellers/profile/infrastructure/profile_repository.dart';

import '../../../app/domain/core/constants.dart';
import '../../../authentication/application/auth_bloc/auth_bloc.dart';
import '../../../authentication/presentation/screen/sign_in_screen.dart';

class ProfileRegistrationScreen extends StatelessWidget {
  final String phoneNumber;
  const ProfileRegistrationScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(ProfileRepository()),
      child: DottedRedBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ProfileRegistrationForm(
            phoneNumber: phoneNumber,
          ),
        ),
      ),
    );
  }
}

class ProfileRegistrationForm extends StatelessWidget {
  ProfileRegistrationForm({
    super.key,
    required this.phoneNumber,
  });
  final String phoneNumber;

  final List<String> maritalStatusOptions = [
    'Single',
    'Married',
    'Divorced',
    'Widowed'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        state.submitFailedOrSuccess.fold(
          () {},
          (either) {
            either.fold((failure) {
              failure.maybeMap(profileAlreadyExists: (e) {
                FlushbarHelper.createError(
                  message: failure.maybeMap(
                    unexpected: (e) => 'Unxepected Error\n${e.message}',
                    orElse: () => '',
                  ),
                ).show(context);
                final authBloc = BlocProvider.of<AuthBloc>(context);
                authBloc.add(const AuthEvent.signedOut());
                Get.offAll(() => const SignInScreen());
              }, unexpected: (e) {
                FlushbarHelper.createError(
                  message: failure.maybeMap(
                    unexpected: (e) => 'Unxepected Error\n${e.message}',
                    orElse: () => '',
                  ),
                ).show(context);
                final authBloc = BlocProvider.of<AuthBloc>(context);
                authBloc.add(const AuthEvent.signedOut());
                Get.offAll(() => const SignInScreen());
              }, orElse: () {
                FlushbarHelper.createError(
                  message: failure.maybeMap(
                    unexpected: (e) => 'Unxepected Error\n${e.message}',
                    orElse: () => '',
                  ),
                ).show(context);
              });
            }, (unit) {
              Get.offAll(() => const HomeScreen());
            });
          },
        );
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * .04,
                ),
                Center(
                  child: Image.asset(
                    'assets/logo/LOGO.png',
                    height: screenHeight / 5,
                  ),
                ),
                SizedBox(
                  height: screenHeight * .06,
                ),
                Text("Create Your Profile", style: titleTextBold),
                thickSpace,
                thickSpace,
                Text("Full Name", style: standardTextBold),
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(alphabetsWithSpaceRegex),
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                  textStyle: largeTextDark,
                  hintText: 'Enter Full Name',
                  validateCallBack: (v) {
                    return state.name != null
                        ? context.read<ProfileBloc>().state.name!.value.fold(
                              (f) => f.maybeMap(
                                invalidName: (_) => 'Invalid Name',
                                orElse: () => null,
                              ),
                              (_) => null,
                            )
                        : 'Name Cannot be Empty';
                  },
                  onChangedCallBack: (value) => context.read<ProfileBloc>().add(
                        ProfileEvent.name(value),
                      ),
                ),
                thickSpace,
                thickSpace,
                Text("Date Of Birth", style: standardTextBold),
                InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900),
                        maxTime: DateTime.now(),
                        onChanged: (date) {}, onConfirm: (date) {
                      context.read<ProfileBloc>().add(
                            ProfileEvent.dateOfBirth(date),
                          );
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: AppTextField(
                    enableEdit: false,
                    controller: TextEditingController(
                        text: state.dateOfBirth != null
                            ? formatDate(state.dateOfBirth!)
                            : ''),
                    textStyle: largeTextDark,
                    suffixWidget: const Icon(
                      Icons.calendar_month,
                    ),
                    hintText: 'Select Date Of Birth',
                    errorText: state.showErrorMessages
                        ? state.dateOfBirth == null
                            ? 'Select valid date of birth'
                            : null
                        : null,
                  ),
                ),
                thickSpace,
                thickSpace,
                Text("Marital Status", style: standardTextBold),
                DropdownButtonFormField<String>(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  value: state.mariatialStatus,
                  dropdownColor: primaryColor,
                  style: largeTextDark,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: Text(
                    'Select Marital Status',
                    style: largeTextDark.copyWith(color: Colors.black45),
                  ),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none),
                    // suffixIcon: const Icon(Icons.keyboard_arrow_down),
                    suffixIconColor: Colors.black45,
                    errorStyle: smallText,
                    filled: true,
                    fillColor: primaryColor,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 14, horizontal: 16),
                  ),
                  onChanged: (String? newValue) {
                    context
                        .read<ProfileBloc>()
                        .add(ProfileEvent.maritalStatus(newValue!));
                  },
                  items: maritalStatusOptions.map((String status) {
                    return DropdownMenuItem<String>(
                      value: status,
                      child: Text(status),
                    );
                  }).toList(), // Map options to the drop-down items
                  validator: (value) => value == null
                      ? 'Please select a valid marital status'
                      : null, // Validation
                ),
                thickSpace,
                thickSpace,
                if (state.mariatialStatus == 'Married') ...[
                  Text("Anniversary Date", style: standardTextBold),
                  InkWell(
                    onTap: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1900),
                          maxTime: DateTime.now(),
                          onChanged: (date) {}, onConfirm: (date) {
                        context.read<ProfileBloc>().add(
                              ProfileEvent.anniversaryDate(date),
                            );
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                    },
                    child: AppTextField(
                      enableEdit: false,
                      controller: TextEditingController(
                          text: state.anniversaryDate != null
                              ? formatDate(state.anniversaryDate!)
                              : ''),
                      autovalidateMode: state.showErrorMessages
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      textStyle: largeTextDark,
                      suffixWidget: const Icon(
                        Icons.calendar_month,
                      ),
                      hintText: 'Select Anniversary Date',
                      errorText: state.showErrorMessages
                          ? state.mariatialStatus == 'Married' &&
                                  state.anniversaryDate == null
                              ? 'Select valid Anniversary Date'
                              : null
                          : null,
                    ),
                  ),
                  thickSpace,
                  thickSpace,
                ],
                Text("Address", style: standardTextBold),
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.name,
                  inputFormatters: [
                    // FilteringTextInputFormatter.allow(alphabetsWithSpaceRegex),
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                  textStyle: largeTextDark,
                  suffixWidget: const Icon(
                    Icons.location_pin,
                  ),
                  hintText: 'Enter Address',
                  maxLines: 2,
                  validateCallBack: (v) {
                    return state.location != null && state.location!.isNotEmpty
                        ? null
                        : 'Address Cannot be Empty';
                  },
                  onChangedCallBack: (value) => context.read<ProfileBloc>().add(
                        ProfileEvent.location(value),
                      ),
                ),
                thickSpace,
                thickSpace,
                thickSpace,
                SizedBox(
                  width: screenWidth - 50,
                  height: screenWidth * .6 / 5,
                  child: AppButtonWidget(
                    onTap: () {
                      context.read<ProfileBloc>().add(
                            ProfileEvent.phoneNumber(phoneNumber),
                          );
                      context.read<ProfileBloc>().add(
                            const ProfileEvent.createUser(),
                          );
                    },
                    buttonText: 'Submit Details',
                  ),
                ),
                thickSpace,
                thickSpace,
                thickSpace,
                thickSpace,
                thickSpace,
                thickSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
