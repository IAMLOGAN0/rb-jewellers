import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rb_jewellers/app/domain/core/app_failures.dart';
import 'package:rb_jewellers/home/domain/banners.dart';
import 'package:rb_jewellers/home/domain/i_home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(HomeState.initial()) {
    on<_SelectedIndex>((event, emit) async {
      emit(state.copyWith(selectedIndex: event.index));
    });

    on<_SelectedCategory>((event, emit) async {
      emit(state.copyWith(selectedCategory: event.category));
    });

    on<_IsSearching>((event, emit) async {
      emit(state.copyWith(isSearching: !state.isSearching, 
      
      ));
    });

    on<_GetBanners>((event, emit) async {
      emit(state.copyWith(
        isLoading: true,
        bannersResponseFailureOrSuccessOption: none(),
      ));
      Either<AppFailures, List<Banners>> failureOrSuccess;
      failureOrSuccess = await homeRepository.getBanners();

      emit(state.copyWith(
        isLoading: false,
        bannersResponseFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
    });

    on<_UploadBanner>((event, emit) async {
      emit(state.copyWith(
        saveFailureOrSuccessOption: none(),
      ));

      Either<AppFailures, Unit> failureOrSuccess;
      failureOrSuccess = await homeRepository.uploadBanner(event.photo);
      emit(state.copyWith(
        saveFailureOrSuccessOption: optionOf(failureOrSuccess),
      ));
      add(const _GetBanners());
    });
  }
}
