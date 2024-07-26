class ProfileData {
  bool status;
  dynamic message;
  Data data;

  ProfileData({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
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
  String name;
  String email;
  String phone;
  String image;
  String token;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    image: json["image"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "token": token,
  };
}
