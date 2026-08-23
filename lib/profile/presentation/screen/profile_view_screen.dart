import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_button_widget.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_text_field.dart';
import 'package:rb_jewellers/app/presentation/widgets/common_server_error_widget.dart';
import 'package:rb_jewellers/app/presentation/widgets/log_out_button.dart';
import 'package:rb_jewellers/profile/application/bloc/profile_bloc.dart';
import 'package:rb_jewellers/profile/domain/profile.dart';

import '../../../app/domain/core/constants.dart';
import 'edit_profile_screen.dart';
import 'kyc_screen.dart';

class ProfileViewScreen extends StatelessWidget {
  const ProfileViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (BuildContext context, ProfileState state) {
        state.submitFailedOrSuccess.fold(
          () {},
          (either) {
            either.fold((failure) {}, (unit) {
              toastMessage('Profile Updated successfully');
              // FlushbarHelper.createSuccess(
              //   message: 'Profile Updated successfully',
              // ).show(context);
            });
          },
        );
      },
      builder: (context, state) {
        final profileBloc = BlocProvider.of<ProfileBloc>(context);

        return state.responseFailedOrSuccess.fold(() => Container(), (either) {
          return either.fold(
            (failure) => SizedBox(
              height: screenHeight / 4,
              width: screenWidth,
              child: CommonServerErrorWidget('Failure', () {
                profileBloc.add(const ProfileEvent.getUser());
              }),
            ),
            (Profile profile) => Scaffold(
              backgroundColor: backgroundColor,
              body: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * .01),
                    Center(
                      child: CircleAvatar(
                          radius: 40,
                          backgroundColor: secondaryColor,
                          child: Icon(
                            Icons.person_outline,
                            size: 60,
                            color: secondaryColor.shade900,
                          )
                          // Image.asset(
                          //   'assets/icons/profile.png',
                          //   height: 80,
                          // ),
                          ),
                    ),
                    thickSpace,
                    thickSpace,
                    Center(
                      child: Text(
                        profile.name.getOrCrash().toUpperCase(),
                        style: titleTextBold,
                      ),
                    ),
                    SizedBox(height: screenHeight * .02),
                    Container(
                      color: primaryColor,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Profile Information",
                                  style: largeTextDarkBold),
                              Material(
                                child: InkWell(
                                    onTap: () {
                                      if (state.enableEdit) {}
                                      context
                                          .read<ProfileBloc>()
                                          .add(const ProfileEvent.enableEdit());

                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        showDragHandle: true,
                                        backgroundColor: backgroundColor,
                                        elevation: 5,
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: EditProfileBottomSheet(
                                              profile: state.profile,
                                            ),
                                          );
                                        },
                                      ).then((e) {
                                        profileBloc.add(
                                            const ProfileEvent.enableEdit());
                                        // context.read<ProfileBloc>().add(
                                        //     const ProfileEvent.enableEdit());
                                      });
                                    },
                                    child: Icon(state.enableEdit
                                        ? Icons.save
                                        : Icons.edit)),
                              ),
                            ],
                          ),
                          thickSpace,
                          thickSpace,
                          Text("Full Name", style: standardTextDarkBold),
                          AppTextField(
                            enableEdit: false,
                            enableBorder: true,
                            controller: TextEditingController(
                              text: profile.name.getOrCrash(),
                            ),
                            textStyle: standardTextDarkBold,
                            hintText: 'Full Name',
                          ),
                          thickSpace,
                          thickSpace,
                          Text("Date Of Birth", style: standardTextDarkBold),
                          AppTextField(
                            enableEdit: false,
                            enableBorder: true,
                            controller: TextEditingController(
                              text: formatDate(profile.dateOfBirth),
                            ),
                            textStyle: standardTextDarkBold,
                            hintText: 'Date Of Birth',
                          ),
                          thickSpace,
                          thickSpace,
                          Text("Marital Status", style: standardTextDarkBold),
                          AppTextField(
                            enableEdit: false,
                            enableBorder: true,
                            controller: TextEditingController(
                              text: profile.mariatialStatus,
                            ),
                            textStyle: standardTextDarkBold,
                            hintText: 'Marital Status',
                          ),
                          thickSpace,
                          thickSpace,
                          if (profile.mariatialStatus == 'Married') ...[
                            Text("Anniversary Date",
                                style: standardTextDarkBold),
                            AppTextField(
                              enableEdit: false,
                              enableBorder: true,
                              controller: TextEditingController(
                                text: profile.anniversaryDate != null
                                    ? formatDate(profile.anniversaryDate!)
                                    : 'Not Married',
                              ),
                              textStyle: standardTextDarkBold,
                              hintText: 'Anniversary Date',
                            ),
                            thickSpace,
                            thickSpace,
                          ],
                          Text("Address", style: standardTextDarkBold),
                          AppTextField(
                            enableEdit: false,
                            enableBorder: true,
                            maxLines: 3,
                            controller: TextEditingController(
                              text: profile.location,
                            ),
                            textStyle: standardTextDarkBold,
                            hintText: 'Address',
                          ),
                          thickSpace,
                          thickSpace,
                          thickSpace,
                          thickSpace,
                          SizedBox(
                            width: double.infinity,
                            height: screenWidth * .6 / 5,
                            child: (Platform.isAndroid)
                                ? AppButtonWidget(
                                    onTap: () {
                                      context
                                          .read<ProfileBloc>()
                                          .add(const ProfileEvent.getKYC());
                                      Get.to(() => const KYCScreen());
                                    },
                                    buttonText: 'KYC',
                                  )
                                : null,
                          ),
                          thickSpace,
                          thickSpace,
                          const LogOutButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
      },
    );
  }
}
