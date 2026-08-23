import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_button_widget.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_dialogs.dart';
import 'package:rb_jewellers/app/presentation/widgets/app_text_field.dart';
import 'package:rb_jewellers/authentication/domain/user.dart';
import 'package:rb_jewellers/authentication/presentation/widget/phone_number_form.dart';
import 'package:rb_jewellers/home/infrastructure/home_repository.dart';
import 'package:rb_jewellers/home/presentation/gold_price_view.dart';
import 'package:rb_jewellers/investements/presentation/investment_screen.dart';
import 'package:rb_jewellers/products/application/bloc/product_bloc.dart';
import 'package:rb_jewellers/products/infrastructure/product_repository.dart';
import 'package:rb_jewellers/products/presentation/search_screen.dart';
import 'package:rb_jewellers/profile/presentation/screen/guestProfile_screen.dart';
import 'package:rb_jewellers/profile/presentation/screen/profile_view_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../calculator/application/bloc/calculator_bloc.dart';
import '../../calculator/infrastructure/gold_repository.dart';
import '../../calculator/presentation/calculator_screen.dart';
import '../../products/presentation/product_category_grid_view.dart';

import '../../profile/presentation/screen/contact_screen.dart';
import '../application/bloc/home_bloc.dart';
import '../domain/events.dart';
import '../infrastructure/EventsRepository.dart';
import 'WishList.dart';
import 'banner_widget.dart';
import 'coupons_screen.dart';
import 'notification_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenWidth, 60),
        child: HomeScreenAppBar(),
      ),
      body: const NavScreens(),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}

class HomeScreenAppBar extends StatelessWidget {
  HomeScreenAppBar({
    super.key,
    this.isFromHome = true,
    this.title,
  });

  final bool isFromHome;
  final String? title;
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.isSearching != current.isSearching,
      builder: (context, state) {
        final productBloc = BlocProvider.of<ProductBloc>(context);
        return AppBar(
          backgroundColor: isFromHome ? backgroundColor : secondaryColor,
          leading: !isFromHome
              ? Material(
                  color: secondaryColor,
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: primaryColor,
                    ),
                  ),
                )
              : null,
          actions: [
            if (isFromHome)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/logo/LOGO.png'),
              ),
            if (!state.isSearching) ...[
              if (title != null)
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    title!,
                    style: titleText,
                  ),
                ),
              const Spacer(),
            ],

            state.isSearching
                ? Expanded(
                    child: AppTextField(
                    controller: _searchController,
                    onChangedCallBack: (text) {
                      productBloc.add(
                        ProductEvent.search(text),
                      );
                    },
                    suffixWidget: IconButton(
                      onPressed: () {
                        _searchController.clear();
                        productBloc.add(
                          const ProductEvent.search(''),
                        );
                        // context.read<HomeBloc>().add(
                        //       const HomeEvent.isSearching(),
                        //     );
                      },
                      icon: Icon(
                        Icons.close,
                        color: primaryAccentColor,
                        size: 30,
                      ),
                    ),
                  ))
                : Container(),
            // if (!state.isSearching)
            IconButton(
              onPressed: () {
                _searchController.clear();
                productBloc.add(
                  const ProductEvent.search(''),
                );
                context.read<HomeBloc>().add(const HomeEvent.isSearching());
              },
              icon: Icon(
                state.isSearching ? Icons.close : Icons.search,
                color: primaryColor,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.to(
                  () => CouponsScreen(
                      userId: AppUser.uniqueId,
                      code: AppUser.couponCode,
                      couponRedeemed: AppUser.couponRedeemed ?? true
                          ? 'Redeemed'
                          : 'Available'),
                );
                /*AppDialogs.setMessageDialog(
                  '${AppUser.couponCode}',
                  buttonText: AppUser.couponRedeemed ?? true ? 'Redeemed' : 'Redeem',
                  buttonCallBack: () {
                    final profileBloc = BlocProvider.of<ProfileBloc>(context);
                    profileBloc.add(
                      const ProfileEvent.getUser(),
                    );
                  },
                  isCouponCard: true,
                );*/
              },
              icon: Icon(
                Icons.discount,
                color: primaryColor,
                size: 24,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () async {
                Get.to(
                  () => WishList(
                    productBloc: productBloc,
                  ),
                );
              },
              child: Image.asset(
                'assets/icons/ic_heart_fill.png',
                width: 22,
                height: 22,
                color: Colors.white,
              ),
            ),

            const SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () async {
                Get.to(
                  () => const NotificationScreen(),
                );
              },
              child: Image.asset(
                'assets/icons/ic_notification_bell.png',
                width: 22,
                height: 22,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        );
      },
    );
  }
}

