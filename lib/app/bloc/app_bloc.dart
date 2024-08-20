import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppInitRequested>(_onInitRequested);
    on<AppInitCameraRequested>(_onInitCameraRequested);
  }

  void _onInitRequested(
    AppInitRequested event,
    Emitter<AppState> emit,
  ) {
    add(AppInitCameraRequested());
  }

  void _onInitCameraRequested(
    AppInitCameraRequested event,
    Emitter<AppState> emit,
  ) async {
    try {
      final storage = await Permission.storage.status;

      if (!storage.isGranted) {
        final storageStatus = await Permission.storage.request();
        emit(state.copyWith(storageStatus: storageStatus));
      }

      final camera = await Permission.camera.status;
      if (!camera.isGranted) {
        final cameraStatus = await Permission.camera.request();
        emit(state.copyWith(cameraStatus: cameraStatus));
      }
    } catch (e) {}
  }
}
