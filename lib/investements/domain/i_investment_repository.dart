import 'package:dartz/dartz.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/investements/domain/golden_secure.dart';
import 'package:rb_jewellers/investements/domain/pay_offline.dart';

import 'easy_gold_savings_plan.dart';
import 'future_gold_savings_plan.dart';

abstract class IInvestmentRepository {
  Future<Either<AppFailures, Unit>> createEasyGoldSavingsPlan(
      EasyGoldSavingsPlan easyGoldSavingsPlan);

  Future<Either<AppFailures, List<EasyGoldSavingsPlan>>>
      getEasyGoldSavingsPlans();

  Future<Either<AppFailures, Unit>>
      updateTransactionHistoryForEasyGoldSavingsPlans(
          EasyGoldSavingsPlan easyGoldSavingsPlan);

  Future<Either<AppFailures, Unit>> createFutureGoldSavingsPlan(
      FutureGoldSavingsPlan easyGoldSavingsPlan);

  Future<Either<AppFailures, List<FutureGoldSavingsPlan>>>
      getFutureGoldSavingsPlans();

  Future<Either<AppFailures, Unit>>
      updateTransactionHistoryForFutureGoldSavingsPlans(
          FutureGoldSavingsPlan easyGoldSavingsPlan);

  Future<Either<AppFailures, Unit>> createGoldenSecure(
      GoldenSecure goldenSecure);

  Future<Either<AppFailures, List<GoldenSecure>>> getGoldenSecure();

  Future<Either<AppFailures, Unit>> updateTransactionHistoryForGoldenSecure(
      GoldenSecure goldenSecure);

  Future<Either<AppFailures, Unit>> bookGoldPricrForFutureGoldSavingsPlans(
      FutureGoldSavingsPlan futureGoldSavingsPlan);
  Future<Either<AppFailures, Unit>> bookGoldPricrForFutureGoldSavingsPlans1(
      FutureGoldSavingsPlan futureGoldSavingsPlan);

  ///
  Future<Either<AppFailures, Unit>> payOffline(
    PayOffline data,
  );
}
