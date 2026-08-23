import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/gold_price.dart';

part 'gold_price_dto.freezed.dart';
part 'gold_price_dto.g.dart';

@freezed
abstract class GoldPriceDto with _$GoldPriceDto {
  const GoldPriceDto._();

  const factory GoldPriceDto({
    required String id,
    required String title,
    required String title24,
    required String title22,
    required String title18,
    required String price24,
    required String price22,
    required String price18,
    required String makingChargesPercent,
    required String gst,
    required DateTime dateTime,
  }) = _GoldPriceDto;

  factory GoldPriceDto.fromJson(Map<String, dynamic> json) =>
      _$GoldPriceDtoFromJson(json);

  factory GoldPriceDto.fromDomain(GoldPrice goldPrice) {
    return GoldPriceDto(
      id: '', // Firestore-generated ID, handled later
      title: goldPrice.title,
      title24: goldPrice.title24,
      title22: goldPrice.title22,
      title18: goldPrice.title18,
      price24: goldPrice.price24,
      price22: goldPrice.price22,
      price18: goldPrice.price18,
      makingChargesPercent: goldPrice.makingChargesPercent,
      gst: goldPrice.gst,
      dateTime: goldPrice.dateTime,
    );
  }

  factory GoldPriceDto.fromFirestore(DocumentSnapshot doc) {
    return GoldPriceDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }

  GoldPrice toDomain() {
    return GoldPrice(
      id: id,
      title: title,
      title24: title24,
      title22: title22,
      title18: title18,
      price24: price24,
      price22: price22,
      price18: price18,
      makingChargesPercent: makingChargesPercent,
      gst: gst,
      dateTime: dateTime,
    );
  }
}
