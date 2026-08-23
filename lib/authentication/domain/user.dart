import '../../app/domain/core/value_objects.dart';
import '../../profile/domain/value_objects.dart';

class AppUser {
  static UniqueId uniqueId = UniqueId();
  static StringSingleLine name = StringSingleLine('');
  // static EmailAddress emailAddress = EmailAddress('');
  static String photoUrl = '';
  static PhoneNumber phoneNumber = PhoneNumber('');
  static DateTime? dateOfBirth;
  static String? mariatialStatus;
  static DateTime? anniversaryDate;
  static String? location;
  static String? couponCode;
  static bool? couponRedeemed;
  factory AppUser() => AppUser._internal();
  AppUser._internal();
}
