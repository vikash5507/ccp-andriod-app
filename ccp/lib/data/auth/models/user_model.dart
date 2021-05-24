class AuthUser {
  String uid;
  String fullname;
  String email;
  String username;

  AuthUser({this.uid, this.fullname, this.email, this.username});

  AuthUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'].toString();
    fullname = json['fullname'];
    email = json['email'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = int.parse(this.uid);
    data['fullname'] = this.fullname;
    data['email'] = this.email;
    data['username'] = this.username;
    return data;
  }
}