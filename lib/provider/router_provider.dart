import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:yoji/page/home/home_page.dart';
import 'package:yoji/page/idiom/idiom_page.dart';
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
        GoRoute(
          path: '/idiom',
          name: 'idiom',
          builder: (context, state) => const IdiomPage(),
        ),
      ],
      redirect: (state) {
        final isLoggedIn = ref.read(authProvider.notifier).isLoggedIn;
        final isGoingToLogIn = state.subloc == '/login';
        // ログインしてない場合
        if (!isLoggedIn) return isGoingToLogIn ? null : '/login';
        // ログインしてるのにログイン画面にいる場合
        if (isGoingToLogIn) return '/';
        // リダイレクト不要
        return null;
      },
      refreshListenable: GoRouterRefreshStream(ref.read(authProvider.notifier).stream),
    );
  },
);
