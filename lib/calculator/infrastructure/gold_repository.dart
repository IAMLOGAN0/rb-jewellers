import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/calculator/domain/gold_price.dart';
import 'package:rb_jewellers/calculator/infrastructure/gold_price_dto.dart';

import '../domain/i_gold_price_repository.dart';

class GoldRepository implements IGoldRepository {
  final CollectionReference _goldPrice =
      FirebaseFirestore.instance.collection('gold_price');

  @override
  Future<Either<AppFailures, GoldPrice>> getGoldPrice() async {
    try {
      final QuerySnapshot snapshot = await _goldPrice.get();
      // Convert the query results to Banners objects
      final GoldPriceDto goldPrice =
          GoldPriceDto.fromFirestore(snapshot.docs.single);
      return right(goldPrice.toDomain());
    } catch (e) {
      return handleException(e);
    }
  }
}
