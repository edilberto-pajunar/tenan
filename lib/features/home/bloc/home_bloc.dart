import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenan/model/photo.dart';
import 'package:tenan/repository/image_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ImagePicker _imagePicker;
  final ImageRepository _imageRepository;

  HomeBloc({
    required ImagePicker imagePicker,
    required ImageRepository imageRepository,
  })  : _imagePicker = imagePicker,
        _imageRepository = imageRepository,
        super(const HomeState()) {
    on<HomeInitRequested>(_onInitRequested);
    on<HomeInitImagesRequested>(_onInitImagesRequested);
    on<HomeCameraPressed>(_onCameraPressed);
    on<HomeFailed>(_onHomeFailed);
  }

  void _onInitRequested(
    HomeInitRequested event,
    Emitter<HomeState> emit,
  ) {
    add(HomeInitImagesRequested());
  }

  void _onInitImagesRequested(
    HomeInitImagesRequested event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));

      final photos = await _imageRepository.getImages();
      emit(state.copyWith(photos: photos, status: HomeStatus.success));
    } catch (e) {
      add(HomeFailed(e.toString()));
    }
  }

  void _onCameraPressed(
    HomeCameraPressed event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final image = await _imagePicker.pickImage(source: event.imageSource);
      if (image == null) return;

      final imageTemporary = File(image.path);
      emit(state.copyWith(image: imageTemporary));
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void _onHomeFailed(
    HomeFailed event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(status: HomeStatus.failed, error: event.error));
  }
}
