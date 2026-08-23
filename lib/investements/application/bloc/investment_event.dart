part of 'investment_bloc.dart';

@freezed
class InvestmentEvent with _$InvestmentEvent {
  const factory InvestmentEvent.started() = _Started;
  const factory InvestmentEvent.easyGoldSavingsPlan(EasyGoldSavingsPlan plan) =
      _EasyGoldSavingsPlan;
  const factory InvestmentEvent.createEasyGoldSavingsPlan() =
      _CreateEasyGoldSavingsPlan;
  const factory InvestmentEvent.payInstallmentOfEasyGoldSavingsPlan(
      EasyGoldSavingsPlan plan) = _PayInstallmentOfEasyGoldSavingsPlan;

  const factory InvestmentEvent.futureGoldSavingsPlan(
      FutureGoldSavingsPlan plan) = _FutureGoldSavingsPlan;
  const factory InvestmentEvent.createFutureGoldSavingsPlan() =
      _CreateFutureGoldSavingsPlan;
  const factory InvestmentEvent.payInstallmentOfFutureGoldSavingsPlan(
          FutureGoldSavingsPlan plan, String amount) =
      _PayInstallmentOfFutureGoldSavingsPlan;
  const factory InvestmentEvent.bookGoldPriceForFutureGold(
      FutureGoldSavingsPlan plan) = _BookGoldPriceForFutureGold;

  const factory InvestmentEvent.goldenSecure(GoldenSecure plan) = _GoldenSecure;
  const factory InvestmentEvent.createGoldenSecure() = _CreateGoldenSecure;
  const factory InvestmentEvent.payInstallmentOfGoldenSecure(
    GoldenSecure plan,
    String amount,
    double goldPrice,
    double qty,
  ) = _PayInstallmentOfGoldenSecure;

  const factory InvestmentEvent.payOnStore(PayOffline data) = _PayOnStore;
  const factory InvestmentEvent.getMyInvestments() = _GetMyInvestments;
}
