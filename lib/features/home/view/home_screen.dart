import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenan/features/home/bloc/home_bloc.dart';
import 'package:tenan/model/photo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gallery"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: const Text("Choose source:"),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(const HomeCameraPressed(
                            imageSource: ImageSource.camera,
                          ));
                    },
                    child: const Text("Camera"),
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {
                      context.read<HomeBloc>().add(const HomeCameraPressed(
                            imageSource: ImageSource.gallery,
                          ));
                    },
                    child: const Text("Gallery"),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.camera_alt),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status == HomeStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return MasonryGridView.builder(
            itemCount: state.photos.length,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final photo = state.photos[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(
                  "http://10.0.2.2:8000/uploads/gallery/${photo.image}",
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                        Icons.error); // Show error icon if loading fails
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                        child:
                            CircularProgressIndicator()); // Show loading indicator while loading
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Tile extends StatelessWidget {
  const Tile({
    required this.index,
    super.key,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
