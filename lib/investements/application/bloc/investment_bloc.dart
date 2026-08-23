import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_button_widget.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_dialogs.dart';
import 'package:rb_jewellers/authentication/domain/user.dart';
import 'package:rb_jewellers/investements/domain/easy_gold_savings_plan.dart';
import 'package:rb_jewellers/investements/domain/golden_secure.dart';
import 'package:rb_jewellers/investements/domain/pay_offline.dart';
import 'package:rb_jewellers/investements/domain/transaction_history.dart';

import '../../domain/future_gold_savings_plan.dart';
import '../../domain/gold_booking_history.dart';
import '../../domain/i_investment_repository.dart';
import '../../domain/payment_button.dart';

part 'investment_bloc.freezed.dart';

part 'investment_event.dart';

part 'investment_state.dart';

class InvestmentBloc extends Bloc<InvestmentEvent, InvestmentState> {
  final IInvestmentRepository investmentRepository;

  InvestmentBloc(this.investmentRepository) : super(InvestmentState.initial()) {
    on<_GetMyInvestments>((event, emit) async {
      emit(
        state.copyWith(
          isLoading: true,
          responseFailureOrSuccessOption: none(),
          futureGoldSavingsPlanResponseFailureOrSuccessOption: none(),
          easyGoldSavingsPlanResponseFailureOrSuccessOption: none(),
        ),
      );

      Either<AppFailures, List<EasyGoldSavingsPlan>>
          failureOrSuccessEasyGoldSavingsPlan;
      Either<AppFailures, List<FutureGoldSavingsPlan>>
          failureOrSuccessFutureGoldSavingsPlan;
      Either<AppFailures, List<GoldenSecure>> failureOrSuccessGoldenSecurePlan;

      failureOrSuccessFutureGoldSavingsPlan =
          await investmentRepository.getFutureGoldSavingsPlans();
      failureOrSuccessEasyGoldSavingsPlan =
          await investmentRepository.getEasyGoldSavingsPlans();
      failureOrSuccessGoldenSecurePlan =
          await investmentRepository.getGoldenSecure();

      failureOrSuccessEasyGoldSavingsPlan.fold(
        (l) {},
        (r) {
          List<EasyGoldSavingsPlan> planList = r;

          for (var plan in planList) {
            if ((plan.status == 'Active') &&
                DateTime.now().isAfter(
                    plan.nextInstallmentDate!.add(const Duration(days: 5)))) {
              add(_PayInstallmentOfEasyGoldSavingsPlan(plan));
            }
          }
        },
      );

      failureOrSuccessFutureGoldSavingsPlan.fold(
        (l) {},
        (r) {
          List<FutureGoldSavingsPlan> planList = r;

          for (var plan in planList) {
            if ((plan.status == 'Active') &&
                DateTime.now().isAfter(
                  plan.endDate,
                )) {
              add(_PayInstallmentOfFutureGoldSavingsPlan(plan, '0'));
            }
          }
        },
      );

      failureOrSuccessGoldenSecurePlan.fold(
        (l) {},
        (r) {
          List<GoldenSecure> planList = r;

          for (var plan in planList) {
            if ((plan.status == 'Active') &&
                DateTime.now().isAfter(
                  plan.endDate,
                )) {
              add(_PayInstallmentOfGoldenSecure(
                plan,
                '0',
                0,
                0,
              ));
            }
          }
        },
      );

      emit(
        state.copyWith(
          isLoading: false,
          futureGoldSavingsPlanResponseFailureOrSuccessOption:
              optionOf(failureOrSuccessFutureGoldSavingsPlan),
          easyGoldSavingsPlanResponseFailureOrSuccessOption:
              optionOf(failureOrSuccessEasyGoldSavingsPlan),
          goldenSecureResponseFailureOrSuccessOption:
              optionOf(failureOrSuccessGoldenSecurePlan),
        ),
      );
    });

    on<_EasyGoldSavingsPlan>((event, emit) {
      emit(
        state.copyWith(easyGoldSavingsPlan: event.plan),
      );
    });

    on<_CreateEasyGoldSavingsPlan>((event, emit) async {
      emit(
        state.copyWith(
          showErrorMessages: true,
          isLoading: true,
          responseFailureOrSuccessOption: none(),
        ),
      );
      final now = DateTime.now();
      final startDate = now;
      final nextInstallmentDate = getGoldenAssuranceNextInstallmentDate(
        startDate: startDate,
        nextInstallmentNumber: 1,
      );
      int endAnchorDay = now.day > 28 ? 28 : now.day;
      final endDate = DateTime(now.year, now.month + 11, endAnchorDay);

      final plan = state.easyGoldSavingsPlan.copyWith(
        balanceAmount: state.easyGoldSavingsPlan.amount -
            (state.easyGoldSavingsPlan.amount / 12),
        startDate: startDate,
        endDate: endDate,
        createdAt: now,
        nextInstallmentDate: nextInstallmentDate,
        status: 'Active',
      );

      if (!plan.isValid()) {
        AppDialogs.closeDialog();
        return;
      }

      PaymentStatus? paymentStatus;
      var options;
      String paymentMode = '';

      final result = await Get.bottomSheet(
        Container(
          padding:
              const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 70),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Choose Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  AppButtonWidget(
                    onTap: () async {
                      String orderId = await createOrderInRazorpay(
                          (plan.amount / 12).toInt());
                      // if (orderId != 'null' || orderId != '' || orderId != 'error') {
                      paymentMode = 'Online';
                      var options = {
                        'order_id': orderId,
                        'key': PaymentHandler.keyId,
                        'currency': "INR",
                        'amount': (plan.amount / 12 * 1).toInt(),
                        'name': 'RB Jewellers Customer App.',
                        'description': 'Create Golden Assurance',
                        'retry': {'enabled': false, 'max_count': 0},
                        'send_sms_hash': true,
                        'prefill': {
                          'contact': AppUser.phoneNumber.getOrCrash(),
                          'email': AppUser.uniqueId.getOrCrash()
                        },
                        'external': {
                          'wallets': ['paytm']
                        }
                      };
                      AppDialogs.closeDialog();

                      /// **Start Payment and Await the Result**
                      paymentStatus =
                          await PaymentHandler.startPayment(options);
                      // }

                      Get.back(result: {
                        'paymentMode': 'Online',
                      });
                    },
                    buttonText: "Pay Online",
                  ),
                  thickSpace,
                  AppButtonWidget(
                    onTap: () async {
                      // Fetch the latest planId
                      final CollectionReference easyGoldSavingsPlan =
                          FirebaseFirestore.instance
                              .collection('easy_gold_savings_plan');

                      final querySnapshot = await easyGoldSavingsPlan
                          .orderBy('planId', descending: true)
                          .limit(1)
                          .get();

                      // Determine the next sequential planId
                      String newPlanId;
                      if (querySnapshot.docs.isNotEmpty) {
                        final latestPlanId =
                            querySnapshot.docs.first['planId'] as String;
                        final latestNumber =
                            int.parse(latestPlanId.split('-').last);
                        final nextNumber = latestNumber + 1;
                        newPlanId =
                            'INVRBEGSP-${nextNumber.toString().padLeft(4, '0')}';
                      } else {
                        // Start from 'INVRBEGSP-0001' if no existing plans are found
                        newPlanId = 'INVRBEGSP-0001';
                      }

                      print('plan.amount ${plan.amount}');
                      print('plan.id ${plan.id}');
                      print('newPlanId ${newPlanId}');
                      paymentMode = 'Offline';
                      add(
                        InvestmentEvent.payOnStore(PayOffline(
                          id: '',
                          planName: 'Golden Assurance',
                          amount: (plan.amount / 12).toDouble(),
                          planId: newPlanId,
                          userId: AppUser.uniqueId.getOrCrash(),
                          createdAt: DateTime.now().toIso8601String(),
                          status: false,
                          qty: null,
                          goldPrice: null,
                        )),
                      );
                      // FocusScope.of(context).unfocus();

                      String planName = plan.name.toString();
                      String planNameResult = planName
                          .replaceAll("Value(Right(", "")
                          .replaceAll("))", "");
                      String planContactNumber = plan.contactNumber.toString();
                      String planContactNumberResult = planContactNumber
                          .replaceAll("Value(Right(", "")
                          .replaceAll("))", "");

                      final notificationData = {
                        'read': false,
                        'time_stamp': FieldValue.serverTimestamp(),
                        'title': 'New Golden Assurance has been created',
                        'description':
                            'New Golden Assurance has been created. Plan ID- ${newPlanId}, Customer Name: ${planNameResult}, Customer Phone Number: ${planContactNumberResult},',
                      };

                      await FirebaseFirestore.instance
                          .collection('admin_notification')
                          .add(
                              notificationData); // or .doc(pushKey).set(notificationData)

                      final notificationData1 = {
                        'read': false,
                        'time_stamp': FieldValue.serverTimestamp(),
                        'title':
                            'Pay at counter request made for Rs.${(plan.amount / 12).toInt()}',
                        'description':
                            'Pay at counter request made for Rs.${(plan.amount / 12).toInt()}, Scheme Type: Golden Assurance, Plan ID- ${newPlanId}',
                      };

                      await FirebaseFirestore.instance
                          .collection('admin_notification')
                          .add(notificationData1);

                      toastMessage(
                          'Please visit the store to make the payment.');
                      Get.back(result: {
                        'paymentMode': 'Offline',
                      });
                    },
                    color: Colors.red,
                    buttonText: "Pay at Counter",
                  ),
                ],
              ),
            ],
          ),
        ),
        isDismissible: true,
        enableDrag: true,
      );

      if (result != null) {
        paymentMode = result['paymentMode'];
      }

      print('result $result');

      print('paymentMode yehi h >>  $paymentMode');

      if (paymentMode == 'Online') {
        if (paymentStatus?.success ?? false) {
          AppDialogs.setLoadingDialog();
          final CollectionReference easyGoldSavingsPlan =
              FirebaseFirestore.instance.collection('easy_gold_savings_plan');

          final querySnapshot = await easyGoldSavingsPlan
              .orderBy('planId', descending: true)
              .limit(1)
              .get();

          // Determine the next sequential planId
          String newPlanId;
          if (querySnapshot.docs.isNotEmpty) {
            final latestPlanId = querySnapshot.docs.first['planId'] as String;
            final latestNumber = int.parse(latestPlanId.split('-').last);
            final nextNumber = latestNumber + 1;
            newPlanId = 'INVRBEGSP-${nextNumber.toString().padLeft(4, '0')}';
          } else {
            // Start from 'INVRBEGSP-0001' if no existing plans are found
            newPlanId = 'INVRBEGSP-0001';
          }

          /// **Update Transaction History on Success**
          final EasyGoldSavingsPlan updatedPlan =
              plan.copyWith(transactionHistory: [
            TransactionHistory(
              transactionDate: DateTime.now(),
              amount: plan.amount / 12,
              balanceAmount: plan.balanceAmount,
              totalAmount: plan.amount,
              installmentPaying: 1,
              transactionId: paymentStatus!.paymentId!,
              paymentMethod: paymentStatus?.paymentMethod ?? 'Unknown',
              transactionType: paymentStatus?.transactionType ?? 'Unknown',
              status: 'Success',
              description: 'Create Golden Assurance',
              userId: AppUser.uniqueId.getOrCrash(),
              planId: newPlanId,
              goldPrice: null,
              noOfInstallment: 1,
              qty: null,
            )
          ]);

          Either<AppFailures, Unit> failureOrSuccess;
          failureOrSuccess =
              await investmentRepository.createEasyGoldSavingsPlan(updatedPlan);

          String planName = plan.name.toString();
          String planNameResult =
              planName.replaceAll("Value(Right(", "").replaceAll("))", "");
          String planContactNumber = plan.contactNumber.toString();
          String planContactNumberResult = planContactNumber
              .replaceAll("Value(Right(", "")
              .replaceAll("))", "");

          final notificationData1 = {
            'read': false,
            'time_stamp': FieldValue.serverTimestamp(),
            'title': 'Online Payment made for Rs.${(plan.amount / 12).toInt()}',
            'description':
                'Online Payment made for Rs.${(plan.amount / 12).toInt()}, Scheme Type: Golden Assurance, Plan ID- ${newPlanId}',
          };

          await FirebaseFirestore.instance
              .collection('admin_notification')
              .add(notificationData1);

          final notificationData = {
            'read': false,
            'time_stamp': FieldValue.serverTimestamp(),
            'title': 'New Golden Assurance has been created',
            'description':
                'New Golden Assurance has been created. Plan ID- ${newPlanId}, Customer Name: ${planNameResult}, Customer Phone Number: ${planContactNumberResult},',
          };

          await FirebaseFirestore.instance
              .collection('admin_notification')
              .add(notificationData); // or .doc(pushKey).set(notificationData)

          AppDialogs.closeDialog();

          emit(
            state.copyWith(
              isLoading: false,
              responseFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
          await Future.delayed(const Duration(seconds: 2));
          add(const InvestmentEvent.getMyInvestments());
        } else {
          AppDialogs.setMessageDialog(
              "Payment Failed\nError Message: ${paymentStatus?.errorMessage}");
        }
      } else if (paymentMode == 'Offline') {
        AppDialogs.setLoadingDialog();

        /// **Update Transaction History on Success**
        final EasyGoldSavingsPlan updatedPlan = plan.copyWith(
            balanceAmount: state.easyGoldSavingsPlan.amount,
            transactionHistory: [
              TransactionHistory(
                transactionDate: DateTime.now(),
                amount: 0,
                // plan.amount / 12,
                balanceAmount: plan.amount,
                //plan.balanceAmount,
                totalAmount: plan.amount,
                installmentPaying: 0,
                transactionId: 'Offline',
                paymentMethod: 'Offline',
                transactionType: 'Offline',
                status: 'Not Paid',
                description: 'Create Golden Assurance',
                userId: AppUser.uniqueId.getOrCrash(),
                planId: plan.id,
                goldPrice: null,
                noOfInstallment: 0,
                qty: null,
              )
            ]);

        Either<AppFailures, Unit> failureOrSuccess;
        failureOrSuccess =
            await investmentRepository.createEasyGoldSavingsPlan(updatedPlan);

        AppDialogs.closeDialog();

        emit(
          state.copyWith(
            isLoading: false,
            responseFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        );
        await Future.delayed(const Duration(seconds: 2));
        add(const InvestmentEvent.getMyInvestments());
      }
    });

    on<_PayInstallmentOfEasyGoldSavingsPlan>((event, emit) async {
      AppDialogs.setLoadingDialog();

      emit(
        state.copyWith(
          isLoading: true,
          responseFailureOrSuccessOption: none(),
        ),
      );
      // Print all values of the EasyGoldSavingsPlan for debugging
      final plan = event.plan;

      if (!plan.isValid()) {
        AppDialogs.closeDialog();
        return;
      }

      DateTime? nextInstallmentDate;
      String? status;
      if (plan.nextInstallmentDate != null &&
          DateTime.now()
              .isAfter(plan.nextInstallmentDate!.add(const Duration(days: 5)))) {
        nextInstallmentDate = null;
        status = 'Closed';
      } else if (plan.noOfInstallmentsPaid >= 11) {
        nextInstallmentDate = null;
        status = 'Completed';
      } else {
        status = 'Active';
        nextInstallmentDate = getGoldenAssuranceNextInstallmentDate(
          startDate: plan.startDate,
          nextInstallmentNumber: plan.noOfInstallmentsPaid + 1,
        );
      }

      /// create plan first, then payment, if payment success make plan status to active
      /// along with adding trasaction history
      final List<TransactionHistory> currentTransactionHistory = [];
      currentTransactionHistory.addAll(plan.transactionHistory);
      int installmentsPaid = plan.noOfInstallmentsPaid;
      if (status != 'Closed') {
        String orderId =
            await createOrderInRazorpay((plan.amount / 12).toInt());
        // if (orderId != 'null' || orderId != '' || orderId != 'error') {
        var options = {
          'order_id': orderId,
          'key': PaymentHandler.keyId,
          'currency': "INR",
          'amount': (plan.amount / 12 * 1).toInt(),
          'name': 'RB Jewellers Customer App.',
          'description': 'Golden Assurance Installment',
          'retry': {'enabled': false, 'max_count': 0},
          'send_sms_hash': true,
          'prefill': {
            'contact': AppUser.phoneNumber.getOrCrash(),
            'email': AppUser.uniqueId.getOrCrash()
          },
          'external': {
            'wallets': ['paytm']
          }
        };

        /// **Start Payment and Await the Result**
        AppDialogs.closeDialog();
        final PaymentStatus paymentStatus =
            await PaymentHandler.startPayment(options);

        if (paymentStatus.success ?? false) {
          AppDialogs.setLoadingDialog();

          int prevInstallmentPaying = 0;
          int prevNoOfInstallment = 0;
          if (plan.transactionHistory.isNotEmpty) {
            prevInstallmentPaying =
                (plan.transactionHistory.last.installmentPaying ?? 0).toInt();
            prevNoOfInstallment =
                (plan.transactionHistory.last.noOfInstallment ?? 0).toInt();
          }

          /// **Update Transaction History on Success**
          currentTransactionHistory.add(TransactionHistory(
            transactionDate: DateTime.now(),
            amount: plan.amount / 12,
            balanceAmount: plan.balanceAmount - (plan.amount / 12),
            totalAmount: plan.amount,
            installmentPaying: prevInstallmentPaying + 1,
            transactionId: paymentStatus.paymentId!,
            paymentMethod: paymentStatus.paymentMethod ?? 'Unknown',
            transactionType: paymentStatus.transactionType ?? 'Unknown',
            status: 'Success',
            description: options['description'] as String,
            userId: AppUser.uniqueId.getOrCrash(),
            planId: plan.id,
            goldPrice: null,
            noOfInstallment: prevNoOfInstallment + 1,
            qty: null,
          ));

          installmentsPaid += 1;

          final EasyGoldSavingsPlan updatedPalnData = plan.copyWith(
              status: status,
              balanceAmount: plan.balanceAmount - (plan.amount / 12),
              nextInstallmentDate: nextInstallmentDate,
              noOfInstallmentsPaid: installmentsPaid,
              transactionHistory: currentTransactionHistory);

          Either<AppFailures, Unit> failureOrSuccess;
          failureOrSuccess = await investmentRepository
              .updateTransactionHistoryForEasyGoldSavingsPlans(updatedPalnData);

          final notificationData = {
            'read': false,
            'time_stamp': FieldValue.serverTimestamp(),
            'title': 'Online Payment made for Rs.${plan.amount / 12}',
            'description':
                'Online Payment made for Rs.${plan.amount / 12}, Scheme Type: Golden Assurance , Plan ID- ${plan.id}',
          };

          await FirebaseFirestore.instance
              .collection('admin_notification')
              .add(notificationData); // or .doc(pushKey).set(notificationData)

          AppDialogs.closeDialog();
          emit(
            state.copyWith(
              isLoading: true,
              responseFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );

          await Future.delayed(const Duration(seconds: 2));
          add(const InvestmentEvent.getMyInvestments());
        } else {
          // AppDialogs.closeDialog();
          AppDialogs.setMessageDialog(
              "Payment Failed\nError Message: ${paymentStatus.errorMessage}");
        }
        // }
      } else {
        AppDialogs.closeDialog();
        // AppDialogs.setMessageDialog(
        //     "Payment Failed\nError Message: Plan closed, please contact support");
      }
    });

    ///////////////
    ///
    on<_FutureGoldSavingsPlan>((event, emit) {
      emit(
        state.copyWith(futureGoldSavingsPlan: event.plan),
      );
    });

    on<_CreateFutureGoldSavingsPlan>((event, emit) async {
      emit(
        state.copyWith(
          showErrorMessages: true,
          isLoading: true,
          responseFailureOrSuccessOption: none(),
        ),
      );
      // Print all values of the EasyGoldSavingsPlan for debugging
      final plan = state.futureGoldSavingsPlan.copyWith(
        startDate: DateTime.now(),
        endDate: DateTime(
            DateTime.now().year, DateTime.now().month + 11, DateTime.now().day),
        createdAt: DateTime.now(),
        status: 'Active',
      );

      if (!plan.isValid()) {
        AppDialogs.closeDialog();
        return;
      }

      PaymentStatus? paymentStatus;
      var options;
      String paymentMode1 = '';

      final result = await Get.bottomSheet(
        Container(
          padding:
              const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 70),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Choose Payment Method",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  AppButtonWidget(
                    onTap: () async {
                      String orderId = await createOrderInRazorpay(
                          (plan.amountPaid).toInt());
                      // if (orderId != 'null' || orderId != '' || orderId != 'error') {
                      paymentMode1 = 'Online';
                      options = {
                        'order_id': orderId,
                        'key': PaymentHandler.keyId,
                        'currency': "INR",
                        'amount': (plan.amountPaid * 1).toInt(),
                        'name': 'RB Jewellers Customer App.',
                        'description': 'Create Golden Future ',
                        'retry': {'enabled': false, 'max_count': 0},
                        'send_sms_hash': true,
                        'prefill': {
                          'contact':
                              '8962164658' /*AppUser.phoneNumber.getOrCrash()*/,
                          'email': AppUser.uniqueId.getOrCrash()
                        },
                        'external': {
                          'wallets': ['paytm']
                        }
                      };

                      print('paymentMode1 in check $paymentMode1');

                      AppDialogs.closeDialog();

                      /// **Start Payment and Await the Result**
                      paymentStatus =
                          await PaymentHandler.startPayment(options);
                      // } // Close bottom sheet

                      Get.back(result: {
                        'paymentMode': 'Online',
                      });
                    },
                    buttonText: "Pay Online",
                  ),
                  thickSpace,
                  AppButtonWidget(
                    onTap: () async {
                      // onPayOnStore();
                      // Get.back(); // Close bottom sheet
                      final CollectionReference futureGoldSavingsPlan =
                          FirebaseFirestore.instance
                              .collection('future_gold_savings_plan');
                      // Determine the next sequential planId

                      final querySnapshot = await futureGoldSavingsPlan
                          .orderBy('planId', descending: true)
                          .limit(1)
                          .get();

                      String newPlanId;
                      if (querySnapshot.docs.isNotEmpty) {
                        final latestPlanId =
                            querySnapshot.docs.first['planId'] as String;
                        final latestNumber =
                            int.parse(latestPlanId.split('-').last);
                        final nextNumber = latestNumber + 1;
                        newPlanId =
                            'INVRBGFAP-${nextNumber.toString().padLeft(4, '0')}';
                      } else {
                        // Start from 'INVRBFUTURE-0001' if no existing plans are found
                        newPlanId = 'INVRBGFAP-0001';
                      }
                      paymentMode1 = 'Offline';
                      print('paymentMode1 in check $paymentMode1');
                      add(
                        InvestmentEvent.payOnStore(PayOffline(
                          id: '',
                          planName: 'Golden Future ',
                          amount: (plan.amountPaid).toDouble(),
                          planId: newPlanId,
                          userId: AppUser.uniqueId.getOrCrash(),
                          createdAt: DateTime.now().toIso8601String(),
                          status: false,
                          goldPrice: null,
                          qty: null,
                        )),
                      );
                      // FocusScope.of(context).unfocus();

                      String planName = plan.name.toString();
                      String planNameResult = planName
                          .replaceAll("Value(Right(", "")
                          .replaceAll("))", "");
                      String planContactNumber = plan.contactNumber.toString();
                      String planContactNumberResult = planContactNumber
                          .replaceAll("Value(Right(", "")
                          .replaceAll("))", "");
                      final notificationData = {
                        'read': false,
                        'time_stamp': FieldValue.serverTimestamp(),
                        'title': 'New Golden Future  has been created',
                        'description':
                            'New Golden Future  has been created. Plan ID- ${newPlanId}, Customer Name: ${planNameResult}, Customer Phone Number: ${planContactNumberResult},',
                      };

                      await FirebaseFirestore.instance
                          .collection('admin_notification')
                          .add(
                              notificationData); // or .doc(pushKey).set(notificationData)
                      toastMessage(
                          'Please visit the store to make the payment.');

                      final notificationData1 = {
                        'read': false,
                        'time_stamp': FieldValue.serverTimestamp(),
                        'title':
                            'Pay at counter request made for Rs.${(plan.amountPaid).toDouble()}',
                        'description':
                            'Pay at counter request made for Rs.${(plan.amountPaid).toDouble()}, Scheme Type: Golden Future , Plan ID- ${newPlanId}',
                      };

                      await FirebaseFirestore.instance
                          .collection('admin_notification')
                          .add(notificationData1);
                      Get.back(result: {
                        'paymentMode': 'Offline',
                      });
                    },
                    color: Colors.red,
                    buttonText: "Pay at Counter",
                  ),
                ],
              ),
            ],
          ),
        ),
        isDismissible: true,
        enableDrag: true,
      );

      /// create plan first, then payment, if payment success make plan status to active
      /// along with adding trasaction history

      if (result != null) {
        paymentMode1 = result['paymentMode'];
      }

      print('result $result');
      print('paymentMode yehi h >>  $paymentMode1');
      if (paymentMode1 == 'Online') {
        // paymentStatus = await PaymentHandler.completer?.future;

        if (paymentStatus?.success ?? false) {
          print('paymentStatus if');
          AppDialogs.setLoadingDialog();
          final CollectionReference futureGoldSavingsPlan =
              FirebaseFirestore.instance.collection('future_gold_savings_plan');
          // Determine the next sequential planId

          final querySnapshot = await futureGoldSavingsPlan
              .orderBy('planId', descending: true)
              .limit(1)
              .get();

          String newPlanId;
          if (querySnapshot.docs.isNotEmpty) {
            final latestPlanId = querySnapshot.docs.first['planId'] as String;
            final latestNumber = int.parse(latestPlanId.split('-').last);
            final nextNumber = latestNumber + 1;
            newPlanId = 'INVRBGFAP-${nextNumber.toString().padLeft(4, '0')}';
          } else {
            // Start from 'INVRBFUTURE-0001' if no existing plans are found
            newPlanId = 'INVRBGFAP-0001';
          }

          /// **Update Transaction History on Success**
          final FutureGoldSavingsPlan updatedPlan =
              plan.copyWith(transactionHistory: [
            TransactionHistory(
              transactionDate: DateTime.now(),
              amount: plan.amountPaid,
              balanceAmount: 0,
              totalAmount: plan.amountPaid,
              installmentPaying: 1,
              transactionId: paymentStatus!.paymentId!,
              paymentMethod: paymentStatus!.paymentMethod ?? 'Unknown',
              transactionType: paymentStatus!.transactionType ?? 'Unknown',
              status: 'Success',
              description: options['description'] as String,
              userId: AppUser.uniqueId.getOrCrash(),
              planId: newPlanId,
              goldPrice: null,
              noOfInstallment: 1,
              qty: null,
            )
          ]);

          Either<AppFailures, Unit> failureOrSuccess;
          failureOrSuccess = await investmentRepository
              .createFutureGoldSavingsPlan(updatedPlan);
          String planName = plan.name.toString();
          String planNameResult =
              planName.replaceAll("Value(Right(", "").replaceAll("))", "");
          String planContactNumber = plan.contactNumber.toString();
          String planContactNumberResult = planContactNumber
              .replaceAll("Value(Right(", "")
              .replaceAll("))", "");

          final notificationData1 = {
            'read': false,
            'time_stamp': FieldValue.serverTimestamp(),
            'title': 'Online Payment made for Rs.${(plan.amountPaid).toInt()}',
            'description':
                'Online Payment made for Rs.${(plan.amountPaid).toInt()}, Scheme Type: Golden Future , Plan ID- ${newPlanId}',
          };

          await FirebaseFirestore.instance
              .collection('admin_notification')
              .add(notificationData1);

          final notificationData = {
            'read': false,
            'time_stamp': FieldValue.serverTimestamp(),
            'title': 'New Golden Future  has been created',
            'description':
                'New Golden Future  has been created. Plan ID- ${newPlanId}, Customer Name: ${planNameResult}, Customer Phone Number: ${planContactNumberResult},',
          };

          await FirebaseFirestore.instance
              .collection('admin_notification')
              .add(notificationData); // or .doc(pushKey).set(notificationData)
          AppDialogs.closeDialog();

          emit(
            state.copyWith(
              isLoading: false,
              responseFailureOrSuccessOption: optionOf(failureOrSuccess),
            ),
          );
          await Future.delayed(const Duration(seconds: 2));
          add(const InvestmentEvent.getMyInvestments());
        } else {
          print('paymentStatus else');
          // AppDialogs.closeDialog();
          AppDialogs.setMessageDialog(
              "Payment Failed\nError Message: ${paymentStatus?.errorMessage}");
        }
      } else if (paymentMode1 == 'Offline') {
        print('else if $paymentMode1');
        AppDialogs.setLoadingDialog();

        /// **Update Transaction History on Success**
        final FutureGoldSavingsPlan updatedPlan =
            plan.copyWith(amountPaid: 0, transactionHistory: [
          TransactionHistory(
            transactionDate: DateTime.now(),
            amount: 0,
            // plan.amountPaid,
            balanceAmount: 0,
            totalAmount: 0,
            installmentPaying: 0,
            transactionId: 'Offline',
            paymentMethod: 'Offline',
            transactionType: 'Offline',
            status: 'Not Paid',
            description: 'Create Golden Future ',
            userId: AppUser.uniqueId.getOrCrash(),
            planId: plan.id,
            goldPrice: null,
            noOfInstallment: 0,
            qty: null,
          )
        ]);

        Either<AppFailures, Unit> failureOrSuccess;
        failureOrSuccess =
            await investmentRepository.createFutureGoldSavingsPlan(updatedPlan);

        AppDialogs.closeDialog();

        emit(
          state.copyWith(
            isLoading: false,
            responseFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        );
        await Future.delayed(const Duration(seconds: 2));
        add(const InvestmentEvent.getMyInvestments());
      }
    });

    on<_PayInstallmentOfFutureGoldSavingsPlan>((event, emit) async {
      AppDialogs.setLoadingDialog();

      emit(
        state.copyWith(
          isLoading: true,
          responseFailureOrSuccessOption: none(),
        ),
      );
      // Print all values of the EasyGoldSavingsPlan for debugging
      final plan = event.plan;

      if (!plan.isValid()) {
        AppDialogs.closeDialog();
        return;
      }

      String? status;
      bool planDateThreshold = false;

      if (DateTime.now().isAfter(
        plan.endDate,
      )) {
        planDateThreshold = true;
        status = 'Completed';
      } else if ((plan.balanceAmount - double.parse(event.amount)) <= 0 &&
          plan.isGoldPriceBooked) {
        status = 'Completed';
      } else {
        status = 'Active';
      }

      String orderId =
          await createOrderInRazorpay((double.parse(event.amount)).toInt());
      // if (orderId != 'null' || orderId != '' || orderId != 'error') {
      var options = {
        'order_id': orderId,
        'key': PaymentHandler.keyId,
        'currency': "INR",
        'amount': (double.parse(event.amount) * 1).toInt(),
        'name': 'RB Jewellers Customer App.',
        'description': 'Golden Future  Installment',
        'retry': {'enabled': false, 'max_count': 0},
        'send_sms_hash': true,
        'prefill': {
          'contact': AppUser.phoneNumber.getOrCrash(),
          'email': AppUser.uniqueId.getOrCrash()
        },
        'external': {
          'wallets': ['paytm']
        }
      };

      /// create plan first, then payment, if payment success make plan status to active
      /// along with adding trasaction history

      /// **Start Payment and Await the Result**
      AppDialogs.closeDialog();
      final PaymentStatus paymentStatus =
          await PaymentHandler.startPayment(options);
      if (paymentStatus.success ?? false) {
        AppDialogs.setLoadingDialog();

        /// **Update Transaction History on Success**
        final List<TransactionHistory> currentTransactionHistory = [];
        currentTransactionHistory.addAll(plan.transactionHistory);
        if (!planDateThreshold) {
          currentTransactionHistory.add(TransactionHistory(
            transactionDate: DateTime.now(),
            amount: double.parse(event.amount),
            balanceAmount: !plan.isGoldPriceBooked
                ? 0
                : plan.totalPriceForBookedQty -
                    (plan.amountPaid + double.parse(event.amount)),
            totalAmount: plan.totalPriceForBookedQty,
            installmentPaying:
                plan.transactionHistory.last.installmentPaying ?? 0 + 1,
            paymentMethod: paymentStatus.paymentMethod ?? 'Unknown',
            transactionType: paymentStatus.transactionType ?? 'Unknown',
            status: 'Success',
            transactionId: paymentStatus.paymentId!,
            description: options['description'] as String,
            userId: AppUser.uniqueId.getOrCrash(),
            planId: plan.id,
            goldPrice: null,
            noOfInstallment:
                plan.transactionHistory.last.noOfInstallment ?? 0 + 1,
            qty: null,
          ));
        }

        final FutureGoldSavingsPlan updatedPalnData = plan.copyWith(
            status: status,
            amountPaid: planDateThreshold
                ? plan.amountPaid
                : plan.amountPaid + double.parse(event.amount),
            balanceAmount: planDateThreshold
                ? plan.balanceAmount
                : !plan.isGoldPriceBooked
                    ? 0
                    : plan.totalPriceForBookedQty -
                        (plan.amountPaid + double.parse(event.amount)),
            noOfInstallmentsPaid: planDateThreshold
                ? plan.noOfInstallmentsPaid
                : plan.noOfInstallmentsPaid + 1,
            transactionHistory: currentTransactionHistory);

        Either<AppFailures, Unit> failureOrSuccess;
        failureOrSuccess = await investmentRepository
            .updateTransactionHistoryForFutureGoldSavingsPlans(updatedPalnData);

        final notificationData = {
          'read': false,
          'time_stamp': FieldValue.serverTimestamp(),
          'title': 'Online Payment made for Rs.${event.amount}',
          'description':
              'Online Payment made for Rs.${event.amount}, Scheme Type: Golden Future , Plan ID- ${plan.id}',
        };

        await FirebaseFirestore.instance
            .collection('admin_notification')
            .add(notificationData); // or .doc(pushKey).set(notificationData)

        AppDialogs.closeDialog();
        emit(
          state.copyWith(
            isLoading: true,
            responseFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        );
        await Future.delayed(const Duration(seconds: 2));
        add(const InvestmentEvent.getMyInvestments());
      } else {
        // AppDialogs.closeDialog();
        AppDialogs.setMessageDialog(
            "Payment Failed\nError Message: ${paymentStatus.errorMessage}");
      }
      // }
    });

//////////////
    ///
    on<_GoldenSecure>((event, emit) {
      emit(
        state.copyWith(goldenSecure: event.plan),
      );
    });

    on<_CreateGoldenSecure>((event, emit) async {
      emit(
        state.copyWith(
          showErrorMessages: true,
          isLoading: true,
          responseFailureOrSuccessOption: none(),
        ),
      );

      AppDialogs.setLoadingDialog();

      if (!state.goldenSecure.isValid()) {
        AppDialogs.closeDialog();
        return;
      }

      final CollectionReference goldenSecure =
          FirebaseFirestore.instance.collection('golden_secure_plan');
      // Determine the next sequential planId

      final querySnapshot =
          await goldenSecure.orderBy('planId', descending: true).limit(1).get();

      String newPlanId;
      if (querySnapshot.docs.isNotEmpty) {
        final latestPlanId = querySnapshot.docs.first['planId'] as String;
        final latestNumber = int.parse(latestPlanId.split('-').last);
        final nextNumber = latestNumber + 1;
        newPlanId = 'INVRBGS-${nextNumber.toString().padLeft(4, '0')}';
      } else {
        // Start from 'INVRBFUTURE-0001' if no existing plans are found
        newPlanId = 'INVRBGS-0001';
      }

      final plan = state.goldenSecure.copyWith(
        id: newPlanId,
        planId: newPlanId,
        startDate: DateTime.now(),
        endDate: DateTime(
            DateTime.now().year, DateTime.now().month + 11, DateTime.now().day),
        createdAt: DateTime.now(),
        status: 'Active',
      );

      final GoldenSecure updatedPlan = plan.copyWith(
          totalBookingAmount: 0, totalBookedGold: 0, transactionHistory: []);

      Either<AppFailures, Unit> failureOrSuccess;
      failureOrSuccess =
          await investmentRepository.createGoldenSecure(updatedPlan);

      AppDialogs.closeDialog();

      failureOrSuccess.fold(
        (l) {},
        (r) async {
          final notificationData = {
            'read': false,
            'time_stamp': FieldValue.serverTimestamp(),
            'title': 'New Golden Secure  has been created',
            'description':
                'New Golden Secure  has been created. Plan ID- $newPlanId, Customer Name: ${plan.name.getOrElse('')}, Customer Phone Number: ${plan.contactNumber.getOrElse('')},',
          };

          await FirebaseFirestore.instance
              .collection('admin_notification')
              .add(notificationData); // or .doc(pushKey).set(notificationData)
        },
      );

      emit(
        state.copyWith(
          isLoading: false,
          responseFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );
      await Future.delayed(const Duration(seconds: 2));
      add(const InvestmentEvent.getMyInvestments());
    });

    on<_PayInstallmentOfGoldenSecure>((event, emit) async {
      log('Gold: ${event.qty}-------------- Price: ${event.goldPrice}');

      AppDialogs.setLoadingDialog();
      emit(
        state.copyWith(
          isLoading: true,
          responseFailureOrSuccessOption: none(),
        ),
      );
      // Print all values of the EasyGoldSavingsPlan for debugging
      final plan = event.plan;

      if (!plan.isValid()) {
        AppDialogs.closeDialog();
        return;
      }

      String? status;
      bool planDateThreshold = false;

      if (DateTime.now().isAfter(
        plan.endDate,
      )) {
        planDateThreshold = true;
        status = 'Completed';
      } else {
        status = 'Active';
      }

      String orderId =
          await createOrderInRazorpay((double.parse(event.amount)).toInt());
      // if (orderId != 'null' || orderId != '' || orderId != 'error') {
      var options = {
        'order_id': orderId,
        'key': PaymentHandler.keyId,
        'currency': "INR",
        'amount': (double.parse(event.amount) * 1).toInt(),
        'name': 'RB Jewellers Customer App.',
        'description': 'Golden Secure  Installment',
        'retry': {'enabled': false, 'max_count': 0},
        'send_sms_hash': true,
        'prefill': {
          'contact': AppUser.phoneNumber.getOrCrash(),
          'email': AppUser.uniqueId.getOrCrash()
        },
        'external': {
          'wallets': ['paytm']
        }
      };

      /// create plan first, then payment, if payment success make plan status to active
      /// along with adding trasaction history

      /// **Start Payment and Await the Result**
      AppDialogs.closeDialog();

      final PaymentStatus paymentStatus =
          await PaymentHandler.startPayment(options);
      if (paymentStatus.success) {
        AppDialogs.setLoadingDialog();

        /// **Update Transaction History on Success**
        final List<TransactionHistory> currentTransactionHistory = [];
        currentTransactionHistory.addAll(plan.transactionHistory ?? []);
        if (!planDateThreshold) {
          currentTransactionHistory.add(TransactionHistory(
            // transactionId: '${event.plan.transactionHistory.last.transactionId}1',
            transactionDate: DateTime.now(),
            amount: double.parse(event.amount),
            balanceAmount: 0,
            totalAmount: plan.totalBookingAmount,
            installmentPaying:
                plan.transactionHistory?.lastOrNull?.installmentPaying ?? 0 + 1,
            paymentMethod: paymentStatus.paymentMethod ?? 'Unknown',
            transactionType: paymentStatus.transactionType ?? 'Unknown',
            status: 'Success',
            transactionId: paymentStatus.paymentId!,
            description: options['description'] as String,
            userId: AppUser.uniqueId.getOrCrash(),
            planId: plan.id,
            goldPrice: event.goldPrice,
            noOfInstallment:
                plan.transactionHistory?.lastOrNull?.noOfInstallment ?? 0 + 1,
            qty: event.qty,
          ));
        }

        final GoldenSecure updatedPalnData = plan.copyWith(
          status: status,
          totalBookingAmount: planDateThreshold
              ? plan.totalBookingAmount
              : plan.totalBookingAmount + double.parse(event.amount),
          noOfInstallment: planDateThreshold
              ? plan.noOfInstallment
              : plan.noOfInstallment + 1,
          transactionHistory: currentTransactionHistory,
        );

        Either<AppFailures, Unit> failureOrSuccess;
        failureOrSuccess = await investmentRepository
            .updateTransactionHistoryForGoldenSecure(updatedPalnData);

        final notificationData = {
          'read': false,
          'time_stamp': FieldValue.serverTimestamp(),
          'title': 'Online Payment made for Rs.${event.amount}',
          'description':
              'Online Payment made for Rs.${event.amount}, Scheme Type: Golden Secure , Plan ID- ${plan.id}',
        };

        await FirebaseFirestore.instance
            .collection('admin_notification')
            .add(notificationData); // or .doc(pushKey).set(notificationData)

        AppDialogs.closeDialog();
        emit(
          state.copyWith(
            isLoading: true,
            responseFailureOrSuccessOption: optionOf(failureOrSuccess),
          ),
        );
        await Future.delayed(const Duration(seconds: 2));
        add(const InvestmentEvent.getMyInvestments());
      } else {
        AppDialogs.setMessageDialog(
            "Payment Failed\nError Message: ${paymentStatus.errorMessage}");
      }
    });

    on<_BookGoldPriceForFutureGold>((event, emit) async {
      AppDialogs.setLoadingDialog();

      emit(
        state.copyWith(
          isLoading: true,
          responseFailureOrSuccessOption: none(),
        ),
      );
      // Print all values of the EasyGoldSavingsPlan for debugging
      final plan = event.plan;

      if (!plan.isValid()) {
        AppDialogs.closeDialog();
        return;
      }

      final List<GoldBookingHistory> goldBookingHistory = [];
      goldBookingHistory.addAll(plan.goldBookingHistory);
      goldBookingHistory.add(GoldBookingHistory(
        transactionDate: DateTime.now(),
        bookedQty: double.parse(plan.goldQuantityBooked.toString()),
        goldRate: double.parse(plan.goldPrice.price22.toString()),
        totalAmount: plan.totalPriceForBookedQty,
        status: 'pending',
      ));

      final FutureGoldSavingsPlan updatedPalnData = plan.copyWith(
          goldBookingStatus: true,
          // balanceAmount: plan.totalPriceForBookedQty - plan.amountPaid,
          goldBookingHistory: goldBookingHistory);

      Either<AppFailures, Unit> failureOrSuccess;
      failureOrSuccess = await investmentRepository
          .bookGoldPricrForFutureGoldSavingsPlans(updatedPalnData);

      await Future.delayed(const Duration(seconds: 2));
      Either<AppFailures, Unit> failureOrSuccess1;
      failureOrSuccess1 = await investmentRepository
          .bookGoldPricrForFutureGoldSavingsPlans1(updatedPalnData);

      AppDialogs.closeDialog();
      emit(
        state.copyWith(
          isLoading: true,
          responseFailureOrSuccessOption: optionOf(failureOrSuccess),
        ),
      );

      await Future.delayed(const Duration(seconds: 2));
      add(const InvestmentEvent.getMyInvestments());
    });

/////
//////
    on<_PayOnStore>((event, emit) async {
      await investmentRepository.payOffline(event.data);

      final notificationData = {
        'read': false,
        'time_stamp': FieldValue.serverTimestamp(),
        'title': 'Pay at counter request made for Rs.${event.data.amount}',
        'description':
            'Pay at counter request made for Rs.${event.data.amount}, Scheme Type: ${event.data.planName}, Plan ID- ${event.data.planId}',
      };

      await FirebaseFirestore.instance
          .collection('admin_notification')
          .add(notificationData); // or .doc(pushKey).set(notificationData)
    });
  }

  Future<void> showPaymentSelectionBottomSheet(
      {required Function onPayOnline, required Function onPayOnStore}) async {
    await Get.bottomSheet(
      Container(
        padding:
            const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 70),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Choose Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                AppButtonWidget(
                  onTap: () {
                    onPayOnline();
                    Get.back(); // Close bottom sheet
                  },
                  buttonText: "Pay Online",
                ),
                thickSpace,
                AppButtonWidget(
                  onTap: () {
                    onPayOnStore();
                    Get.back(); // Close bottom sheet
                  },
                  color: Colors.red,
                  buttonText: "Pay at Counter",
                ),
              ],
            ),
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
    );
  }
}

