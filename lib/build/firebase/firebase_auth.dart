import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationBloc extends Cubit<AuthenticationStatus> {
  AuthenticationBloc() : super(AuthenticationStatus.unknown);

  void checkAuthenticationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      emit(AuthenticationStatus.authenticated);
    } else {
      emit(AuthenticationStatus.unauthenticated);
    }
  }

  void login(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(AuthenticationStatus.authenticated);
    } catch (e) {
      emit(AuthenticationStatus.unauthenticated);
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    emit(AuthenticationStatus.unauthenticated);
  }
}
