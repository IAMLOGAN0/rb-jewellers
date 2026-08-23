import 'package:freezed_annotation/freezed_annotation.dart';

part 'gold_price.freezed.dart';

@freezed
abstract class GoldPrice implements _$GoldPrice {
  const GoldPrice._();

  const factory GoldPrice({
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
  }) = _GoldPrice;

  factory GoldPrice.empty() => GoldPrice(
        id: '',
        title: '',
        price24: '',
        price22: '',
        price18: '',
        title24:'',
        title22:'',
        title18:'',
        makingChargesPercent: '',
        gst: '',
        dateTime: DateTime.now(),
      );
}
