part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required int selectedIndex,
    required String selectedCategory,
    required bool isLoading,
    required bool isSearching,
    required Option<Either<AppFailures, List<Banners>>>
        bannersResponseFailureOrSuccessOption,
    required Option<Either<AppFailures, Unit>> saveFailureOrSuccessOption,
  }) = _HomeState;

  factory HomeState.initial() => HomeState(
        selectedIndex: 0,
        selectedCategory: 'Gold',
        isLoading: false,
        isSearching: false,
        bannersResponseFailureOrSuccessOption: none(),
        saveFailureOrSuccessOption: none(),
      );
}
