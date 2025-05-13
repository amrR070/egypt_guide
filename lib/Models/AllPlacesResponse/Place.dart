/// name : "Anfushi Tombs"
/// photo : "https://mlrhpz8jmuut.i.optimole.com/cb:lD8R.5019e/w:auto/h:auto/q:mauto/f:best/ig:avif/id:bbc7b289e3380a6328261ba949de1f5d/https://www.egypttoursplus.com/South-east-corner-tombs-of-Anfushi-Alexandria-Photo-by-Roland-Unger.jpg"
/// googleRate : 5.00

class Place {
  Place({
      this.name, 
      this.photo, 
      this.googleRate,});

  Place.fromJson(dynamic json) {
    name = json['name'];
    photo = json['photo'];
    googleRate = json['googleRate'];
  }
  String? name;
  String? photo;
  num? googleRate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['photo'] = photo;
    map['googleRate'] = googleRate;
    return map;
  }

}