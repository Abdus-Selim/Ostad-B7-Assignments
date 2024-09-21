class FormValidator {
  static String? validateValue(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter a valid value";
    }
    return null;
  }
}
