class User {
    int id;
  String frist_name;
  String last_name;
  String username;
  String email;
  String phone;
  String avatar;
  String address;
    int role_id;
  String status;
    int provinceid;
    int districtid;
    int wardid;
  String provincename ;
  String districtname;
  String wardname;
  String birthday;

  User({
    this.id = 0,
    this.frist_name = "",
    this.last_name= "",
    this.username = "",
    this.email = "",
    this.phone= "",
    this.avatar = "",
    this.address = "",
    this.role_id= 4,
    this.status= "Active",
    this.provinceid = 0,
    this.districtid = 0,
    this.wardid = 0,
    this.provincename = "",
    this.districtname= "",
    this.wardname = "",
    this.birthday= "",
  });

   factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ,
      frist_name: json['frist_name'] ?? "",  // Corrected field name
      last_name: json['last_name'] ?? "",
      username: json['username'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      avatar: json['avatar'] ?? "",
      address: json['address'] ?? "",
      role_id: json['role_id'] ?? 4,
      status: json['status'] ?? "Active",
      provinceid: json['provinceid'] ?? 0,
      districtid: json['districtid'] ?? 0,
      wardid: json['wardid'] ?? 0,
      provincename: json['provincename'] ?? "",
      districtname: json['districtname'] ?? "",
      wardname: json['wardname'] ?? "",
      birthday: json['birthday'] ?? "",);
  }
  factory User.fromUser(User user) {
    return User(
      id: user.id,
      frist_name: user.frist_name,
      last_name: user.last_name,
      username: user.username,
      email: user.email,
      phone: user.phone,
      avatar: user.avatar,
      address: user.address,
      role_id: user.role_id,
      status: user.status,
      provinceid: user.provinceid,
      districtid: user.districtid,
      wardid: user.wardid,
      provincename: user.provincename,
      districtname: user.districtname,
      wardname: user.wardname,
      birthday: user.birthday,
    );
  }

  
}
