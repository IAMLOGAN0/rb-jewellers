import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/banners.dart';

part 'banners_dto.freezed.dart';
part 'banners_dto.g.dart';

@freezed
abstract class BannersDto with _$BannersDto {
  const BannersDto._();
  const factory BannersDto({
    required String id,
    required String bannerUrl,
    required String url,
  }) = _BannersDto;

  factory BannersDto.fromJson(Map<String, dynamic> json) =>
      _$BannersDtoFromJson(json);

  factory BannersDto.fromDomain(Banners photo) {
    return BannersDto(
      id: '', // Empty string for now since Firebase will generate the ID
      bannerUrl: photo.bannerUrl,
      url: photo.url,
    );
  }

  factory BannersDto.fromFirestore(DocumentSnapshot doc) {
    return BannersDto.fromJson(doc.data() as Map<String, dynamic>)
        .copyWith(id: doc.id);
  }

  Banners toDomain() {
    return Banners(
      id: id,
      bannerUrl: bannerUrl,
      url: url,
    );
  }
}
