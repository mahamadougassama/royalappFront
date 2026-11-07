
import 'package:college_royal/Models/User.dart';
import 'package:college_royal/Service/AuthService.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isConnected;
  final String? token;
  final String? role;
  final String? erreur;

  AuthState({
    required this.isConnected,
    this.token,
    this.role,
    this.erreur,
  });
}

class AuthNotifier extends Notifier<AuthState> {
  final AuthService authService = AuthService();

  @override
  AuthState build() {
    return AuthState(isConnected: false);
  }

  Future<void> connecter(User user) async {
    state = AuthState(isConnected: false);
    try {
      final reponse = await authService.login(user);

      state = AuthState(
        isConnected: true,
        token: reponse['token'],
        role: reponse['role'],
      );
    } catch (e) {
      state = AuthState(
        isConnected: false,
        erreur: e.toString(),
      );
    }
  }

  void deconnecter() {
    state = AuthState(isConnected: false);
  }
}

final authProvider =
    NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
