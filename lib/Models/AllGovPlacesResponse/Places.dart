/// name : "Ahmad Ibn Tulun Mosque"
/// photo : "https://beta.sis.gov.eg/media/238116/%D8%AC%D8%A7%D9%85%D8%B9-%D8%A3%D8%AD%D9%85%D8%AF-%D8%A8%D9%86-%D8%B7%D9%88%D9%84%D9%88%D9%86.jpg"
/// location : "https://www.google.com/maps/search/?api=1&query=Ahmad+Ibn+Tulun+Mosque"
/// visitingHours : "8 AM - 5 PM"
/// googleRate : 3.70
/// description : "One of the oldest mosques in Egypt built in the 9th century with a unique spiral minaret."
/// isFavorite : false
/// governmentName : "Cairo"
/// comments : []
/// tourguids : []
/// typeOfTourism : []
/// userRates : []

class Places {
  Places({
      this.name, 
      this.photo, 
      this.location, 
      this.visitingHours, 
      this.googleRate, 
      this.description, 
      this.isFavorite, 
      this.governmentName, 
      this.comments, 
      this.tourguids, 
      this.typeOfTourism, 
      this.userRates,});

  Places.fromJson(dynamic json) {
    name = json['name'];
    photo = json['photo'];
    location = json['location'];
    visitingHours = json['visitingHours'];
    googleRate = json['googleRate'];
    description = json['description'];
    isFavorite = json['isFavorite'];
    governmentName = json['governmentName'];
    comments = json['comments'] ?? [];
    tourguids = json['tourguids'] ?? [];
    typeOfTourism = json['typeOfTourism'] ?? [];
    userRates = json['userRates'] ?? [];

  }
  String? name;
  String? photo;
  String? location;
  String? visitingHours;
  num? googleRate;
  String? description;
  bool? isFavorite;
  String? governmentName;
  List<dynamic>? comments;
  List<dynamic>? tourguids;
  List<dynamic>? typeOfTourism;
  List<dynamic>? userRates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['photo'] = photo;
    map['location'] = location;
    map['visitingHours'] = visitingHours;
    map['googleRate'] = googleRate;
    map['description'] = description;
    map['isFavorite'] = isFavorite;
    map['governmentName'] = governmentName;
    if (comments != null) {
      map['comments'] = comments?.map((v) => v.toJson()).toList();
    }
    if (tourguids != null) {
      map['tourguids'] = tourguids?.map((v) => v.toJson()).toList();
    }
    if (typeOfTourism != null) {
      map['typeOfTourism'] = typeOfTourism?.map((v) => v.toJson()).toList();
    }
    if (userRates != null) {
      map['userRates'] = userRates?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}