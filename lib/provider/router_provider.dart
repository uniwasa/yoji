import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yoji/page/home/home_page.dart';
import 'package:yoji/page/login/login_page.dart';
import 'package:yoji/provider/auth_provider.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) => const LoginPage(),
        ),
      ],
      refreshListenable: GoRouterRefreshStream(ref.watch(authProvider.notifier).stream),
    );
  },
);
