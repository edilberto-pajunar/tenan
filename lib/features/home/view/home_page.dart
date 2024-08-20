import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tenan/features/home/bloc/home_bloc.dart';
import 'package:tenan/features/home/view/home_screen.dart';
import 'package:tenan/repository/image_repository.dart';

class HomePage extends StatelessWidget {
  static String route = "/home_page";
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        imagePicker: ImagePicker(),
        imageRepository: context.read<ImageRepository>(),
      )..add(HomeInitRequested()),
      child: BlocListener<HomeBloc, HomeState>(
        listenWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status == HomeStatus.failed) {
            Fluttertoast.showToast(msg: state.error);
          }
        },
        child: const HomeScreen(),
      ),
    );
  }
}
