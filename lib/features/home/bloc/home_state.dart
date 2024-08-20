part of 'home_bloc.dart';

enum HomeStatus { idle, loading, success, failed }

class HomeState extends Equatable {
  final File? image;
  final List<Photo> photos;
  final HomeStatus status;
  final String error;

  const HomeState({
    this.image,
    this.photos = const [],
    this.status = HomeStatus.idle,
    this.error = "",
  });

  HomeState copyWith({
    File? image,
    List<Photo>? photos,
    HomeStatus? status,
    String? error,
  }) {
    return HomeState(
      image: image ?? this.image,
      photos: photos ?? this.photos,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        image,
        photos,
        status,
        error,
      ];
}
