class LogoutData {
  bool status;
  String message;
  Data data;

  LogoutData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LogoutData.fromJson(Map<String, dynamic> json) => LogoutData(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String token;

  Data({
    required this.id,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "token": token,
  };
}
