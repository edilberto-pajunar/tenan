part of 'home_bloc.dart';

class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeInitRequested extends HomeEvent {}

class HomeInitImagesRequested extends HomeEvent {}

class HomeCameraPressed extends HomeEvent {
  final ImageSource imageSource;
  const HomeCameraPressed({required this.imageSource});
}

class HomeFailed extends HomeEvent {
  final String error;
  const HomeFailed(this.error);
}
