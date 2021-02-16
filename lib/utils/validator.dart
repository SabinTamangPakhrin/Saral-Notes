class Validator {
  String emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter email.';
    } else if (!value.contains('@')) {
      return 'Email not correctly formatted';
    } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
        .hasMatch(value)) {
      return 'Please enter valid email';
    }
    return null;
  }

  String passwordValidator(value) {
    if (value.isEmpty) {
      return 'Please enter password.';
    } else if (value.length < 8) {
      return 'Password must be atleast 8 character.';
    }
    return null;
  }

  String fNameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }
}
