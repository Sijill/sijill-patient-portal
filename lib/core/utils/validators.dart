class AppValidators {
  AppValidators._();

  static String? validateEmail(String? val) {
    RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    } else if (emailRegex.hasMatch(val) == false) {
      return 'enter valid email';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }

    if (val.length < 12 || val.length > 16) {
      return 'Password must be between 12 and 16 characters';
    }

    RegExp passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{12,16}$',
    );

    if (!passwordRegex.hasMatch(val)) {
      return 'Password must include upper, lower, number & symbol';
    }

    return null;
  }

  static String? validateConfirmPassword(String? val, String? password) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (val != password) {
      return 'Passwords not matching';
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else if (!usernameRegex.hasMatch(val)) {
      return 'enter valid username';
    } else {
      return null;
    }
  }

  static String? validateFullName(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null) {
      return 'This field is required';
    } else if (int.tryParse(val.trim()) == null) {
      return 'enter numbers only';
    } else if (val.trim().length != 11) {
      return 'enter value must equal 11 digit';
    } else {
      return null;
    }
  }

  static String? validateNationalID(String? val) {
    if (val == null || val.isEmpty) {
      return 'This field is required';
    }

    val = val.trim();

    if (!RegExp(r'^\d+$').hasMatch(val)) {
      return 'Enter numbers only';
    }

    if (val.length != 14) {
      return 'National ID must be exactly 14 digits';
    }

    return null;
  }

  static String? validateGender(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please select a gender';
    }
    if (val != "Male" && val != "Female") {
      return 'Invalid selection';
    }
    return null;
  }

  static String? validateDate(String? val) {
    if (val == null || val.isEmpty) {
      return 'Please select your date of birth';
    }
    return null;
  }

  static String? validateOtp(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'This field is required';
    }

    if (!RegExp(r'^\d{6}$').hasMatch(val.trim())) {
      return 'Enter a valid 6-digit code';
    }

    return null;
  }
}
