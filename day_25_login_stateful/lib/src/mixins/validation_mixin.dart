mixin ValidationMixin {
  String? validateEmail(String? value) {
    if (value == null || (value.isEmpty && !value.contains('@'))) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || (value.isEmpty && value.length < 6)) {
      return 'Please enter a password greater than 6 characters';
    }
    return null;
  }
}
