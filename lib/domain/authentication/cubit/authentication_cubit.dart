import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  ///signup

  Future signUp({String? email, String? password}) async {
    emit(const SigninLoading());
    try {
      User? user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email!, password: password!))
          .user;

      if (user != null) {
        emit(SigninSuccess(user: user));
      }
    } on FirebaseAuthException catch (e) {
      emit(SigninError(er: e.message!));
    }
  }

  //login

  Future login({String? email, String? password}) async {
    emit(const LoginLoading());

    try {
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email!, password: password!))
          .user;

      if (user != null) {
        emit(LoginSuccess(user: user));
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginError(err: e.message!));
    }
  }

  ///forgot password

  Future forgotpassword({required String? email}) async {
    emit(const ForgotPswLoading());

    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email!);

      emit(const ForgotPswSuccess());
    } on FirebaseAuthException catch (e) {
      emit(ForgotPswError(err: e.message));
    }
  }

  //logout

  Future logout() async {
    await _firebaseAuth.signOut();
    emit(const AuthOut());
  }

  ///auth check

  // Future auth() async {
  //   if (_firebaseAuth.currentUser == null) {
  //     print('no user');
  //     emit(const AuthOut());
  //   } else {
  //     emit(const AuthIn());
  //   }
  // }
}
