part of 'calculator_bloc.dart';

@freezed
class CalculatorEvent with _$CalculatorEvent {
  const factory CalculatorEvent.started() = _Started;
  const factory CalculatorEvent.getGoldPrice() = _GetGoldPrice;
  const factory CalculatorEvent.calculateGoldPrice(String gram) =
      _CalculateGoldPrice;
  const factory CalculatorEvent.calculateGoldQuantity(String price) =
      _CalculateGoldQuantity;
}
