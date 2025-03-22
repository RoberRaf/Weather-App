class Validators {
  static String? notEmpty(String? value, {String? msg}) {
    if (value == null || value.trim().isEmpty) {
      return msg ?? "This field is required";
    }
    return null;
  }

  static String? hasNoNumbers(String? value, {String? msg}) {
    if (value == null) return null;
    if (value.contains(RegExp(r'[0-9]'))) {
      return msg ?? "This field should not contain numbers";
    }

    return null;
  }

  static String? moreThanNum(String? value, {int? num, String? msg}) {
    if (value == null || value.length < (num ?? 6)) {
      return msg ?? "Enter $num characters or more";
    }
    return null;
  }

  static String? validCityName(String? v) {
    return Validators.notEmpty(v) ?? Validators.moreThanNum(v, num: 2) ?? Validators.hasNoNumbers(v);
  }
}

class AppRegex {
  static final RegExp isArabicWord = RegExp(r"^[\u0621-\u064a-\ ]+$");
}
