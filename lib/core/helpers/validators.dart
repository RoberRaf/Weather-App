class AppRegex {
  static final RegExp emailValidatorRegExp = RegExp(r"^01[0125][0-9]{8}$");
}

class Validators {
  static String? notEmpty(String? value, {String? msg}) {
    if (value == null || value.trim().isEmpty) {
      return msg ?? "This field is required";
    }
    return null;
  }
}
