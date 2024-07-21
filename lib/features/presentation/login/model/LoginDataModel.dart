class LoginDataModel {
  bool status;
  String message;
  Data ?data;

  LoginDataModel({
    required this.status,
    required this.message,
     this.data,
  });

  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
    status: json["status"],
    message: json["message"],
    data:json['data']!=null? Data.fromJson(json["data"]):null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.image,
    required this.points,
    required this.credit,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"]??0,
    name: json["name"]??'',
    email: json["email"]??'',
    phone: json["phone"]??'',
    image: json["image"]??'',
    points: json["points"]??0,
    credit: json["credit"]??0,
    token: json["token"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "image": image,
    "points": points,
    "credit": credit,
    "token": token,
  };
}
