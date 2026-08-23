import 'package:connection_notifier/connection_notifier.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upgrader/upgrader.dart';

import 'app/presentation/screens/splash_screen.dart';
import 'authentication/application/auth_bloc/auth_bloc.dart';
import 'authentication/infrastructure/auth/firebase_auth_facade.dart';
import 'firebase_options.dart';
import 'notification/fcm.dart';
import 'notification/notificationcode.dart';
import 'profile/application/bloc/profile_bloc.dart';
import 'profile/infrastructure/profile_repository.dart';
import 'home/application/bloc/home_bloc.dart';
import 'home/infrastructure/home_repository.dart';
import 'products/application/bloc/product_bloc.dart';
import 'products/infrastructure/product_repository.dart';
import 'calculator/application/bloc/calculator_bloc.dart';
import 'calculator/infrastructure/gold_repository.dart';

/// custom url: app-1-932606818423-ios-b01ac746ae708c28166e72

final firebasemessaging = FirebaseMessaging.instance;

Future<void> main() async {
  // FirebaseApi().isDeviceTokenRefresh();

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  FirebaseApi().isDeviceTokenRefresh();

  // Activate app check after initialization, but before
  // usage of any Firebase services.
  await FirebaseAppCheck.instance
      // Your personal reCaptcha public key goes here:
      .activate(
    providerAndroid: const AndroidPlayIntegrityProvider(),
    providerApple: const AppleAppAttestProvider(),
  );

  Future.delayed(const Duration(seconds: 2)).then(
    (value) =>
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
            .then(
      (_) => runApp(
        const RBJewellers(),
      ),
    ),
  );
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class RBJewellers extends StatefulWidget {
  const RBJewellers({super.key});

  @override
  State<RBJewellers> createState() => _RBJewellersState();
}

class _RBJewellersState extends State<RBJewellers> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseApi().initNotification();
    FirebaseApi().isDeviceTokenRefresh();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      NotificationService().firebaseinit(context);
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // setState(() {
      //   hasNotification = true; // Set to true when a notification is received
      // });
      debugPrint('Notification received: ${message.notification?.title}');
      debugPrint('Notification received: ${message.notification?.body}');
      debugPrint(
          'Notification android: ${message.notification?.android?.imageUrl}');
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authFacade: FirebaseAuthFacade())
            ..add(const AuthEvent.authCheckRequested()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(ProfileRepository()),
        ),
        BlocProvider(
          create: (_) =>
              HomeBloc(HomeRepository())..add(const HomeEvent.getBanners()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(ProductRepository())
            ..add(const ProductEvent.getProductCategories()),
        ),
        BlocProvider(
          create: (_) => CalculatorBloc(GoldRepository())
            ..add(const CalculatorEvent.getGoldPrice()),
        ),
      ],
      child: GetMaterialApp(
        builder: (context, child) {
          double designWidth = 1440;
          double designHeight = 3120;

          final mediaQueryData = MediaQuery.of(context);
          double screenWidth = View.of(context).physicalSize.width;
          double screenHeight = View.of(context).physicalSize.height;
          double devicePixelRatio = View.of(context).devicePixelRatio;

          double widthFactor = screenWidth / designWidth;
          double heightFactor = screenHeight / designHeight;
          double scalingFactor =
              widthFactor < heightFactor ? widthFactor : heightFactor;

          return MediaQuery(
              data: mediaQueryData.copyWith(
                  textScaler: TextScaler.linear(
                      scalingFactor < 0.8 ? 0.9 : scalingFactor)),
              child: Container(
                transform: Matrix4.diagonal3Values(1, 1, devicePixelRatio),
                child: ConnectionNotifier(
                  child: UpgradeAlert(
                    showIgnore: false,
                    showLater: false,
                    barrierDismissible: false,
                    shouldPopScope: () => false,
                    upgrader: Upgrader(
                      durationUntilAlertAgain: Duration.zero,
                    ),
                    child: child!,
                  ),
                ),
              ));
        },
        title: 'RB Jewellers',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
          // scaffoldBackgroundColor: backgroundColor,
          brightness: Brightness.light,
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
          dialogTheme: const DialogThemeData(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
          ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
