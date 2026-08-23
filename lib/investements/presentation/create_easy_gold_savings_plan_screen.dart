import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_button_widget.dart';
import 'package:rb_jewellers/investements/application/bloc/investment_bloc.dart';
import 'package:rb_jewellers/investements/domain/easy_gold_savings_plan.dart';
import 'package:rb_jewellers/profile/domain/value_objects.dart';

import '../../app/presentation/widgets/app_text_field.dart';
import '../infrastructure/investment_repository.dart';

class CreateEasyGoldSavingsPlanScreen extends StatelessWidget {
  const CreateEasyGoldSavingsPlanScreen({super.key, required this.planName});
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
        body: const CreateEasyGoldSavingsPlanWidget(),
      ),
    );
  }
}

class CreateEasyGoldSavingsPlanWidget extends StatelessWidget {
  const CreateEasyGoldSavingsPlanWidget({
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

              await Future.delayed(const Duration(seconds: 2));
              Get.back();
              Get.back();
            }, (unit) async {
              FlushbarHelper.createSuccess(message: 'Gold Savings Plan Created')
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
                      text: state.easyGoldSavingsPlan.name.value
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
                        .easyGoldSavingsPlan
                        .name
                        .value
                        .fold(
                          (f) => f.maybeMap(
                            invalidName: (_) => 'Invalid Name',
                            empty: (_) => 'Name Cannot be Empty',
                            orElse: () => null,
                          ),
                          (_) => null,
                        );
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.easyGoldSavingsPlan(state
                                .easyGoldSavingsPlan
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
                    return state.easyGoldSavingsPlan.address.locality == ''
                        ? 'Locality Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
                              address: state.easyGoldSavingsPlan.address
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
                    return state.easyGoldSavingsPlan.address.postOffice == ''
                        ? 'Post Office Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
                              address: state.easyGoldSavingsPlan.address
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
                    return state.easyGoldSavingsPlan.address.city == ''
                        ? 'City Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
                              address: state.easyGoldSavingsPlan.address
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
                    return state.easyGoldSavingsPlan.address.landmark == ''
                        ? 'Landmark Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
                              address: state.easyGoldSavingsPlan.address
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
                    return state.easyGoldSavingsPlan.address.policeStation == ''
                        ? 'Police Station Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
                              address: state.easyGoldSavingsPlan.address
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
                    return state.easyGoldSavingsPlan.address.district == ''
                        ? 'District Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
                              address: state.easyGoldSavingsPlan.address
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
                    return state.easyGoldSavingsPlan.address.pin.length < 6
                        ? 'Enter valid Pincode'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
                              address: state.easyGoldSavingsPlan.address
                                  .copyWith(pin: value),
                            )),
                          ),
                ),
                thickSpace,
                thickSpace,

                /// Contact
                Text("Contact", style: standardTextDarkBold), thinSpace,
                AppTextField(
                  enableEdit: false,
                  controller: TextEditingController(
                      text: state.easyGoldSavingsPlan.contactNumber.value
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
                        .easyGoldSavingsPlan
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
                            InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
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
                        .easyGoldSavingsPlan
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
                            InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
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
                        .easyGoldSavingsPlan
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
                            InvestmentEvent.easyGoldSavingsPlan(
                              state.easyGoldSavingsPlan
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
                            InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
                              dateOfBirth: date,
                            )),
                          );
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: AppTextField(
                    enableEdit: false,
                    controller: TextEditingController(
                        text:
                            formatDate(state.easyGoldSavingsPlan.dateOfBirth)),
                    textStyle: largeTextDark,
                    suffixWidget: const Icon(
                      Icons.calendar_month,
                    ),
                    hintText: 'Select Date Of Birth',
                    errorText: state.showErrorMessages
                        // ignore: unnecessary_null_comparison
                        ? state.easyGoldSavingsPlan.dateOfBirth == null
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
                            InvestmentEvent.easyGoldSavingsPlan(state
                                .easyGoldSavingsPlan
                                .copyWith(dateOfBirth: date)),
                          );
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: AppTextField(
                    enableEdit: false,
                    controller: TextEditingController(
                        text: state.easyGoldSavingsPlan.dateOfAnniversary !=
                                null
                            ? formatDate(
                                state.easyGoldSavingsPlan.dateOfAnniversary!)
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
                            .easyGoldSavingsPlan
                            .amount
                            .isLowerThan(1000)
                        ? 'Minimum Amount 1000'
                        : context
                                .read<InvestmentBloc>()
                                .state
                                .easyGoldSavingsPlan
                                .amount
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
                            InvestmentEvent.easyGoldSavingsPlan(
                              state.easyGoldSavingsPlan
                                  .copyWith(amount: double.parse(value)),
                            ),
                          ),
                ),
                thickSpace,
                thickSpace,
                Text(
                    "EMI will be $rupeeSymbol ${(state.easyGoldSavingsPlan.amount / 12).toStringAsFixed(2)}/month and Investment Tenure will be 12 months from ${formatDate(DateTime.now())}",
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
                //             .easyGoldSavingsPlan.isTermsAndConditonsAccepted,
                //         onChanged: (bool? value) {
                //           context.read<InvestmentBloc>().add(
                //                 InvestmentEvent.easyGoldSavingsPlan(
                //                   state.easyGoldSavingsPlan.copyWith(
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
                //                   'https://rbjeweller.in/terms-condition-easy-gold-saving-plan/',
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
                if (!state.easyGoldSavingsPlan.isTermsAndConditonsAccepted)
                  AppButtonWidget(
                    onTap: () async {
                      final value = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return Container(
                            margin: const EdgeInsets.all(16),
                            color: Colors.white,
                            child: AlertDialog(
                              contentPadding: EdgeInsets.zero,
                              titlePadding: EdgeInsets.zero,
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
                                      tAndCEG,
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
                              InvestmentEvent.easyGoldSavingsPlan(
                                state.easyGoldSavingsPlan.copyWith(
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
                thickSpace,
                thickSpace,
                if (state.easyGoldSavingsPlan.isValid())
                  AppButtonWidget(
                      onTap: () {
                        context.read<InvestmentBloc>().add(
                            const InvestmentEvent.createEasyGoldSavingsPlan());
                      },
                      buttonText:
                          'Pay $rupeeSymbol ${(state.easyGoldSavingsPlan.amount / 12).toStringAsFixed(2)}')
              ],
            ),
          ),
        );
      },
    );
  }
}

