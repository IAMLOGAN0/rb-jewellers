part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.selectedIndex(int index) = _SelectedIndex;
  const factory HomeEvent.selectedCategory(String category) = _SelectedCategory;
  const factory HomeEvent.isSearching() = _IsSearching;

  const factory HomeEvent.uploadBanner(File photo) = _UploadBanner;
  const factory HomeEvent.getBanners() = _GetBanners;
  const factory HomeEvent.deletePhoto(String bannerId) = _DeleteBanner;
}
