class TFormatException implements Exception {
  final String message;

  const TFormatException(
      [this.message = 'an unexpected format error happened']);

  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

// get the corresponding error message
  String get formattedMessage => message;

  factory TFormatException.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TFormatException(
            "This email is already registered. Please use another email");
      case 'invalid-email':
        return const TFormatException(
            "This email is invalid. Please use another email");

      case 'weak-password':
        return const TFormatException(
            "The entered password is weak. Please use another password");
      case 'user-disabled':
        return const TFormatException(
            "This account is disabled. Please contact the administrator");
      case 'user-not-found':
        return const TFormatException("Invaild deails. user not found");
      case 'wrong-password':
        return const TFormatException(
            "Incorrect password. Please check your password");
      case 'invalid-verify-code':
        return const TFormatException("Invalid verify code.");
      case 'invalid-verify-id':
        return const TFormatException("Invalid verify ID.");
      case 'quota-exceeded':
        return const TFormatException(
            "Quota exceeded. Please try again later.");
      case 'email-already-exists':
        return const TFormatException("This email address already exists");
      case 'provider-already-linked':
        return const TFormatException(
            "This provider is already linked with another provider");
      case 'requires-recent-login':
        return const TFormatException(
            "This requires a recent login. please login again");
      case 'credentials-already-in-use':
        return const TFormatException(
            "This credentials is already associated with another account");
      case 'user-mismatch':
        return const TFormatException("User is mismatching");
      case 'operation-not-allowed':
        return const TFormatException(
            "This operation is not allowed. Please contact");
      case 'expired-action-code':
        return const TFormatException("The code is expired.");
      case 'invalid-action-code':
        return const TFormatException("This action is invalid.");
      case 'missing-action-code':
        return const TFormatException("The action code is missing.");
      case 'user-token-expired':
        return const TFormatException("User's token is expired.");
      case 'invalid-credentials':
        return const TFormatException("The supplied credentials are invalid.");
      case 'user-token-revoked':
        return const TFormatException("User's token is revoked.");
      case 'invalid-message-payload':
        return const TFormatException(
            "The email verification message payload is invalid.");
      case 'invalid-sender':
        return const TFormatException("The email template sender is invalid.");

      default:
        return const TFormatException("some error occurred");
    }
  }
}
