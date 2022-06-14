// ignore_for_file: non_constant_identifier_names

class Response {
  late bool status;
  late String message;

  Response({
    required this.status,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'status' : status,
      'message': message,
    };
  }

  Response.fromMap(Map<String, dynamic> map) {
    status = map['status'];
    message = map['message'];
  }
}