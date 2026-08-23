import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/authentication/domain/user.dart';
import 'package:rb_jewellers/investements/domain/golden_secure.dart';
import 'package:rb_jewellers/investements/domain/pay_offline.dart';
import 'package:rb_jewellers/investements/infrastructure/dto/golden_secure_dto.dart';
import 'package:rb_jewellers/investements/infrastructure/dto/pay_offline_dto.dart';

import '../domain/easy_gold_savings_plan.dart';
import '../domain/future_gold_savings_plan.dart';
import '../domain/i_investment_repository.dart';
import 'dto/easy_gold_savings_plan_dto.dart';
import 'dto/future_gold_savings_plan_dto.dart';

class InvestmentRepository implements IInvestmentRepository {
  final CollectionReference _easyGoldSavingsPlan =
      FirebaseFirestore.instance.collection('easy_gold_savings_plan');

  final CollectionReference _futureGoldSavingsPlan =
      FirebaseFirestore.instance.collection('future_gold_savings_plan');

  final CollectionReference _futureGoldSavingsPlan1 =
      FirebaseFirestore.instance.collection('gold_booking_confirmation');

  final CollectionReference _goldenSecure =
      FirebaseFirestore.instance.collection('golden_secure_plan');

  final CollectionReference _paymentRequest =
      FirebaseFirestore.instance.collection('payment_request');

  final CollectionReference _goldenSecurePaymentRequest =
      FirebaseFirestore.instance.collection('golden_secure_request');

