import 'package:dartz/dartz.dart';

import 'user.dart';

abstract class IAuthFacade {
  Future<Option<AppUser>> getSignedInUser();
  Future<void> signOut();
}