class NavScreens extends StatefulWidget {
  const NavScreens({super.key});

  @override
  State<NavScreens> createState() => _NavScreensState();
}

class _NavScreensState extends State<NavScreens> {
  late Future<SharedPreferences> _prefsFuture;

  @override
  void initState() {
    super.initState();
    _prefsFuture = SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: _prefsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final bool isAnon = snapshot.data!.getBool("isAnonymous") ?? false;

          return BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) =>
                previous.selectedIndex != current.selectedIndex ||
                previous.isSearching != current.isSearching,
            builder: (context, state) {
              return Container(
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/bg_image.jpg'),
                      opacity: .5,
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: state.isSearching
                      ? const SearchScreen()
                      : IndexedStack(
                          index: state.selectedIndex,
                          children: Platform.isAndroid
                              ? [
                                  const HomeWidget(), // 0
                                  const ProductCategoryGridView(), // 1
                                  const CalculatorScreen(), // 2
                                  const InvestmentScreen(), // 3
                                  isAnon
                                      ? const GuestProfileViewScreen()
                                      : const ProfileViewScreen(), // 4
                                  const ContactUsScreen(), // 5
                                ]
                              : [
                                  const HomeWidget(), // 0
                                  const ProductCategoryGridView(), // 1
                                  const CalculatorScreen(), // 2
                                  isAnon
                                      ? const GuestProfileViewScreen()
                                      : const ProfileViewScreen(), // 3
                                  const ContactUsScreen(), // 4
                                  Container(), // Fallback
                                ],
                        ));
            },
          );
        });
  }
}

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: primaryColor,
          selectedItemColor: primaryAccentColor,
          unselectedItemColor: primaryAccentColor.shade300,
          unselectedLabelStyle: smallTextDark,
          iconSize: 30,
          elevation: 5,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            const BottomNavigationBarItem(
              activeIcon: NavBarItem(
                isActive: true,
                icon: Icons.home_outlined,
                label: 'Home',
              ),
              icon: NavBarItem(
                icon: Icons.home_outlined,
                label: 'Home',
              ),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              activeIcon: NavBarItem(
                isActive: true,
                icon: Icons.grid_view_outlined,
                label: 'Categories',
              ),
              icon: NavBarItem(
                icon: Icons.grid_view_outlined,
                label: 'Categories',
              ),
              label: 'Categories',
            ),
            const BottomNavigationBarItem(
              activeIcon: NavBarItem(
                isActive: true,
                icon: Icons.calculate_outlined,
                label: 'Calculator',
              ),
              icon: NavBarItem(
                icon: Icons.calculate_outlined,
                label: 'Calculator',
              ),
              label: 'Calculator',
            ),
            if (Platform.isAndroid)
              const BottomNavigationBarItem(
                activeIcon: NavBarItem(
                  isActive: true,
                  icon: Icons.account_balance_wallet_outlined,
                  label: 'Samriddhi',
                ),
                icon: NavBarItem(
                  icon: Icons.account_balance_wallet_outlined,
                  label: 'Samriddhi',
                ),
                label: 'Samriddhi',
              ),
            const BottomNavigationBarItem(
              activeIcon: NavBarItem(
                isActive: true,
                icon: Icons.person_outline,
                label: 'Profile',
              ),
              icon: NavBarItem(
                icon: Icons.person_outline,
                label: 'Profile',
              ),
              label: 'Profile',
            ),
            const BottomNavigationBarItem(
              activeIcon: NavBarItem(
                isActive: true,
                icon: Icons.contact_emergency,
                label: 'Contact us',
              ),
              icon: NavBarItem(
                icon: Icons.contact_emergency,
                label: 'Contact us',
              ),
              label: 'Contact us',
            ),
          ],
          type: BottomNavigationBarType.fixed,

          currentIndex: state.selectedIndex,
          // Keep track of the selected index
          onTap: (int index) {
            context.read<HomeBloc>().add(HomeEvent.selectedIndex(index));
            if (index == 2) {
              context
                  .read<CalculatorBloc>()
                  .add(const CalculatorEvent.calculateGoldPrice(''));
              context
                  .read<CalculatorBloc>()
                  .add(const CalculatorEvent.calculateGoldQuantity(''));
            }
          },
        );
      },
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    this.isActive = false,
  });

  final bool isActive;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 70,
          width: screenWidth / 5,
        ),
        // Curved bar above the icon
        if (isActive)
          Container(
            width: 50, // Width of the curved bar
            height: 10, // Height of the curved bar
            decoration: BoxDecoration(
              color: backgroundColor, // Color of the curved bar
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20), // Adjust for curvature
              ),
            ),
          ),
        // Icon
        Positioned(
          bottom: 12,
          top: 0,
          child: Icon(
            icon,
            color: isActive ? secondaryAccentColor : null,
          ),
          // Image.asset(
          //   'assets/icons/$icon',
          //   width: 30,
          // ),
        ),
        Positioned(
          bottom: 4,
          child: Text(
            label,
            style: isActive
                ? smallTextBold.copyWith(
                    color: secondaryAccentColor,
                  )
                : smallTextDark,
          ),
        )
      ],
    );
  }
}

