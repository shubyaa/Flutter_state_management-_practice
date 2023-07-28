import 'package:mongo_dart/mongo_dart.dart';

class Users {
  ObjectId? iId;
  String? email;
  String? password;
  String? name;
  String? phone;
  bool? emailVerification;
  String? imageUrl;
  bool? isLogin;
  bool? verifyMobile;
  List<String>? favouriteStores;
  int? iV;

  Users(
      {this.iId,
      this.email,
      this.password,
      this.name,
      this.phone,
      this.emailVerification,
      this.imageUrl,
      this.isLogin,
      this.verifyMobile,
      this.favouriteStores,
      this.iV});

  Users.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    email = json['email'];
    password = json['password'];
    name = json['name'];
    // phone = (json['phone'].cast<Int64>()).toString();
    phone = json['phone'].toString();
    emailVerification = json['email_verification'];
    imageUrl = json['image_url'];
    isLogin = json['isLogin'];
    verifyMobile = json['verifyMobile'];
    favouriteStores = json['favourite_stores'].cast<String>();
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = iId;
    data['email'] = email;
    data['password'] = password;
    data['name'] = name;
    data['phone'] = phone;
    data['email_verification'] = emailVerification;
    data['image_url'] = imageUrl;
    data['isLogin'] = isLogin;
    data['verifyMobile'] = verifyMobile;
    data['favourite_stores'] = favouriteStores;
    data['__v'] = iV;
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  Id.fromJson(Map<String, dynamic> json) {
    oid = json['\$oid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["\$oid"] = oid;
    return data;
  }
}
