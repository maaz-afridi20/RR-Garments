class TFirebaseAuthException implements Exception {
  TFirebaseAuthException(this.code);
  final String code;

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return "This email is already registered. Please use another email";
      case 'invalid-email':
        return "This email is invalid. Please use another email";
      case 'weak-password':
        return "The entered password is weak. Please use another password";
      case 'user-disabled':
        return "This account is disabled. Please contact the administrator";
      case 'user-not-found':
        return "Invaild deails. user not found";
      case 'wrong-password':
        return "Incorrect password. Please check your password";
      case 'invalid-verify-code':
        return "Invalid verify code.";
      case 'invalid-verify-id':
        return "Invalid verify ID.";
      case 'quota-exceeded':
        return "Quota exceeded. Please try again later.";
      case 'email-already-exists':
        return "This email address already exists";
      case 'provider-already-linked':
        return "This provider is already linked with another provider";
      case 'requires-recent-login':
        return "This requires a recent login. please login again";
      case 'credentials-already-in-use':
        return "This credentials is already associated with another account";
      case 'user-mismatch':
        return "User is mismatching";
      case 'operation-not-allowed':
        return "This operation is not allowed. Please contact";
      case 'expired-action-code':
        return "The code is expired.";
      case 'invalid-action-code':
        return "This action is invalid.";
      case 'missing-action-code':
        return "The action code is missing.";
      case 'user-token-expired':
        return "User's token is expired.";
      case 'invalid-credentials':
        return "The supplied credentials are invalid.";
      case 'user-token-revoked':
        return "User's token is revoked.";
      case 'invalid-message-payload':
        return "The email verification message payload is invalid.";
      case 'invalid-sender':
        return "The email template sender is invalid.";
      default:
        return "unknown error occurred";
    }
  }
}
