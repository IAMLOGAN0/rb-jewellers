import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_button_widget.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_text_field.dart';
import 'package:rb_jewellers/profile/application/bloc/profile_bloc.dart';
import 'package:rb_jewellers/profile/domain/profile.dart';

import '../../../app/domain/core/constants.dart';

class EditProfileBottomSheet extends StatelessWidget {
  const EditProfileBottomSheet({
    super.key,
    required this.profile,
  });

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black.withOpacity(0.2),
            //     spreadRadius: 5,
            //     blurRadius: 10,
            //   ),
            // ],
          ),
          child: ProfileEditForm(
            profile: profile,
            scrollController: scrollController,
          ),
        );
      },
    );
  }
}

class ProfileEditForm extends StatefulWidget {
  const ProfileEditForm({
    super.key,
    required this.scrollController,
    required this.profile,
  });

  final Profile profile;

  final ScrollController scrollController;

  @override
  State<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends State<ProfileEditForm> {
  final List<String> maritalStatusOptions = [
    'Single',
    'Married',
    'Divorced',
    'Widowed'
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.profile.name.getOrCrash();
    locationController.text = widget.profile.location;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        state.submitFailedOrSuccess.fold(
          () {},
          (either) {
            either.fold((failure) {
              FlushbarHelper.createError(
                message: failure.maybeMap(
                  unexpected: (e) => 'Unexpected Error\n${e.message}',
                  orElse: () => '',
                ),
              ).show(context);
            }, (unit) {
              Get.back();
              // You can add logic to reload the profile screen or show a success message.
            });
          },
        );
      },
      builder: (context, state) {
        return SingleChildScrollView(
          controller: widget.scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: screenHeight * 0.02),
              Center(
                child: Text("Edit Profile", style: titleTextBold),
              ),
              SizedBox(height: screenHeight * 0.03),

              // Full Name
              Text("Full Name", style: standardTextBold),
              AppTextField(
                controller: nameController,
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
                      ? state.name!.value.fold(
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

              // Date of Birth
              Text("Date Of Birth", style: standardTextBold),
              InkWell(
                onTap: () {
                  DatePicker.showDatePicker(context,
                      showTitleActions: true,
                      minTime: DateTime(1900),
                      maxTime: DateTime.now(), onChanged: (date) {
                    context.read<ProfileBloc>().add(
                          ProfileEvent.dateOfBirth(date),
                        );
                  },
                      currentTime: state.profile.dateOfBirth,
                      locale: LocaleType.en);
                },
                child: AppTextField(
                  enableEdit: false,
                  controller: TextEditingController(
                      text: state.dateOfBirth != null
                          ? formatDate(state.dateOfBirth!)
                          : ''),
                  textStyle: largeTextDark,
                  suffixWidget: const Icon(Icons.calendar_month),
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
              // Marital Status
              Text("Marital Status", style: standardTextBold),
              DropdownButtonFormField<String>(
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                value: state.mariatialStatus,
                dropdownColor: primaryColor,
                icon: const Icon(Icons.keyboard_arrow_down),
                style: largeTextDark,
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
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
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

              // Anniversary Date
              if (state.mariatialStatus == 'Married') ...[
                Text("Anniversary Date", style: standardTextBold),
                InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900),
                        maxTime: DateTime.now(), onChanged: (date) {
                      context.read<ProfileBloc>().add(
                            ProfileEvent.anniversaryDate(date),
                          );
                    },
                        currentTime: state.profile.anniversaryDate,
                        locale: LocaleType.en);
                  },
                  child: AppTextField(
                    enableEdit: false,
                    autovalidateMode: state.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    controller: TextEditingController(
                        text: state.anniversaryDate != null
                            ? formatDate(state.anniversaryDate!)
                            : ''),
                    textStyle: largeTextDark,
                    suffixWidget: const Icon(Icons.calendar_month),
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

              // Location
              Text("Address", style: standardTextBold),
              AppTextField(
                controller: locationController,
                autovalidateMode: state.showErrorMessages
                    ? AutovalidateMode.always
                    : AutovalidateMode.disabled,
                textInputType: TextInputType.name,
                inputFormatters: [
                  FilteringTextInputFormatter.singleLineFormatter,
                ],
                maxLines: 3,
                textStyle: largeTextDark,
                suffixWidget: const Icon(Icons.location_pin),
                hintText: 'Enter Address',
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
              // Submit Button
              SizedBox(
                width: double.infinity,
                height: screenWidth * .6 / 5,
                child: AppButtonWidget(
                  onTap: () {
                    context.read<ProfileBloc>().add(
                          const ProfileEvent.updateUser(),
                        );
                  },
                  buttonText: 'Update Profile',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
