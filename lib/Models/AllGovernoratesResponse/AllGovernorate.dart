/// name : "Alexandria"
/// photo : "https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Coat_of_Arms_-_Alexandria%2C_Egypt.svg/800px-Coat_of_Arms_-_Alexandria%2C_Egypt.svg.png"

class AllGovernorate {
  AllGovernorate({
      this.name, 
      this.photo,});

  AllGovernorate.fromJson(dynamic json) {
    name = json['name'];
    photo = json['photo'];
  }
  String? name;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['photo'] = photo;
    return map;
  }

}