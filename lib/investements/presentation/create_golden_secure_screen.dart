import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_button_widget.dart';
import 'package:rb_jewellers/investements/application/bloc/investment_bloc.dart';
import 'package:rb_jewellers/investements/domain/golden_secure.dart';
import 'package:rb_jewellers/profile/domain/value_objects.dart';

import '../../app/presentation/widgets/app_text_field.dart';
import '../infrastructure/investment_repository.dart';

class CreateGoldenSecureScreen extends StatelessWidget {
  const CreateGoldenSecureScreen({super.key, required this.planName});

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
        body: const CreateGoldenSecureWidget(),
      ),
    );
  }
}

class CreateGoldenSecureWidget extends StatelessWidget {
  const CreateGoldenSecureWidget({
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
              FlushbarHelper.createSuccess(message: 'Golden Secure  Created')
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
                      text: state.goldenSecure.name.value.getOrElse(() => '')),
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
                        .goldenSecure
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
                            InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(name: Name(value))),
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
                    return state.goldenSecure.address.locality == ''
                        ? 'Locality Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(
                              address: state.goldenSecure.address
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
                    return state.goldenSecure.address.postOffice == ''
                        ? 'Post Office Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(
                              address: state.goldenSecure.address
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
                    return state.goldenSecure.address.city == ''
                        ? 'City Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(
                              address: state.goldenSecure.address
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
                    return state.goldenSecure.address.landmark == ''
                        ? 'Landmark Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(
                              address: state.goldenSecure.address
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
                    return state.goldenSecure.address.policeStation == ''
                        ? 'Police Station Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(
                              address: state.goldenSecure.address
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
                    return state.goldenSecure.address.district == ''
                        ? 'District Cannot be Empty'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(
                              address: state.goldenSecure.address
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
                    return state.goldenSecure.address.pin.length < 6
                        ? 'Enter valid Pincode'
                        : null;
                  },
                  onChangedCallBack: (value) =>
                      context.read<InvestmentBloc>().add(
                            InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(
                              address: state.goldenSecure.address
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
                      text: state.goldenSecure.contactNumber.value
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
                        .goldenSecure
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
                  onChangedCallBack: (value) => context
                      .read<InvestmentBloc>()
                      .add(
                        InvestmentEvent.goldenSecure(state.goldenSecure
                            .copyWith(contactNumber: PhoneNumber('+91$value'))),
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
                        .goldenSecure
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
                            InvestmentEvent.goldenSecure(state.goldenSecure
                                .copyWith(
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
                        .goldenSecure
                        .emailAddress!
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
                            InvestmentEvent.goldenSecure(
                              state.goldenSecure
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
                            InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(
                              dateOfBirth: date,
                            )),
                          );
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: AppTextField(
                    enableEdit: false,
                    controller: TextEditingController(
                        text: state.goldenSecure.dateOfBirth != null
                            ? formatDate(state.goldenSecure.dateOfBirth!)
                            : ''),
                    textStyle: largeTextDark,
                    suffixWidget: const Icon(
                      Icons.calendar_month,
                    ),
                    hintText: 'Select Date Of Birth',
                    errorText: state.showErrorMessages
                        // ignore: unnecessary_null_comparison
                        ? state.goldenSecure.dateOfBirth == null
                            ? 'Select valid date of birth'
                            : null
                        : null,
                    errorStyle: smallText.copyWith(color: Colors.red),
                  ),
                ),
                thickSpace,
                thickSpace,
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
                            InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(dateOfBirth: date)),
                          );
                    }, currentTime: DateTime.now(), locale: LocaleType.en);
                  },
                  child: AppTextField(
                    enableEdit: false,
                    controller: TextEditingController(
                        text: state.goldenSecure.dateOfAnniversary != null
                            ? formatDate(state.goldenSecure.dateOfAnniversary!)
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
                thickSpace,
                Text(
                    "You can deposit any amount of money within 12 months period from ${formatDate(DateTime.now())}.",
                    style: standardTextDark),
                thickSpace,
                thickSpace,
                if (!state.goldenSecure.isTermsAndConditonsAccepted)
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
                              InvestmentEvent.goldenSecure(
                                state.goldenSecure.copyWith(
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
                if (state.goldenSecure.isValid())
                  AppButtonWidget(
                    onTap: () async {
                      context
                          .read<InvestmentBloc>()
                          .add(const InvestmentEvent.createGoldenSecure());
                    },
                    buttonText: 'Create',
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
1. Golden Secure will help Consumer for Purchase Jewellery by Depositing small of amount in advance as irregular basics. 

2. In Golden Secure, Gold Weight will be booked automatically by using current gold rate against of every advance amount in their Specific Account/ledger only for purchasing Gold Jewellery from R.B. Jewellers (Medinipur) outlet only. 

3. Company will receive all the paid amount in Advance only. 

4. Golden Secure will continue for 12 months from the date of starting. 

5. Consumer have to choose ornaments design from the start date and they can change ornaments design within 1 months form the starting date.  

6. Consumer can deposit any amount in advance to Start Golden Secure. 

7. In Golden Secure making charges will be applied as per company policy for purchase gold ornaments. 

8. Consumer can’t deposit Making Charges and GST in their specific account/ledger. 

9. Consumer have to pay Making Charges and GST additionally at billing counter in the time of final billing. 

10. In Golden Secure consumer can avail 15% Discount on applied making charges. The discount amount will be adjusted in final TAX INVOICE. 

11. The Golden Secure Account/Ledger value should not exceed Rs.8,50,000/- (Eight lakh fifty thousand only). 

12. Consumer must have to submit their KYC (Pan Card & Aadhar Card) to start Golden Secure. 

13. FMA amount are not fixed for Golden Secure, and consumer can deposit any dynamic amount in any time as their choice. (Herein, FMA refer to Fixed Monthly Advance)  

14. In Golden Secure, Gold Weight will be booked automatically by using current gold rate against of every advance amount. 

15. If once gold weight and rate will book then Consumer can’t request to the company to change/rebook/cancel the gold rate or weight again.  

16. Consumer can stop deposit amount in this Golden Secure any time within this running period. 

17. Consumer can make purchase jewellery any time within this 12 month. 

18. Consumer can’t request for any extra offer or discount at the time of billing. 

19. Consumer must have to make purchase within their deposited amount. 

20. Golden Assurance redemption will be available from R.B. Jewellers (Medinipur) outlet only. 

21. No refund will be made in cash or any other payment mode. Consumer must have to purchase jewellery after maturity/complete. 

22. After end of, consumer must have to complete their purchase ornaments within 30 days from ending. 

23. In offer period of Company, Consumer can’t redeem. Redemption will be available in Normal working days of company.  

24. Company is requested to the consumer to contact our Company Helpline Number (+91 8167495756/9563284398) for any assistance.  

25. Company has the right to change or alter the terms & conditions any time.  

26. All the disputes subjected to Medinipur Jurisdiction only.
""";
