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

        // ユーザーの元々の行き先のロケーション名をクエリパラメータに紐づける
        final fromParam = state.subloc == '/' ? '' : '?from=${state.subloc}';

        // ログインしてない場合
        if (!isLoggedIn) return isGoingToLogIn ? null : '/login$fromParam';
        // ユーザーがログインしている場合はユーザーを元々の行き先に誘導、行き先がない場合はホーム画面へ
        if (isGoingToLogIn) return state.queryParams['from'] ?? '/';

        // リダイレクト不要
        return null;
      },
      refreshListenable: GoRouterRefreshStream(ref.read(authProvider.notifier).stream),
    );
  },
);