  @override
  Future<Either<AppFailures, Unit>> createEasyGoldSavingsPlan(
      EasyGoldSavingsPlan easyGoldSavingsPlan) async {
    try {
      // Fetch the latest planId
      final querySnapshot = await _easyGoldSavingsPlan
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

      // Ensure the planId is unique (optional redundancy)
      final existingPlan = await _easyGoldSavingsPlan
          .where('planId', isEqualTo: newPlanId)
          .get();

      if (existingPlan.docs.isNotEmpty) {
        return left(const AppFailures.failureWithMessage(
            'Plan ID generation conflict. Please try again.'));
      }

      // Copy the domain object with the new planId
      final updatedPlan = easyGoldSavingsPlan.copyWith(planId: newPlanId);

      // Create DTO from the updated domain model
      final planDto = EasyGoldSavingsPlanDto.fromDomain(updatedPlan.copyWith(
        transactionHistory: [
          updatedPlan.transactionHistory.first.copyWith(planId: newPlanId)
        ],
      ));

      // Save the plan DTO to Firestore
      await _easyGoldSavingsPlan.doc(newPlanId).set(planDto.toJson());

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, List<EasyGoldSavingsPlan>>>
      getEasyGoldSavingsPlans() async {
    final userId = AppUser.uniqueId.getOrCrash();

    try {
      final QuerySnapshot snapshot = await _easyGoldSavingsPlan
          .where('userId', isEqualTo: userId) // Filter by userId
          .get();

      // Convert the query results to EasyGoldSavingsPlan objects
      final List<EasyGoldSavingsPlan> plans = snapshot.docs.map((doc) {
        final planDto = EasyGoldSavingsPlanDto.fromFirestore(doc);
        return planDto.toDomain();
      }).toList();

      return right(plans);
    } catch (e) {
      print('Exception $e');
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, Unit>>
      updateTransactionHistoryForEasyGoldSavingsPlans(
          EasyGoldSavingsPlan easyGoldSavingsPlan) async {
    try {
      final docId = easyGoldSavingsPlan.id;

      // Fetch the document from Firestore
      final DocumentSnapshot snapshot =
          await _easyGoldSavingsPlan.doc(docId).get();

      if (!snapshot.exists) {
        return left(
            const AppFailures.failureWithMessage('Savings plan not found.'));
      }

      final planDto = EasyGoldSavingsPlanDto.fromDomain(
          easyGoldSavingsPlan.copyWith(id: ''));
      await _easyGoldSavingsPlan.doc(docId).update(planDto.toJson());

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, Unit>> createFutureGoldSavingsPlan(
      FutureGoldSavingsPlan futureGoldSavingsPlan) async {
    try {
      // Fetch the latest planId
      final querySnapshot = await _futureGoldSavingsPlan
          .orderBy('planId', descending: true)
          .limit(1)
          .get();

      // Determine the next sequential planId
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

      // Ensure the planId is unique (optional redundancy)
      final existingPlan = await _futureGoldSavingsPlan
          .where('planId', isEqualTo: newPlanId)
          .get();

      if (existingPlan.docs.isNotEmpty) {
        return left(const AppFailures.failureWithMessage(
            'Plan ID generation conflict. Please try again.'));
      }

      // Copy the domain object with the new planId
      final updatedPlan = futureGoldSavingsPlan.copyWith(planId: newPlanId);

      // Create DTO from the updated domain model
      final planDto = FutureGoldSavingsPlanDto.fromDomain(
        updatedPlan.copyWith(
          transactionHistory: [
            updatedPlan.transactionHistory.first.copyWith(planId: newPlanId)
          ],
        ),
      );

      // Save the plan DTO to Firestore
      await _futureGoldSavingsPlan.doc(newPlanId).set(planDto.toJson());

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, List<FutureGoldSavingsPlan>>>
      getFutureGoldSavingsPlans() async {
    final userId = AppUser.uniqueId.getOrCrash();
    try {
      final QuerySnapshot snapshot = await _futureGoldSavingsPlan
          .where('userId', isEqualTo: userId) // Filter by userId
          .get();

      final List<FutureGoldSavingsPlan> plans = snapshot.docs.map((doc) {
        final planDto = FutureGoldSavingsPlanDto.fromFirestore(doc);
        return planDto.toDomain();
      }).toList();

      return right(plans);
    } catch (e) {
      print('yehi h $e');
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, Unit>>
      updateTransactionHistoryForFutureGoldSavingsPlans(
          FutureGoldSavingsPlan futureGoldSavingsPlan) async {
    try {
      final docId = futureGoldSavingsPlan.id;

      final DocumentSnapshot snapshot =
          await _futureGoldSavingsPlan.doc(docId).get();

      if (!snapshot.exists) {
        return left(const AppFailures.failureWithMessage(
            'Future savings plan not found.'));
      }

      final planDto = FutureGoldSavingsPlanDto.fromDomain(
          futureGoldSavingsPlan.copyWith(id: ''));
      await _futureGoldSavingsPlan.doc(docId).update(planDto.toJson());

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, Unit>> bookGoldPricrForFutureGoldSavingsPlans1(
      FutureGoldSavingsPlan futureGoldSavingsPlan) async {
    try {
      final docId = futureGoldSavingsPlan.id;
      final DocumentSnapshot snapshot =
          await _futureGoldSavingsPlan.doc(docId).get();

      if (!snapshot.exists) {
        return left(const AppFailures.failureWithMessage(
            'Future savings plan not found.'));
      }

      final planDto = FutureGoldSavingsPlanDto.fromDomain(
          futureGoldSavingsPlan.copyWith(id: ''));
      await _futureGoldSavingsPlan.doc(docId).update(planDto.toJson());

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, Unit>> bookGoldPricrForFutureGoldSavingsPlans(
      FutureGoldSavingsPlan futureGoldSavingsPlan) async {
    try {
      final planDto = FutureGoldSavingsPlanDto.fromDomain(
          futureGoldSavingsPlan.copyWith(id: ''));
      await _futureGoldSavingsPlan1.add(planDto.toJson());

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, Unit>> payOffline(PayOffline data) async {
    try {
      final paymentRequest = PayOfflineDto.fromDomain(data.copyWith(id: ''));
      if (data.planName == 'Golden Secure ') {
        _goldenSecurePaymentRequest.add(paymentRequest.toJson());
      } else {
        await _paymentRequest.add(paymentRequest.toJson());
      }

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, Unit>> createGoldenSecure(
      GoldenSecure goldenSecure) async {
    try {
      // Fetch the latest planId
      final querySnapshot = await _goldenSecure
          .orderBy('planId', descending: true)
          .limit(1)
          .get();

      // Determine the next sequential planId
      String newPlanId;
      if (querySnapshot.docs.isNotEmpty) {
        final latestPlanId = querySnapshot.docs.first['planId'] as String;
        final latestNumber = int.parse(latestPlanId.split('-').last);
        final nextNumber = latestNumber + 1;
        newPlanId = 'INVRBGS-${nextNumber.toString().padLeft(4, '0')}';
      } else {
        newPlanId = 'INVRBGS-0001';
      }

      // Ensure the planId is unique
      final existingPlan =
          await _goldenSecure.where('planId', isEqualTo: newPlanId).get();
      if (existingPlan.docs.isNotEmpty) {
        return left(const AppFailures.failureWithMessage(
            'Plan ID generation conflict. Please try again.'));
      }

      // Copy domain object with new planId
      final updatedPlan = goldenSecure.copyWith(planId: newPlanId);

      // Create DTO
      final planDto = GoldenSecureDto.fromDomain(
        updatedPlan.copyWith(
            // transactionHistory: [
            //   updatedPlan.transactionHistory!.first.copyWith(planId: newPlanId),
            // ],
            ),
      );

      // Save to Firestore
      await _goldenSecure.doc(newPlanId).set(planDto.toJson());

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, List<GoldenSecure>>> getGoldenSecure() async {
    final userId = AppUser.uniqueId.getOrCrash();
    try {
      final QuerySnapshot snapshot =
          await _goldenSecure.where('userId', isEqualTo: userId).get();

      final List<GoldenSecure> plans = snapshot.docs.map((doc) {
        final planDto = GoldenSecureDto.fromFirestore(doc);
        return planDto.toDomain();
      }).toList();

      return right(plans);
    } catch (e) {
      return handleException(e);
    }
  }

  @override
  Future<Either<AppFailures, Unit>> updateTransactionHistoryForGoldenSecure(
      GoldenSecure goldenSecure) async {
    try {
      final docId = goldenSecure.id;

      final DocumentSnapshot snapshot = await _goldenSecure.doc(docId).get();

      if (!snapshot.exists) {
        return left(const AppFailures.failureWithMessage(
            'Golden Secure plan not found.'));
      }

      final planDto = GoldenSecureDto.fromDomain(goldenSecure.copyWith(id: ''));
      await _goldenSecure.doc(docId).update(planDto.toJson());

      return right(unit);
    } catch (e) {
      return handleException(e);
    }
  }
}