class HomeCategorySelector extends StatelessWidget {
  const HomeCategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (p, c) => p.selectedCategory != c.selectedCategory,
      builder: (context, state) {
        return SizedBox(
          width: screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: AppButtonWidget(
                  color: state.selectedCategory == 'Gold'
                      ? secondaryColor
                      : primaryColor,
                  enableBorder: state.selectedCategory == 'Gold' ? false : true,
                  borderRadius: 25,
                  buttonText: 'Gold',
                  textStyle: largeTextBold.copyWith(
                    color: state.selectedCategory == 'Gold'
                        ? primaryColor
                        : primaryAccentColor,
                  ),
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const HomeEvent.selectedCategory('Gold'));
                  },
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: AppButtonWidget(
                  color: state.selectedCategory == 'Diamond'
                      ? secondaryColor
                      : primaryColor,
                  buttonTextColor: state.selectedCategory == 'Diamond'
                      ? primaryColor
                      : primaryAccentColor,
                  enableBorder:
                      state.selectedCategory == 'Diamond' ? false : true,
                  borderRadius: 25,
                  buttonText: 'Diamond',
                  textStyle: largeTextBold.copyWith(
                    color: state.selectedCategory == 'Diamond'
                        ? primaryColor
                        : primaryAccentColor,
                  ),
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const HomeEvent.selectedCategory('Diamond'));
                  },
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: AppButtonWidget(
                  color: state.selectedCategory == 'Silver'
                      ? secondaryColor
                      : primaryColor,
                  buttonTextColor: state.selectedCategory == 'Silver'
                      ? primaryColor
                      : primaryAccentColor,
                  enableBorder:
                      state.selectedCategory == 'Silver' ? false : true,
                  borderRadius: 25,
                  buttonText: 'Silver',
                  textStyle: largeTextBold.copyWith(
                    color: state.selectedCategory == 'Silver'
                        ? primaryColor
                        : primaryAccentColor,
                  ),
                  onTap: () {
                    context
                        .read<HomeBloc>()
                        .add(const HomeEvent.selectedCategory('Silver'));
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
  });

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with WidgetsBindingObserver {
  static bool _isPopupOpen = false;
  // late Timer _timer;
  Duration _remaining = Duration.zero;
  VideoPlayerController? _controller;
  YoutubePlayerController? _ytController;
  bool isYoutube = false;

  late final DateTime expiryDate;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Call after UI is built, but only if needed
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      checkAndRequestNotificationPermission(context);
      await getDataFromFirebase(context);
    });
  }

  Future<void> checkAndRequestNotificationPermission(
      BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final hasAsked = prefs.getBool('notification_permission_asked') ?? false;

    // Only check again if not asked before
    if (!hasAsked) {
      await requestNotificationPermission(context);
      await prefs.setBool('notification_permission_asked', true);
    } else {
      print("ℹ️ Notification permission already handled before, skipping.");
    }
  }

  Future<void> requestNotificationPermission(BuildContext context) async {
    if (Platform.isAndroid) {
      // ---- ANDROID ----
      final statuses = await [Permission.notification].request();
      final permission = statuses[Permission.notification];

      if (permission == PermissionStatus.granted) {
        print("✅ Android: Notification permission granted!");
      } else if (permission == PermissionStatus.denied) {
        print("❌ Android: Notification permission denied!");
      } else if (permission == PermissionStatus.permanentlyDenied) {
        print("⚠️ Android: Permission permanently denied! Opening settings...");
        await openAppSettings();
      }
    } else if (Platform.isIOS) {
      // ---- iOS ----
      print("📱 Requesting iOS notification permission...");
      final settings = await FirebaseMessaging.instance.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      switch (settings.authorizationStatus) {
        case AuthorizationStatus.authorized:
          print("✅ iOS: Notification permission granted!");
          break;
        case AuthorizationStatus.denied:
          print("❌ iOS: Notification permission denied!");
          break;
        case AuthorizationStatus.provisional:
          print("⚠️ iOS: Provisional permission granted (limited alerts).");
          break;
        default:
          print("⚠️ iOS: Notification permission not determined.");
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (_controller != null && _controller!.value.isInitialized) {
      if (state == AppLifecycleState.paused ||
          state == AppLifecycleState.inactive) {
        if (_controller!.value.isPlaying) {
          _controller!.pause();
        }
      } else if (state == AppLifecycleState.resumed) {
        _controller!.play();
      }
    }
    if (_ytController != null) {
      if (state == AppLifecycleState.paused ||
          state == AppLifecycleState.inactive) {
        if (_ytController!.value.isPlaying) {
          _ytController!.pause();
        }
      } else if (state == AppLifecycleState.resumed) {
        _ytController!.play();
      }
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    if (_controller != null) {
      _controller!.dispose();
    }
    if (_ytController != null) {
      _ytController!.dispose();
    }
    super.dispose();
  }

  String formatDuration(Duration duration) {
    final days = duration.inDays;
    final hours = duration.inHours % 24;
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;

    // return "$days days $hours hrs $minutes min $seconds sec";
    return "$days days $hours hrs $minutes min";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          final productBloc = BlocProvider.of<ProductBloc>(context);
          return RefreshIndicator(
            onRefresh: () async {
              productBloc.add(const ProductEvent.getProductCategories());
              // return Future.value();
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  thickSpace,
                  const BannerWidget(),
                  thickSpace,
                  thickSpace,
                  thickSpace,
                  const GoldPriceBannerHome(
                    isFromHome: true,
                  ),
                  thickSpace,
                  thickSpace,
                  const HomeCategorySelector(),
                  ProductCategoryGridView(
                    isFromHome: true,
                    sexCategory: state.selectedCategory,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showImagePopup(BuildContext context, Duration remaining, Eventss last) {
    if (_isPopupOpen) return;
    _isPopupOpen = true;
    print('_showImagePopup');
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismiss on outside tap
      barrierColor: Colors.black.withOpacity(0.5), // Background overlay color
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white, // Dialog background
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(last.name.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(formatDuration(remaining),
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                last.graphicType.toString() == 'Video'
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 1.5,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(16.0)),
                            child: VideoPlayer(_controller!)),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        // height: MediaQuery.of(context).size.height / 1.5,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          child: Image.network(
                            last.imageLink,
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text("⚠️ Failed to load image");
                            },
                          ),
                        ),
                      ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("Close",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      _isPopupOpen = false;
    });
  }

  void _showVideoPopup(BuildContext context, Duration remaining, Eventss last) {
    if (_isPopupOpen) return;
    _isPopupOpen = true;
    print('_showVideoPopup');
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismiss on outside tap
      barrierColor: Colors.black.withOpacity(0.5), // Background overlay color
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white, // Dialog background
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(last.name.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(formatDuration(remaining),
                    style: const TextStyle(fontSize: 18)),
                const SizedBox(height: 20),
                last.graphicType.toString() == 'Video' &&
                        (_controller != null || _ytController != null)
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 4,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          child: isYoutube && _ytController != null
                              ? YoutubePlayer(
                                  controller: _ytController!,
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: secondaryColor,
                                )
                              : ValueListenableBuilder(
                                  valueListenable: _controller!,
                                  builder:
                                      (context, VideoPlayerValue value, child) {
                                    if (value.isInitialized) {
                                      return VideoPlayer(_controller!);
                                    } else if (value.hasError) {
                                      return const Center(
                                          child: Text("Error loading video"));
                                    } else {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                        ),
                      )
                    : Container(),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    try {
                      if (_controller != null &&
                          _controller!.value.isInitialized) {
                        _controller!.pause();
                      }
                      if (_ytController != null) {
                        _ytController!.pause();
                      }
                    } catch (e) {
                      debugPrint("Error pausing video: $e");
                    }
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Text("Close",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).then((_) {
      _isPopupOpen = false;
    });
  }

  Future getDataFromFirebase(BuildContext context) async {
    log('ssssssssssssssssssssssxxxxxxxxxxxsssssssssssssssssssssssssssss');

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isPopup = prefs.getBool("isPopup");

    if (isPopup == true) {
      EventRepository repo = EventRepository();

      List<Eventss> events = await repo.fetchEvents();

      log('sssssssssssssssssssssssssssssssssssssssssssssssssss - inside');
      log('length--------------${events.length.toString()}');
      log('link--------------${events.last.videoLink.toString()}');
      log('type--------------${events.last.graphicType.toString()}');

      if (!mounted || events.isEmpty) return;
      if (events.last.graphicType.toString() == 'Video') {
        // for video
        String videoLink = events.last.videoLink.toString() ?? '';
        isYoutube =
            videoLink.contains('youtube.com') || videoLink.contains('youtu.be');

        if (isYoutube) {
          String? videoId = YoutubePlayer.convertUrlToId(videoLink);
          if (videoId != null) {
            _ytController = YoutubePlayerController(
              initialVideoId: videoId,
              flags: const YoutubePlayerFlags(
                autoPlay: true,
                loop: true,
                hideControls: true,
              ),
            );
            if (!mounted) return;
            setState(() {});
          }
        } else {
          _controller = VideoPlayerController.networkUrl(
            Uri.parse(videoLink),
          )..initialize().then((_) {
              if (!mounted) return;
              setState(() {});
              _controller!.play();
              _controller!.setLooping(true);
            });
        }
      }
      // count down
      expiryDate = DateTime.parse(events.last.expDate.toString());
      // _calculateRemaining();
      final now = DateTime.now();
      final difference = expiryDate.difference(now);

      _remaining = difference.isNegative ? Duration.zero : difference;

      // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      //   _calculateRemaining();
      // });

      // Delay to ensure the home screen is fully loaded and visible before showing the popup
      await Future.delayed(const Duration(seconds: 2));

      if (!mounted) return;
      if (events.last.graphicType.toString() == 'Video') {
        _showVideoPopup(context, _remaining, events.last);
      } else {
        _showImagePopup(context, _remaining, events.last);
      }

      final SharedPreferences prefs2 = await SharedPreferences.getInstance();
      await prefs2.setBool("isPopup", false);
    }
  }

// _imagefromGallery(context, HomeBloc homeBloc) async {
//   final ImagePicker picker = ImagePicker();

//   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//   if (image != null) {
//     File file = File(image.path);
//     homeBloc.add(HomeEvent.uploadBanner(file));
//   }
//   Get.back();
// }

// _imagefromCamera(context, HomeBloc homeBloc) async {
//   final ImagePicker picker = ImagePicker();
//   final XFile? photo = await picker.pickImage(source: ImageSource.camera);
//   if (photo != null) {
//     File file = File(photo.path);
//     homeBloc.add(HomeEvent.uploadBanner(file));
//   }
//   Get.back();
// }

// _showpicker(context, HomeBloc homeBloc) {
//   showModalBottomSheet(
//       shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
//       backgroundColor: primaryBGColor,
//       context: context,
//       builder: (context) {
//         return SizedBox(
//           height: 100,
//           child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     SizedBox(width: screenWidth * 0.1),
//                     CircleAvatar(
//                       radius: 24,
//                       backgroundColor: primaryColor,
//                       child: IconButton(
//                         onPressed: () {
//                           _imagefromCamera(context, homeBloc);
//                         },
//                         icon: const Icon(Icons.camera_alt_rounded,
//                             color: Colors.black54),
//                         iconSize: 30,
//                       ),
//                     ),
//                     Text(
//                       "Camera",
//                       style: standardText.copyWith(color: primaryColor),
//                     ),
//                   ],
//                 ),
//                 SizedBox(width: screenWidth * 0.08),
//                 Column(
//                   children: [
//                     CircleAvatar(
//                       radius: 24,
//                       backgroundColor: primaryColor,
//                       child: IconButton(
//                         onPressed: () {
//                           _imagefromGallery(context, homeBloc);
//                         },
//                         icon: const Icon(Icons.photo),
//                         color: Colors.black54,
//                         iconSize: 30,
//                       ),
//                     ),
//                     Text(
//                       "Gallery",
//                       style: standardText.copyWith(color: primaryColor),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }
}
