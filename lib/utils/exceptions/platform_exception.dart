class TPlatformException implements Exception {
  final String code;
  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return "This email is already registered. Please use another email";
      case 'invalid-email':
        return "This email is invalid. Please use another email";
      case 'INVALID_LOGIN_CREDENTIALS':
        return "Invalid login credentials. Please use another email";
      case 'too-many-requests':
        return "Too many requests.";
      case 'invalid-phone-number':
        return "Invalid phone number.";
      case 'internal-error':
        return "Internal error.";
      case 'uid-already-exists':
        return "The provider id is already in use.";
      case 'operation-not-allowed':
        return "The sign in provider is disabled.";
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
      case 'invalid-password':
        return "Incorrect password";
      case 'expired-action-code':
        return "The code is expired.";
      case 'invalid-action-code':
        return "This action is invalid.";
      case 'missing-action-code':
        return "The action code is missing.";
      case 'user-token-expired':
        return "User's token is expired.";
      case 'invalid-argument':
        return "The argument is invalid.";
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