Future<String> createOrderInRazorpay(int amount1) async {
  print('its working $amount1');
  try {
    final response = await http.post(
      Uri.parse("https://rbjewellers.vercel.app/api/create-order"),
      body: json.encode({"amount": int.parse(amount1.toString())}),
    );
    var data = jsonDecode(response.body.toString());

    print('response.statusCode>> ${response.statusCode}');
    print('data >> ${data}');
    if (response.statusCode == 200) {
      return data['orderId'];
    } else {
      return 'error';
    }
  } catch (e) {
    print('exception 123>> $e');
    return 'error';
  }
}

/// Calculates the next installment date for Golden Assurance according to business rules:
/// - Anchored strictly to [startDate.day].
/// - Rule 13: If opened on the 29th, 30th, or 31st, clamped to 28th of every month.
/// - Clamps day to the last valid day of the target month (e.g. Feb 28/29, Apr 30).
DateTime getGoldenAssuranceNextInstallmentDate({
  required DateTime startDate,
  required int nextInstallmentNumber,
}) {
  int anchorDay = startDate.day;
  if (anchorDay > 28) {
    anchorDay = 28;
  }

  int totalMonths = startDate.month + nextInstallmentNumber;
  int targetYear = startDate.year + ((totalMonths - 1) ~/ 12);
  int targetMonth = ((totalMonths - 1) % 12) + 1;

  int maxDaysInMonth = DateTime(targetYear, targetMonth + 1, 0).day;
  int clampedDay = anchorDay > maxDaysInMonth ? maxDaysInMonth : anchorDay;

  return DateTime(targetYear, targetMonth, clampedDay);
}

