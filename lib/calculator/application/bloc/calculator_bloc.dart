import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/calculator/domain/gold_price.dart';
import 'package:rb_jewellers/calculator/domain/i_gold_price_repository.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';
part 'calculator_bloc.freezed.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final IGoldRepository goldRepository;
  CalculatorBloc(this.goldRepository) : super(CalculatorState.initial()) {
    on<_CalculateGoldPrice>((event, emit) {
      if (event.gram == '') {
        emit(state.copyWith(
          calculatedQuantity: '',
          calculatedPrice: '',
        ));
        return;
      }
      // Convert the input values
      double qty = double.parse(event.gram);
      double pricePerGram =
          double.parse(state.goldPrice.price22); // Gold price per gram
      double makingChargesPercent =
          double.parse(state.goldPrice.makingChargesPercent);
      double gstPercent = double.parse(state.goldPrice.gst);

      // Calculate making charges in terms of actual price
      double makingCharges = pricePerGram * (makingChargesPercent / 100);

      // Calculate GST value
      double gstAmount =
          (pricePerGram + makingCharges) * qty * (gstPercent / 100);

      // Calculate the total price, considering GST
      double calculatedPrice =
          (pricePerGram + makingCharges) * qty * (1 + (gstPercent / 100));

      // Emit the new state with the calculated details
      emit(state.copyWith(
        editingQty: true,
        editingPrice: false,
        calculatedQuantity: qty.toString(),
        calculatedPrice: calculatedPrice.toString(),
        calculatedGST: gstAmount.toString(),
        calculatedMakingCharges: makingCharges.toString(),
      ));
    });

    on<_CalculateGoldQuantity>((event, emit) async {
 
      if (event.price == '') {
        emit(state.copyWith(
          calculatedQuantity: '',
          calculatedPrice: '',
        ));
        return;
      }
      // Convert the input values
      double totalPrice = double.parse(event.price);
      double pricePerGram =
          double.parse(state.goldPrice.price22); // Gold price per gram
      double makingChargesPercent =
          double.parse(state.goldPrice.makingChargesPercent);
      double gstPercent = double.parse(state.goldPrice.gst);

      // Calculate making charges in terms of actual price
      double makingCharges = pricePerGram * (makingChargesPercent / 100);

      // Calculate GST value
      double gstAmount = totalPrice * (gstPercent / (100 + gstPercent));

      // Calculate the quantity based on the total price, considering GST
      double calculatedQuantity = totalPrice /
          ((pricePerGram + makingCharges) * (1 + (gstPercent / 100)));

      // Emit the new state with the calculated quantity and details
      emit(state.copyWith(
        editingQty: false,
        editingPrice: true,
        calculatedPrice: totalPrice.toString(),
        calculatedQuantity: calculatedQuantity.toString(),
        calculatedGST: gstAmount.toString(),
        calculatedMakingCharges: makingCharges.toString(),
      ));
    });

    on<_GetGoldPrice>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        goldResponseFailureOrSuccessOption: none(),
      ));
      Either<AppFailures, GoldPrice> failureOrSuccess;
      failureOrSuccess = await goldRepository.getGoldPrice();

      GoldPrice goldPrice = GoldPrice.empty();
      failureOrSuccess.fold(
        (l) {},
        (r) => goldPrice = r,
      );

      emit(state.copyWith(
        isLoading: false,
        goldPrice: goldPrice,
        goldResponseFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });
  }
}
