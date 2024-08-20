import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenan/app/app_bloc_observer.dart';
import 'package:tenan/app/app_router.dart';
import 'package:tenan/app/bloc/app_bloc.dart';
import 'package:tenan/repository/image_repository.dart';

void main() async {
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ImageRepository(),
      child: BlocProvider(
        create: (context) => AppBloc()..add(AppInitRequested()),
        child: MaterialApp.router(
          routerConfig: AppRouter.config,
        ),
      ),
    );
  }
}
