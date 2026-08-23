import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

import '../../domain/i_auth_facade.dart';
import '../../domain/user.dart';
import 'firebase_user_mapper.dart';

class FirebaseAuthFacade implements IAuthFacade {
  final FirebaseUserMapper _firebaseUserMapper = FirebaseUserMapper();

  FirebaseAuthFacade();

  @override
  Future<Option<AppUser>> getSignedInUser() async {
    final user = firebase.FirebaseAuth.instance.currentUser;

    return optionOf(_firebaseUserMapper.toDomain(user));
  }

  @override
  Future<List<void>> signOut() async {
    return Future.wait([
      firebase.FirebaseAuth.instance.signOut(),
    ]);
  }

  // Future<void> deleteDatabase() async {
  //   await Hive.deleteBoxFromDisk('encryptedBox');
  // }
}
