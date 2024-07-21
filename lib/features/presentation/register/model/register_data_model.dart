class RegisterDataModel {
  bool status;
  String message;
  Data ?data;

  RegisterDataModel({
    required this.status,
    required this.message,
     this.data,
  });

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) => RegisterDataModel(
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
  String name;
  String email;
  String phone;
  int id;
  String image;
  String token;

  Data({
    required this.name,
    required this.email,
    required this.phone,
    required this.id,
    required this.image,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"]??'',
    email: json["email"]??'',
    phone: json["phone"]??'',
    id: json["id"]??0,
    image: json["image"]??'',
    token: json["token"]??'',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "phone": phone,
    "id": id,
    "image": image,
    "token": token,
  };
}
