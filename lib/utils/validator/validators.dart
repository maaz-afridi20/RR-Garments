class TValidators {
// ----------------------------empty text validation-----------------------------------

  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // ----------------------------for validating the email------------------------------------
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is Empty';
    }
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'invalid email address';
    }
    return null;
  }

  // ----------------------------for validating the password------------------------------------
  static validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is Required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }

    // check for upper case characters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain upper case characters';
    }

    // check for numbers

    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain numbers';
    }

    // check for special characters

    if (!value.contains(RegExp(r'[@#&^*)(_+!$\|/?<>)]'))) {
      return 'password must contain special characters';
    }
    return null;
  }

  // ----------------------------for validating the phone number------------------------------------

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'phone must not be empty';
    }

    // ----------------------------assuming the US number------------------------------------

    final phoneRegExp = RegExp(r'^\d{10}$');

    if (phoneRegExp.hasMatch(value)) {
      return 'invalid phone number format must be 10 digits';
    }
    return null;
  }

  // ----------------------------------------------------------------
}
