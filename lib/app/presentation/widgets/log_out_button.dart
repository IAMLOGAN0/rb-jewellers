import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../authentication/application/auth_bloc/auth_bloc.dart';
import '../../../authentication/infrastructure/auth/firebase_auth_facade.dart';
import '../../../authentication/presentation/screen/sign_in_screen.dart';
import '../../../authentication/presentation/widget/phone_number_form.dart';
import '../../domain/core/constants.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
    this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Text('Logout', style: titleTextBold)),
        ),
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return BlocProvider(
                create: (context) => AuthBloc(authFacade: FirebaseAuthFacade()),
                child: AlertDialog(
                  backgroundColor: backgroundColor,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'LOGOUT',
                        style: titleText,
                      ),
                      thickSpace,
                      Text(
                        'Are you sure want to log out?',
                        style: standardText,
                      ),
                    ],
                  ),
                  actions: [
                    SizedBox(
                      width: screenWidth * 1 / 3.5,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor),
                        child: Text(
                          'Cancel',
                          style: standardTextDarkBold,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return SizedBox(
                          width: screenWidth * 1 / 3.5,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: secondaryColor),
                            onPressed: () {
                              Navigator.pop(context);
                              deleteMatchingUserTokens();
                              context
                                  .read<AuthBloc>()
                                  .add(const AuthEvent.signedOut());


                              Get.offAll(() => const SignInScreen());
                            },
                            child: Text(
                              'Yes',
                              style: standardTextDarkBold,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        });
  }

  Future<void> deleteMatchingUserTokens() async {
    final AuthService _auth = AuthService();
    final user = await _auth.signInAsGuest();

    if (user!.uid.isEmpty) {
      print("User not logged in.");
      return;
    }

    final collection = FirebaseFirestore.instance.collection('user_tokens');

    final snapshot = await collection.get();

    print('snapshot.docs >> ${snapshot.docs}');
    for (var doc in snapshot.docs) {
      final data = doc.data();
      final userId = data['userId'];


      if (userId == user.uid) {
        await collection.doc(doc.id).delete();
        print('✅ Deleted document with ID: ${doc.id}');
      }
    }
  }
}
