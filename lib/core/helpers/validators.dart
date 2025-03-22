class Validators {
  static String? notEmpty(String? value, {String? msg}) {
    if (value == null || value.trim().isEmpty) {
      return msg ?? "This field is required";
    }
    return null;
  }

  static String? moreThanNum(String? value, {int? num, String? msg}) {
    if (value == null || value.length < (num ?? 3)) {
      return msg ?? "Enter $num characters or more";
    }
    return null;
  }

  static String? validCityName(String? v) {
    return Validators.notEmpty(v) ?? Validators.moreThanNum(v, num: 3);
  }
}

class AppRegex {
  static final RegExp isArabicWord = RegExp(r"^[\u0621-\u064a-\ ]+$");
}
