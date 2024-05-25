class DeleteMyBookModel {
  bool? status;
  String? message;
  Errors? errors;

  DeleteMyBookModel({this.status, this.message, this.errors});

  DeleteMyBookModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors =
        json['errors'] != null ? new Errors.fromJson(json['errors']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.errors != null) {
      data['errors'] = this.errors!.toJson();
    }
    return data;
  }
}

class Errors {
  String? error;

  Errors({this.error});

  Errors.fromJson(Map<String, dynamic> json) {
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    return data;
  }
}