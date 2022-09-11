import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AsyncValue<Session>>(
  (ref) => AuthNotifier(read: ref.read),
);

class AuthNotifier extends StateNotifier<AsyncValue<Session>> {
  final Reader _read;
  late final GotrueSubscription _onAuthStateListener;

  AuthNotifier({required Reader read})
      : _read = read,
        super(const AsyncLoading()) {
    init();
  }

  @override
  void dispose() {
    _onAuthStateListener.data?.unsubscribe();
    super.dispose();
  }

  Future<void> init() async {
    final session = Supabase.instance.client.auth.currentSession;
    print('セッション');
    print(session);
    if (session != null) {
      state = AsyncValue.data(session);
    }

    _onAuthStateListener = Supabase.instance.client.auth.onAuthStateChange((event, session) {
      print('変更');
      if (session != null) {
        state = AsyncValue.data(session);
      } else {
        state = const AsyncValue.loading();
      }
    });
  }

  Future<void> signIn(String email, String password) async {
    await Supabase.instance.client.auth.signIn(email: email, password: password);
  }

  Future<void> signUp(String email, String password) async {
    await Supabase.instance.client.auth.signUp(email, password);
  }

  Future<void> signOut() => Supabase.instance.client.auth.signOut();
}