const String tAndCEG = """
1. Golden Assurance will help Consumer for Purchase Jewellery by Depositing small of amount in advance as regular basics.   

2. In Golden Assurance all the advance amount paid by consumer, will deposit in their Specific Account/Ledger in Advance. Only for purchasing any kind of Jewellery from R.B. Jewellers (Medinipur) outlet only. 

3. Company will receive all the deposited amount as Advance. (No Gold Weight will be booked against of Gold Rate).  

4. Golden Assurance will be continued for 12 months from the date of opening.   

5. To start Golden Assurance the minimum FMA (Herein, FMA refer to Fixed Monthly Advance) is Rs.1,000/- (One thousand only). 

6. Consumer have to choose ornaments design from the start date and they can’t change this design after 1 month.  

7. In Golden Assurance making charges will be applied as per company policy for purchase gold ornaments. 

8. The Golden Assurance Account/Ledger value should not exceed Rs.9,50,000/- (Nine lakh fifty thousand only) per consumer per annum. 

9. Consumer must have to submit their KYC (Pan Card & Aadhar Card) to start Golden Assurance. 

10. Consumer has the right to choose the FMA amount on the first date of opening this Golden Assurance only. (Herein, FMA refer to Fixed Monthly Advance). 

11. Consumer must have to pay this fixed FMA amount within due date. If the due date will get over, then the Golden Assurance will be treated as Closed, and the consumer can’t reopen this specific Golden Assurance Account/Ledger. (Herein, FMA refer to Fixed Monthly Advance). 

12. Of reference Point no.11 the last due date of FMA will be the particular date, on which date Golden Assurance Account/ Ledger was opened (Herein, FMA refer to Fixed Monthly Advance). 

13. Of reference of Point no.12, if your Golden Assurance Account/Ledger open date will be on 29th, 30th or 31st of any month then the last due date of FMA will be 28th of every month (Herein, FMA refer to Fixed Monthly Advance). 

14. Of reference of Point no. 11, 12 and 13, please remember that for your Golden Assurance’s FMA payment, the payment option will be opened 4 days ago of the last due date. (E.g. If your last due date is 22of each month then your payment option will be available from 18th to 22nd of each month) 

15. Consumer can’t request for any extra offer or discount at the time of billing. 

16. Gold rate will be taken on the date of billing. 

17. In Golden Assurance all payable amount will be deposit in consumer’s specific Account/Ledger in Advance only for purchasing ornaments in easy procedure.  

18. In Golden Assurance, Consumer have to make payment for 11 FMA for 11 months as advance within specific date of each month and remaining the last one FMA amount will be discounted in Main Sale Tax Invoice of Ornaments. (Herein, FMA refer to Fixed Monthly Advance).  

19. If any FMA of any month is not made Successfully paid within Due Date by consumer, then this specific Golden Assurance Account/Ledger will be treated as Closed. Consumer will not make repayment in that specific Account/Ledger. (Herein, FMA refer to Fixed Monthly Advance).  

20. Golden Assurance redemption will be available from R.B. Jewellers (Medinipur) outlet only. 

21. No refund will be made in cash or any other payment mode. Consumer must have to purchase jewellery after end of Golden Assurance. 

22. If Golden Assurance will close for the cause of Point no. 10 & 15, consumer can make purchase within the deposited amount at the maturity date and thereafter. In this case company will not allow last FMA in discount or any discount. (Herein, FMA refer to Fixed Monthly Advance) 

23. After end of, consumer must have to complete their purchase ornaments within 30 days from ending. 

24. In offer period of Company, Consumer can’t redeem. Redemption will be available in Normal working days of company.  

25. Company is requested to the consumer to contact our Company Helpline Number (+918167495756/9563284398) for any assistance.  

26. Company has the right to change or alter the terms & conditions any time.  

27. All the disputes subjected to Medinipur Jurisdictiononly. 
""";
