import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../profile/application/bloc/profile_bloc.dart';
import '../../../profile/infrastructure/profile_repository.dart';
import '../../application/auth_bloc/auth_bloc.dart';
import '../../application/auth_bloc/sign_in_bloc/sign_in_bloc.dart';
import '../../infrastructure/auth/firebase_auth_facade.dart';
import '../widget/verify_phone_number_form.dart';

class VerifyPhoneNumberScreen extends StatelessWidget {
  final String phoneNumber;
  const VerifyPhoneNumberScreen({
    super.key,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(authFacade: FirebaseAuthFacade()),
        ),
        BlocProvider<SignInBloc>(
          create: (context) =>
              SignInBloc()..add(SignInEvent.authenticatePhone(phoneNumber)),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(ProfileRepository())
            ..add(ProfileEvent.phoneNumber(phoneNumber)),
        ),
      ],
      child: VerifyPhoneNumberWidget(
        phoneNumber: phoneNumber,
      ),
    );
  }
}
