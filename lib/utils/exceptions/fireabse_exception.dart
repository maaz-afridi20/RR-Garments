class TFirebaseException implements Exception {
  TFirebaseException(this.code);
  final String code;

  String get message {
    switch (code) {
      case 'unknown':
        return "unknown firebase exception";
      case 'invalid-custom-token':
        return "The custom token is format is invalid";
      case 'custom-token-mismatch':
        return "Token is mismatched.";
      case 'user-not-found':
        return "Invalid details. User not found";
      case 'user-disabled':
        return "This account is disabled. Please contact the administrator";
      case 'too-many-requests':
        return "Too many requests. Please try again later";
      case 'operation-not-allowed':
        return "This operation is not allowed. Please contact";
      case 'user-mismatch':
        return "User is mismatching";
      case 'invalid-credential':
        return "The supplied credential is invalid";
      case 'email-already-exists':
        return "This email address already exists";
      case 'requires-recent-login':
        return "This requires a recent login. Please log in again";
      case 'provider-already-linked':
        return "This provider is already linked with another provider";
      case 'credential-already-in-use':
        return "This credential is already associated with another account";
      case 'user-token-expired':
        return "User's token is expired";
      case 'user-token-revoked':
        return "User's token is revoked";
      case 'invalid-message-payload':
        return "The email verification message payload is invalid";
      case 'invalid-verify-code':
        return "Invalid verification code";
      case 'invalid-verify-id':
        return "Invalid verification ID";
      case 'expired-action-code':
        return "The action code has expired";
      case 'invalid-action-code':
        return "This action code is invalid";
      case 'missing-action-code':
        return "The action code is missing";
      case 'quota-exceeded':
        return "Quota exceeded. Please try again later";
      case 'invalid-email':
        return "The email address is invalid. Please try again later";
      case 'weak-password':
        return "Password is weak";
      case 'invalid-sender':
        return "The email template sender is invalid";
      case 'invalid-credentials':
        return "The supplied credentials are invalid";
      default:
        return "Unknown error occurred";
    }
  }
}
