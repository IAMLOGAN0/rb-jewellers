import 'dart:ui';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rb_jewellers/app/domain/core/constants.dart';
import 'package:rb_jewellers/app/presentation/widgets/common_result_empty_widget.dart';
import 'package:rb_jewellers/calculator/application/bloc/calculator_bloc.dart';
import 'package:rb_jewellers/investements/application/bloc/investment_bloc.dart';
import 'package:rb_jewellers/investements/domain/easy_gold_savings_plan.dart';
import 'package:rb_jewellers/investements/domain/future_gold_savings_plan.dart';
import 'package:rb_jewellers/investements/domain/golden_secure.dart';
import 'package:rb_jewellers/investements/infrastructure/investment_repository.dart';
import 'package:rb_jewellers/investements/presentation/create_easy_gold_savings_plan_screen.dart';
import 'package:rb_jewellers/investements/presentation/create_golden_secure_screen.dart';
import 'package:rb_jewellers/investements/presentation/golden_secure_card.dart';

import '../../app/presentation/widgets/common_server_error_widget.dart';
import 'create_future_gold_savings_plan_screen.dart';
import 'easy_gold_savings_plan_card.dart';
import 'future_gold_savings_plan_card.dart';

class InvestmentScreen extends StatelessWidget {
  const InvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InvestmentBloc(InvestmentRepository())
        ..add(const InvestmentEvent.getMyInvestments()),
      child: DefaultTabController(
        length: 2, // Number of tabs
        child: Column(
          children: [
            Container(
              color: primaryColor,
              child: TabBar(
                labelColor: secondaryColor, // Color for the selected tab label
                unselectedLabelColor:
                    primaryAccentColor, // Color for the unselected tab label
                indicatorColor:
                    secondaryColor, // Color for the bottom line indicator
                labelStyle: largeTextBold,
                tabs: const [
                  Tab(text: 'Swarna Samriddhi'),
                  Tab(text: 'My Samriddhi'),
                ],
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [
                  InvestmentPlansTab(),
                  MyInvestmentsTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum SortBy { date, amount }

class MyInvestmentsTab extends StatefulWidget {
  const MyInvestmentsTab({super.key});

  @override
  State<MyInvestmentsTab> createState() => _MyInvestmentsTabState();
}

class _MyInvestmentsTabState extends State<MyInvestmentsTab> {
  SortBy _sortBy = SortBy.date;
  bool _isAscending = false;

  List<T> _sortPlans<T>(List<T> plans, DateTime Function(T) getDate,
      double Function(T) getAmount) {
    final sorted = List<T>.from(plans);
    sorted.sort((a, b) {
      if (_sortBy == SortBy.date) {
        final dateA = getDate(a);
        final dateB = getDate(b);
        return _isAscending ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
      } else {
        final amountA = getAmount(a);
        final amountB = getAmount(b);
        return _isAscending
            ? amountA.compareTo(amountB)
            : amountB.compareTo(amountA);
      }
    });
    return sorted;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<InvestmentBloc, InvestmentState>(
      listener: (context, state) {
        state.responseFailureOrSuccessOption.fold(
          () {},
          (either) {
            either.fold((failure) {
              FlushbarHelper.createError(
                  message: failure.map(
                failureWithMessage: (value) => value.message,
                unexpected: (value) => 'Unexpected Error Contact Support',
                firestoreFailure: (value) => 'firestoreFailure',
                insufficientPermission: (value) => 'insufficientPermission',
                networkFailure: (value) => 'Network Failure',
              )).show(context);
            }, (unit) {
              FlushbarHelper.createSuccess(message: 'Action Success')
                  .show(context);
            });
          },
        );
      },
      builder: (context, state) {
        final calcBloc = BlocProvider.of<CalculatorBloc>(context);

        return DefaultTabController(
          length: 3,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: true,
                  pinned: false,
                  snap: true,
                  elevation: innerBoxIsScrolled ? 4 : 0,
                  automaticallyImplyLeading: false,
                  toolbarHeight: 60,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('My Plans',
                          style: titleTextBoldDark.copyWith(fontSize: 20)),
                      Container(
                        height: 36,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade300),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Icon(Icons.filter_list,
                                size: 18, color: primaryAccentColor),
                            const SizedBox(width: 8),
                            DropdownButtonHideUnderline(
                              child: DropdownButton<SortBy>(
                                value: _sortBy,
                                isDense: true,
                                icon: const Icon(Icons.keyboard_arrow_down,
                                    size: 18),
                                style:
                                    standardTextDarkBold.copyWith(fontSize: 14),
                                items: const [
                                  DropdownMenuItem(
                                      value: SortBy.date, child: Text('Date')),
                                  DropdownMenuItem(
                                      value: SortBy.amount,
                                      child: Text('Amount')),
                                ],
                                onChanged: (val) {
                                  if (val != null)
                                    setState(() => _sortBy = val);
                                },
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 18,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              color: Colors.grey.shade300,
                            ),
                            InkWell(
                              onTap: () =>
                                  setState(() => _isAscending = !_isAscending),
                              child: Icon(
                                _isAscending
                                    ? Icons.arrow_upward
                                    : Icons.arrow_downward,
                                size: 18,
                                color: secondaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  bottom: TabBar(
                    isScrollable: true,
                    labelColor: secondaryColor,
                    unselectedLabelColor: primaryAccentColor,
                    indicatorColor: secondaryColor,
                    indicatorWeight: 3,
                    tabAlignment: TabAlignment.start,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle: standardTextBold,
                    tabs: const [
                      Tab(text: 'Golden Assurance'),
                      Tab(text: 'Golden Future'),
                      Tab(text: 'Golden Secure'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                _buildEasyGoldTab(state, calcBloc),
                _buildFutureGoldTab(state, calcBloc),
                _buildGoldenSecureTab(state, calcBloc),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEasyGoldTab(InvestmentState state, CalculatorBloc calcBloc) {
    return state.easyGoldSavingsPlanResponseFailureOrSuccessOption.fold(
      () => const Center(child: CircularProgressIndicator()),
      (either) => either.fold(
        (failure) => CommonServerErrorWidget(
            'Failure',
            () => context
                .read<InvestmentBloc>()
                .add(const InvestmentEvent.getMyInvestments())),
        (List<EasyGoldSavingsPlan> plan) {
          if (plan.isEmpty) {
            return Container(); // Center(child: CommonResultsEmptyWidget(msg: 'No Golden Assurance Created'));
          }
          final sortedPlans = _sortPlans<EasyGoldSavingsPlan>(
              plan, (p) => p.createdAt, (p) => p.amount);
          return RefreshIndicator(
            onRefresh: () async => context
                .read<InvestmentBloc>()
                .add(const InvestmentEvent.getMyInvestments()),
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 80, top: 16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: sortedPlans.length,
              itemBuilder: (context, index) =>
                  EasyGoldSavingsPlanCard(myInvestment: sortedPlans[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFutureGoldTab(InvestmentState state, CalculatorBloc calcBloc) {
    return state.futureGoldSavingsPlanResponseFailureOrSuccessOption.fold(
      () => const Center(child: CircularProgressIndicator()),
      (either) => either.fold(
        (failure) => CommonServerErrorWidget(
            'Failure',
            () => context
                .read<InvestmentBloc>()
                .add(const InvestmentEvent.getMyInvestments())),
        (List<FutureGoldSavingsPlan> plan) {
          if (plan.isEmpty) {
            return Container(); // const Center(child: CommonResultsEmptyWidget(msg: 'No Golden Future Created'));
          }
          final sortedPlans = _sortPlans<FutureGoldSavingsPlan>(
              plan, (p) => p.createdAt, (p) => p.amountPaid);
          return RefreshIndicator(
            onRefresh: () async => context
                .read<InvestmentBloc>()
                .add(const InvestmentEvent.getMyInvestments()),
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 80, top: 16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: sortedPlans.length,
              itemBuilder: (context, index) => FutureGoldSavingsPlanCard(
                  myInvestment: sortedPlans[index], calculatorBloc: calcBloc),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGoldenSecureTab(InvestmentState state, CalculatorBloc calcBloc) {
    return state.goldenSecureResponseFailureOrSuccessOption.fold(
      () => const Center(child: CircularProgressIndicator()),
      (either) => either.fold(
        (failure) => CommonServerErrorWidget(
            'Failure',
            () => context
                .read<InvestmentBloc>()
                .add(const InvestmentEvent.getMyInvestments())),
        (List<GoldenSecure> plan) {
          if (plan.isEmpty) {
            return Container(); // const Center(child: CommonResultsEmptyWidget(msg: 'No Golden Secure Created'));
          }
          final sortedPlans = _sortPlans<GoldenSecure>(
              plan, (p) => p.createdAt, (p) => p.totalBookingAmount);
          return RefreshIndicator(
            onRefresh: () async => context
                .read<InvestmentBloc>()
                .add(const InvestmentEvent.getMyInvestments()),
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 80, top: 16),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: sortedPlans.length,
              itemBuilder: (context, index) => GoldenSecureCard(
                  myInvestment: sortedPlans[index], calculatorBloc: calcBloc),
            ),
          );
        },
      ),
    );
  }
}

class InvestmentPlansTab extends StatelessWidget {
  const InvestmentPlansTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          InvestmentPlanCard(
            imagePath: 'assets/images/golden-assurance_card.jpg',
            buttonText: 'Create Account',
            onTap: () => Get.to(
              () => const CreateEasyGoldSavingsPlanScreen(
                planName: 'Golden Assurance',
              ),
            ),
          ),
          InvestmentPlanCard(
            imagePath: 'assets/images/golden-future_card.jpg',
            buttonText: 'Create Account',
            borderRadius: 0, // different style
            onTap: () => Get.to(
              () => const CreateFutureGoldSavingsPlanScreen(
                planName: 'Golden Future',
              ),
            ),
          ),
          InvestmentPlanCard(
            imagePath: 'assets/images/golden-secure_card.jpg',
            buttonText: 'Create Account',
            borderRadius: 0, // different style
            onTap: () => Get.to(
              () => const CreateGoldenSecureScreen(
                planName: 'Golden Secure',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InvestmentPlanCard extends StatelessWidget {
  final String imagePath;
  final String buttonText;
  final VoidCallback onTap;
  final double borderRadius;

  const InvestmentPlanCard({
    super.key,
    required this.imagePath,
    required this.buttonText,
    required this.onTap,
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          imagePath,
          fit: BoxFit.contain,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded || frame != null) {
              return child;
            } else {
              return const AspectRatio(
                aspectRatio: 2 / 1,
                child: Center(child: CircularProgressIndicator()),
              );
            }
          },
          errorBuilder: (context, error, stackTrace) {
            return const AspectRatio(
              aspectRatio: 2 / 1,
              child: Center(
                child: Icon(Icons.error, color: Colors.red),
              ),
            );
          },
        ),
      ),
    );
  }
}
