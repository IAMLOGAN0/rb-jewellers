import 'package:dartz/dartz.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/calculator/domain/gold_price.dart';

abstract class IGoldRepository {
  Future<Either<AppFailures, GoldPrice>> getGoldPrice();
}
