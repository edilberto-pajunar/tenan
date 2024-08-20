part of 'app_bloc.dart';

class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class AppInitRequested extends AppEvent {}

class AppInitCameraRequested extends AppEvent {}
