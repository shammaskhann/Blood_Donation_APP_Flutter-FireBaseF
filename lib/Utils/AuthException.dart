import 'package:firebase_auth/firebase_auth.dart';
import 'Utils.dart';

class AuthException {
  static void authExceptionToast(FirebaseAuthException e) {
    String errorMessage = "An Error Occured";
    switch (e.code) {
      case 'invalid-email':
        errorMessage = 'Invalid email address';
        break;
      case 'user-not-found':
        errorMessage = 'User not found';
        break;
      case 'wrong-password':
        errorMessage = 'Incorrect password';
        break;
      case 'email-already-in-use':
        errorMessage = 'Email is already in use';
        break;
      case 'weak-password':
        errorMessage = 'Weak password';
        break;
      case 'operation-not-allowed':
        errorMessage = 'Operation not allowed';
        break;
      case 'user-disabled':
        errorMessage = 'User account has been disabled';
        break;
      case 'invalid-credential':
        errorMessage = 'Invalid credential';
        break;
      default:
        errorMessage = e.message ?? "An error occurred";
        break;
    }
    Utils.toastMessage(errorMessage);
  }
}
