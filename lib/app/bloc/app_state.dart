part of 'app_bloc.dart';

class AppState extends Equatable {
  final PermissionStatus? storageStatus;
  final PermissionStatus? cameraStatus;

  const AppState({
    this.storageStatus,
    this.cameraStatus,
  });

  AppState copyWith({
    PermissionStatus? storageStatus,
    PermissionStatus? cameraStatus,
  }) {
    return AppState(
      storageStatus: storageStatus ?? this.storageStatus,
      cameraStatus: cameraStatus ?? this.cameraStatus,
    );
  }

  @override
  List<Object?> get props => [
        storageStatus,
        cameraStatus,
      ];
}
