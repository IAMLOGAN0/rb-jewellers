part of 'investment_bloc.dart';

@freezed
class InvestmentState with _$InvestmentState {
  const factory InvestmentState({
    required bool isLoading,
    required bool showErrorMessages,
    required EasyGoldSavingsPlan easyGoldSavingsPlan,
    required FutureGoldSavingsPlan futureGoldSavingsPlan,
    required GoldenSecure goldenSecure,
    required Option<Either<AppFailures, Unit>> responseFailureOrSuccessOption,
    required Option<Either<AppFailures, List<EasyGoldSavingsPlan>>>
        easyGoldSavingsPlanResponseFailureOrSuccessOption,
    required Option<Either<AppFailures, List<FutureGoldSavingsPlan>>>
        futureGoldSavingsPlanResponseFailureOrSuccessOption,
    required Option<Either<AppFailures, List<GoldenSecure>>>
        goldenSecureResponseFailureOrSuccessOption,
  }) = _InvestmentState;

  factory InvestmentState.initial() => InvestmentState(
        isLoading: false,
        showErrorMessages: false,
        easyGoldSavingsPlan: EasyGoldSavingsPlan.empty(),
        futureGoldSavingsPlan: FutureGoldSavingsPlan.empty(),
        goldenSecure: GoldenSecure.empty(),
        easyGoldSavingsPlanResponseFailureOrSuccessOption: none(),
        futureGoldSavingsPlanResponseFailureOrSuccessOption: none(),
        responseFailureOrSuccessOption: none(),
        goldenSecureResponseFailureOrSuccessOption: none(),
      );
}
