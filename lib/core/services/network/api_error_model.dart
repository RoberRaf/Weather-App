class ApiErrorModel {
  String? message;
  List<String>? _formErrors;

  ApiErrorModel({this.message});

  ApiErrorModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['errors'] is Map) {
      final errors = json['errors'] as Map<String, dynamic>;
      final List<String> errosList = [];
      for (var e in errors.values) {
        if (e is List<dynamic>) errosList.addAll(e.map((e) => e));
      }
      _formErrors = errosList;
    } else if (json['errors'] is List<dynamic>) {
      for (var e in json['errors']) {
        _formErrors ??= [];
        _formErrors!.add(e);
      }
    }
    if (_formErrors?.isEmpty == true) _formErrors = null;
  }
  String? get formErrors => _formErrors?.join('.\n');
}
