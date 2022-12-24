class CommentResponse {
  List<String>? errorString;
  List<String>? inputerror;
  String? message;
  int? status;

  CommentResponse({
    this.errorString,
    this.inputerror,
    this.message,
    this.status,
  });

  CommentResponse.fromJson(Map<String, dynamic> json) {
    errorString = json['error_string'].cast<String>();
    inputerror = json['inputerror'].cast<String>();
    message = json['message'] as String?;
    status = json['status'] as int?;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_string'] = errorString;
    data['inputerror'] = inputerror;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
