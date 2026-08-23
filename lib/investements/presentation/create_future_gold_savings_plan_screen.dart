import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_button_widget.dart';
import 'package:rb_jewellers/investements/application/bloc/investment_bloc.dart';
import 'package:rb_jewellers/investements/domain/future_gold_savings_plan.dart';
import 'package:rb_jewellers/profile/domain/value_objects.dart';

import '../../app/presentation/widgets/app_text_field.dart';
import '../infrastructure/investment_repository.dart';

class CreateFutureGoldSavingsPlanScreen extends StatelessWidget {
  const CreateFutureGoldSavingsPlanScreen({super.key, required this.planName});

  final String planName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvestmentBloc(InvestmentRepository()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            planName,
            style: titleText,
          ),
        ),
        body: const CreateFutureGoldSavingsPlanWidget(),
      ),
    );
  }
}

class CreateFutureGoldSavingsPlanWidget extends StatelessWidget {
  const CreateFutureGoldSavingsPlanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InvestmentBloc, InvestmentState>(
      listener: (context, state) {
        state.responseFailureOrSuccessOption.fold(
          () {}, // const Center(child: ThreeDotLoader()),
          (either) {
            either.fold((failure) async {
              FlushbarHelper.createError(
                  message: failure.map(
                failureWithMessage: (value) => value.message,
                unexpected: (value) => 'Unexpected Error Contact Support',
                firestoreFailure: (value) => 'firestoreFailure',
                insufficientPermission: (value) => 'insufficientPermission',
                networkFailure: (value) => 'Network Failure',
              )).show(context);

              // await Future.delayed(const Duration(seconds: 2));
              // Get.back();
              // Get.back();
            }, (unit) async {
              FlushbarHelper.createSuccess(
                      message: 'Gold Future Advance Plan Created')
                  .show(context);

              await Future.delayed(const Duration(seconds: 2));
              Get.back();
              Get.back();
            });
          },
        );
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Full Name", style: standardTextDarkBold),
                thinSpace,
                AppTextField(
                  enableEdit: false,
                  controller: TextEditingController(
                      text: state.futureGoldSavingsPlan.name.value
                          .getOrElse(() => '')),
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.name,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(alphabetsWithSpaceRegex),
                    FilteringTextInputFormatter.singleLineFormatter,
                  ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  hintText: 'Enter Full Name',
                  validateCallBack: (v) {
                    return context
                        .read<InvestmentBloc>()
                        .state
                        .futureGoldSavingsPlan
                        .name
                        .value
                        .fold(
                          (f) => f.maybeMap(
                            invalidName: (_) => 'Invalid Name',
                            empty: (_) => 'Name cannot be Empty',
                            orElse: () => null,
                          ),
                          (_) => null,
                        );
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(state
                                .futureGoldSavingsPlan
                                .copyWith(name: Name(value))),
                          ),
                ),
                thickSpace,
                thickSpace,

                ///ADDRESS
                Text("Address", style: standardTextDarkBold),
                thinSpace,
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.streetAddress,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(alphabetsWithSpaceRegex),
                  //   FilteringTextInputFormatter.singleLineFormatter,
                  // ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  hintText: 'Village/Locality',
                  validateCallBack: (v) {
                    return state.futureGoldSavingsPlan.address.locality == ''
                        ? 'Locality Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                              address: state.futureGoldSavingsPlan.address
                                  .copyWith(locality: value),
                            )),
                          ),
                ),
                thickSpace,
                thickSpace,
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.streetAddress,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(alphabetsWithSpaceRegex),
                  //   FilteringTextInputFormatter.singleLineFormatter,
                  // ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  hintText: 'Post Office',
                  validateCallBack: (v) {
                    return state.futureGoldSavingsPlan.address.postOffice == ''
                        ? 'Post Office Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                              address: state.futureGoldSavingsPlan.address
                                  .copyWith(postOffice: value),
                            )),
                          ),
                ),
                thickSpace,
                thickSpace,
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.streetAddress,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(alphabetsWithSpaceRegex),
                  //   FilteringTextInputFormatter.singleLineFormatter,
                  // ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  hintText: 'City',
                  validateCallBack: (v) {
                    return state.futureGoldSavingsPlan.address.city == ''
                        ? 'City Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                              address: state.futureGoldSavingsPlan.address
                                  .copyWith(city: value),
                            )),
                          ),
                ),
                thickSpace,
                thickSpace,
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.streetAddress,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(alphabetsWithSpaceRegex),
                  //   FilteringTextInputFormatter.singleLineFormatter,
                  // ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  hintText: 'Landmark',
                  validateCallBack: (v) {
                    return state.futureGoldSavingsPlan.address.landmark == ''
                        ? 'Landmark Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                              address: state.futureGoldSavingsPlan.address
                                  .copyWith(landmark: value),
                            )),
                          ),
                ),
                thickSpace,
                thickSpace,
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.streetAddress,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(alphabetsWithSpaceRegex),
                  //   FilteringTextInputFormatter.singleLineFormatter,
                  // ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  hintText: 'Police Station',
                  validateCallBack: (v) {
                    return state.futureGoldSavingsPlan.address.policeStation ==
                            ''
                        ? 'Police Station Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                              address: state.futureGoldSavingsPlan.address
                                  .copyWith(policeStation: value),
                            )),
                          ),
                ),
                thickSpace,
                thickSpace,
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.streetAddress,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(alphabetsWithSpaceRegex),
                  //   FilteringTextInputFormatter.singleLineFormatter,
                  // ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  hintText: 'District',
                  validateCallBack: (v) {
                    return state.futureGoldSavingsPlan.address.district == ''
                        ? 'District Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                              address: state.futureGoldSavingsPlan.address
                                  .copyWith(district: value),
                            )),
                          ),
                ),
                thickSpace,
                thickSpace,
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    // FilteringTextInputFormatter.singleLineFormatter,
                    LengthLimitingTextInputFormatter(6)
                  ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  hintText: 'Pincode',
                  validateCallBack: (v) {
                    return state.futureGoldSavingsPlan.address.pin.length < 6
                        ? 'Enter valid Pincode'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                              address: state.futureGoldSavingsPlan.address
                                  .copyWith(pin: value),
                            )),
                          ),
                ),
                thickSpace,
                thickSpace,

                /// Contact
                Text("Contact", style: standardTextDarkBold),
                thinSpace,
                AppTextField(
                  enableEdit: false,
                  controller: TextEditingController(
                      text: state.futureGoldSavingsPlan.contactNumber.value
                          .getOrElse(() => '')),
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  prefixWidget: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      '+91',
                      style: largeTextDark,
                    ),
                  ),
                  hintText: 'Enter Contact Number',
                  validateCallBack: (v) {
                    return context
                        .read<InvestmentBloc>()
                        .state
                        .futureGoldSavingsPlan
                        .contactNumber
                        .value
                        .fold(
                          (f) => f.maybeMap(
                            invalidPhoneNumber: (_) => 'Invalid Phone Number',
                            empty: (_) => 'Cannot be Empty',
                            orElse: () => null,
                          ),
                          (_) => null,
                        );
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                                    contactNumber: PhoneNumber('+91$value'))),
                          ),
                ),
                thickSpace,
                thickSpace,
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.phone,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  prefixWidget: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      '+91',
                      style: largeTextDark,
                    ),
                  ),
                  hintText: 'Enter WhatsApp Number',
                  validateCallBack: (v) {
                    return context
                        .read<InvestmentBloc>()
                        .state
                        .futureGoldSavingsPlan
                        .whatsappNumber
                        .value
                        .fold(
                          (f) => f.maybeMap(
                            invalidPhoneNumber: (_) => 'Invalid Phone Number',
                            empty: (_) => 'Cannot be Empty',
                            orElse: () => null,
                          ),
                          (_) => null,
                        );
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                                    whatsappNumber: PhoneNumber('+91$value'))),
                          ),
                ),
                thickSpace,
                thickSpace,
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: TextInputType.emailAddress,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(emailRegex),
                  // ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),

                  hintText: 'Enter Email Address',
                  validateCallBack: (v) {
                    return context
                        .read<InvestmentBloc>()
                        .state
                        .futureGoldSavingsPlan
                        .emailAddress
                        .value
                        .fold(
                          (f) => f.maybeMap(
                            invalidEmail: (_) => 'Invalid Email Address',
                            orElse: () => null,
                          ),
                          (_) => null,
                        );
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                              state.futureGoldSavingsPlan
                                  .copyWith(emailAddress: EmailAddress(value)),
                            ),
                          ),
                ),
                thickSpace,
                thickSpace,

                ///
                Text("Date Of Birth", style: standardTextDarkBold),
                thinSpace,
                InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900),
                        maxTime: DateTime.now(),
                        onChanged: (date) {}, onConfirm: (date) {
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                              dateOfBirth: date,
                            )),
                          );
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: AppTextField(
                    enableEdit: false,
                    controller: TextEditingController(
                        text: formatDate(
                            state.futureGoldSavingsPlan.dateOfBirth)),
                    textStyle: largeTextDark,
                    suffixWidget: const Icon(
                      Icons.calendar_month,
                    ),
                    hintText: 'Select Date Of Birth',
                    errorText: state.showErrorMessages
                        // ignore: unnecessary_null_comparison
                        ? state.futureGoldSavingsPlan.dateOfBirth == null
                            ? 'Select valid date of birth'
                            : null
                        : null,
                    errorStyle: smallText.copyWith(color: Colors.red),
                  ),
                ),
                thickSpace,
                thickSpace,
                // Text("Marital Status", style: standardTextBold),
                // DropdownButtonFormField<String>(
                //   autovalidateMode: state.showErrorMessages
                //       ? AutovalidateMode.always
                //       : AutovalidateMode.disabled,
                //   value: state.mariatialStatus,
                //   dropdownColor: primaryColor,
                //   style: largeTextDark,
                //   icon: const Icon(Icons.keyboard_arrow_down),
                //   hint: Text(
                //     'Select Marital Status',
                //     style: largeTextDark.copyWith(color: Colors.black45),
                //   ),
                //   decoration: InputDecoration(
                //     border: const OutlineInputBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         borderSide: BorderSide.none),
                //     // suffixIcon: const Icon(Icons.keyboard_arrow_down),
                //     suffixIconColor: Colors.black45,
                //     errorStyle: smallText,
                //     filled: true,
                //     fillColor: primaryColor,
                //     contentPadding:
                //         const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                //   ),
                //   onChanged: (String? newValue) {
                //     context
                //         .read<InvestmentBloc>()
                //         .add(InvestmentEvent.maritalStatus(newValue!));
                //   },
                //   items: maritalStatusOptions.map((String status) {
                //     return DropdownMenuItem<String>(
                //       value: status,
                //       child: Text(status),
                //     );
                //   }).toList(), // Map options to the drop-down items
                //   validator: (value) => value == null
                //       ? 'Please select a valid marital status'
                //       : null, // Validation
                // ),
                // thickSpace,
                // thickSpace,
                Text("Anniversary Date", style: standardTextDarkBold),
                thinSpace,
                InkWell(
                  onTap: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1900),
                        maxTime: DateTime.now(),
                        onChanged: (date) {}, onConfirm: (date) {
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(state
                                .futureGoldSavingsPlan
                                .copyWith(dateOfBirth: date)),
                          );
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: AppTextField(
                    enableEdit: false,
                    controller: TextEditingController(
                        text: state.futureGoldSavingsPlan.dateOfAnniversary !=
                                null
                            ? formatDate(
                                state.futureGoldSavingsPlan.dateOfAnniversary!)
                            : ''),
                    autovalidateMode: state.showErrorMessages
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    textStyle: largeTextDark,
                    suffixWidget: const Icon(
                      Icons.calendar_month,
                    ),
                    hintText: 'Select Anniversary Date',
                    errorStyle: smallText.copyWith(color: Colors.red),

                    // errorText: state.showErrorMessages
                    //     ? state.mariatialStatus == 'Married' &&
                    //             state.anniversaryDate == null
                    //         ? 'Select valid Anniversary Date'
                    //         : null
                    //     : null,
                  ),
                ),
                thickSpace,
                thickSpace,
                Text("Investment Details", style: standardTextDarkBold),
                thinSpace,
                AppTextField(
                  autovalidateMode: state.showErrorMessages
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  textInputType: const TextInputType.numberWithOptions(),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
                  ],
                  textStyle: largeTextDark,
                  errorStyle: smallText.copyWith(color: Colors.red),
                  hintText: 'Enter Amount',
                  validateCallBack: (v) {
                    return context
                            .read<InvestmentBloc>()
                            .state
                            .futureGoldSavingsPlan
                            .amountPaid
                            .isLowerThan(1000)
                        ? 'Minimum Amount 1000'
                        : context
                                .read<InvestmentBloc>()
                                .state
                                .futureGoldSavingsPlan
                                .amountPaid
                                .isNegative
                            ? 'Invalid Amount'
                            : null;
                  },
                  prefixWidget: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 15,
                      bottom: 15,
                    ),
                    child: Text(
                      rupeeSymbol,
                      style: largeTextDark,
                    ),
                  ),
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.futureGoldSavingsPlan(
                              state.futureGoldSavingsPlan
                                  .copyWith(amountPaid: double.parse(value)),
                            ),
                          ),
                ),
                thickSpace,
                thickSpace,
                Text(
                    "You can deposit any amount of money within 12 months period from ${formatDate(DateTime.now())}. You can book gold price upto 60% of your deposit amount anytime within 12 months",
                    style: standardTextDark),
                thickSpace,
                thickSpace,
                // Row(
                //   children: [
                //     Transform.scale(
                //       scale:
                //           1.0, // Adjust scale if you need to tweak the size of the checkbox
                //       child: Checkbox(
                //         // activeColor: secondaryColor,
                //         checkColor: secondaryColor,
                //         // fillColor: WidgetStateProperty.all(primaryColor),
                //         // side: BorderSide.s,
                //         materialTapTargetSize: MaterialTapTargetSize
                //             .shrinkWrap, // Removes extra padding around the checkbox
                //         value: state
                //             .futureGoldSavingsPlan.isTermsAndConditonsAccepted,
                //         onChanged: (bool? value) {
                //           context.read<InvestmentBloc>().add(
                //                 InvestmentEvent.futureGoldSavingsPlan(
                //                   state.futureGoldSavingsPlan.copyWith(
                //                       isTermsAndConditonsAccepted: value!),
                //                 ),
                //               );
                //         },
                //       ),
                //     ),
                //     // thickSpace,
                //     thickSpace,
                //     Expanded(
                //       child: HyperLinkText(
                //           textStyle: standardTextDark.copyWith(),
                //           hyperLinkStyle: standardTextDarkBold,
                //           richElements: [
                //             RichElement.text(
                //                 text: "By proceeding you accept the"),
                //             RichElement.link(
                //               text: ' terms and conditions',
                //               url:
                //                   'https://rbjeweller.in/terms-condition-future-gold-saving-plan/',
                //             ),
                //             // RichElement.text(
                //             //     text: "\nYou can read the privacy policy"),
                //             // RichElement.link(
                //             //   text: ' here',
                //             //   url: 'https://rbjeweller.in/privacy-policy-2/',
                //             // ),
                //           ]),
                //     ),
                //   ],
                // ),
                // thickSpace,
                // thickSpace,
                if (!state.futureGoldSavingsPlan.isTermsAndConditonsAccepted)
                  AppButtonWidget(
                    onTap: () async {
                      final value = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return Container(
                            margin: const EdgeInsets.all(16),
                            color: Colors.white,
                            child: AlertDialog(
                              contentPadding: const EdgeInsets.all(0),
                              titlePadding: const EdgeInsets.all(0),
                              title: Text(
                                'Terms and Conditions',
                                style: titleTextBoldDark,
                              ),
                              content: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    thickSpace,
                                    thickSpace,
                                    Text(
                                      'Please read and accept the terms and conditions before proceeding.',
                                      style: largeTextDarkBold,
                                    ),
                                    thickSpace,
                                    thickSpace,
                                    Text(
                                      tAndCFG,
                                      style: standardTextDark,
                                    ),
                                    thickSpace,
                                    thickSpace,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(
                                                false); // User does not accept
                                          },
                                          child: Text(
                                            'Cancel',
                                            style: largeTextBold.copyWith(
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pop(true); // User accepts
                                          },
                                          child: Text(
                                            'Accept',
                                            style: largeTextBold.copyWith(
                                              color: Colors.green,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );

                      // Check the result and proceed
                      if (value == true) {
                        // ignore: use_build_context_synchronously
                        context.read<InvestmentBloc>().add(
                              InvestmentEvent.futureGoldSavingsPlan(
                                state.futureGoldSavingsPlan.copyWith(
                                  isTermsAndConditonsAccepted: true,
                                ),
                              ),
                            );
                      } else {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'You must accept the terms to continue.')),
                        );
                      }
                    },
                    buttonText: 'Continue',
                  ),
                if (state.futureGoldSavingsPlan.isValid())
                  AppButtonWidget(
                    onTap: () async {
                      context.read<InvestmentBloc>().add(
                          const InvestmentEvent.createFutureGoldSavingsPlan());
                    },
                    buttonText:
                        'Pay $rupeeSymbol ${state.futureGoldSavingsPlan.amountPaid}',
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

const String tAndCFG = """
1. Golden Future will help Consumer for Purchase Jewellery by Depositing small of amount in advance as irregular basics.

2. In Golden Future all the advance amount by consumer will deposit in their Specific Account in Advance only for purchasing Gold Jewellery from R.B. Jewellers (Medinipur) outlet only.

3. Company will receive all the paid amount in Advance (No Gold Weight will be booked against of Gold Rate).

4. Golden Future will continue for 12 months from the date of starting.

5. Consumer have to choose ornaments design from the start date and they can change ornaments design within 1 months from the starting date.

6. Consumer can deposit advance of any amount to Start Golden Future.

7. In Golden Future making charges will be applied as per company policy for purchase gold ornaments.

8. The Golden Future Account/Ledger value should not exceed Rs.9,50,000/- (Nine lakh fifty thousand only) per consumer per annum.

9. Consumer must have to submit their KYC (Pan Card & Aadhar Card) to start Golden Future.

10. FMA amount are not fixed for Golden Future, and consumer can deposit any dynamic amount in any time as their choice. (Herein, FMA refer to Fixed Monthly Advance)

11. In Golden Future, Consumer can book gold rate for one time only for whole amount of their estimated purchase plan, within running period. For booking gold rate, please read point no 12 carefully.

12. Consumer can book gold rate within 11:30 am to 10:00 pm when their advance amount will reach a minimum 60% of estimated whole purchase value.

13. If once gold rate will book then Consumer can’t request to the company to change/rebook/cancel the gold rate again.

14. Consumer can stop deposit amount in this Golden Future any time within this running period.

15. Consumer can make purchase jewellery any time within this 12 month.

16. Consumer can’t request for any extra offer or discount at the time of billing.

17. Consumer must have to make purchase within their deposited amount. In Golden Future company will not allow any discount or deduction.

18. Golden Future redemption will be available from R.B. Jewellers (Medinipur) outlet only.

19. No refund will be made in cash or any other payment mode. Consumer must have to purchase jewellery after maturity/complete.

20. After end of, consumer must have to complete their purchase ornaments within 30 days from ending.

21. In offer period of Company, consumer can’t redeem. Redemption will be available in Normal working days of company.


22. Company is requested to the consumer to contact our Company Helpline Number (+91 8167495756/9563284398) for any assistance.

23. Company has the right to change or alter the terms & conditions any time.

24. All the disputes subjected to Medinipur Jurisdiction only.
""";

