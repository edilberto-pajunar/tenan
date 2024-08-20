import 'package:go_router/go_router.dart';
import 'package:tenan/features/get_started/view/get_started_page.dart';
import 'package:tenan/features/home/view/home_page.dart';

class AppRouter {
  static final GoRouter config = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        name: "get_started",
        builder: (context, state) => const GetStartedPage(),
      ),
      GoRoute(
        path: HomePage.route,
        name: "/home",
        builder: (context, state) => const HomePage(),
      ),
    ],
    redirect: (context, state) {
      print(state.fullPath);
      return null;
    },
  );
}
