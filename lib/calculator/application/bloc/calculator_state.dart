part of 'calculator_bloc.dart';

@freezed
class CalculatorState with _$CalculatorState {
  const factory CalculatorState({
    required bool isLoading,
    required GoldPrice goldPrice,
    required String calculatedPrice,
    required String calculatedQuantity,
    required String calculatedMakingCharges,
    required String calculatedGST,
    required bool editingQty,
    required bool editingPrice,
    required Option<Either<AppFailures, GoldPrice>>
        goldResponseFailureOrSuccessOption,
  }) = _CalculatorState;

  factory CalculatorState.initial() => CalculatorState(
        isLoading: false,
        goldPrice: GoldPrice.empty(),
        editingPrice: false,
        editingQty: false,
        calculatedPrice: '',
        calculatedQuantity: '',
        calculatedMakingCharges: '00.00',
        calculatedGST: '00.00',
        goldResponseFailureOrSuccessOption: none(),
      );
}
