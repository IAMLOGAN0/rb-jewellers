import 'package:freezed_annotation/freezed_annotation.dart';

part 'banners.freezed.dart';

@freezed
abstract class Banners implements _$Banners {
  const Banners._();

  const factory Banners({
    required String id,
    required String bannerUrl,
    required String url,
  }) = _Banners;

  factory Banners.empty() => const Banners(
        id: '',
        bannerUrl: '',
        url: '',
      );
}
