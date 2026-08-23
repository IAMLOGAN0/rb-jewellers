import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../../app/domain/core/value_objects.dart';
import '../../../profile/domain/value_objects.dart';
import '../../domain/user.dart';

class FirebaseUserMapper {
  AppUser? toDomain(firebase.User? _) {
    if (_ == null) {
      return null;
    } else {
      AppUser.uniqueId = UniqueId.fromUniqueString(_.uid);
      AppUser.name = StringSingleLine(_.displayName ?? '');
      // AppUser.emailAddress = EmailAddress(_.email ?? '');
      AppUser.phoneNumber = PhoneNumber(_.phoneNumber ?? '');
      AppUser.photoUrl = _.photoURL ?? '';
      return AppUser();
    }
  }
}
