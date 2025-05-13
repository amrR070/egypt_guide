import 'AllGovernorate.dart';

/// allGovernorate : [{"name":"Alexandria","photo":"https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Coat_of_Arms_-_Alexandria%2C_Egypt.svg/800px-Coat_of_Arms_-_Alexandria%2C_Egypt.svg.png"},{"name":"Aswan","photo":"https://upload.wikimedia.org/wikipedia/commons/5/5f/Emblem_Aswan_Governorate.jpg"},{"name":"Bahariya","photo":"https://upload.wikimedia.org/wikipedia/commons/1/19/Coat_of_Arms_of_Behira_Govenorate.png"},{"name":"Cairo","photo":"https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Emblem_Cairo_Governorate.svg/393px-Emblem_Cairo_Governorate.svg.png"},{"name":"Esna","photo":"https://media.istockphoto.com/id/183251675/photo/ancient-egyptian-pillars.jpg?s=612x612&w=0&k=20&c=7HZ2mw2L1k2ts6P8mHotlobeVrAd21irJ0H3zCou2e4="},{"name":"Fayoum","photo":"https://upload.wikimedia.org/wikipedia/commons/0/0e/Coat_of_arms_of_Fayoum_Governorate.jpg"},{"name":"Giza","photo":"https://upload.wikimedia.org/wikipedia/commons/c/c0/Coat_of_arms_of_Giza_Governorate.jpg"},{"name":"Ismailia","photo":"https://upload.wikimedia.org/wikipedia/commons/2/24/Emblem_Ismailia_Governorate.jpg"},{"name":"Kafr El-Sheikh","photo":"https://upload.wikimedia.org/wikipedia/commons/4/4f/Coat_of_arms_of_Kafr_El-Sheikh_Governorate.jpg"},{"name":"Luxor","photo":"https://upload.wikimedia.org/wikipedia/commons/9/90/Emblem_Luxor_Governorate.jpg"},{"name":"Matrouh","photo":"https://upload.wikimedia.org/wikipedia/commons/3/3e/Coat_of_arms_of_Matrouh_Governorate.jpg"},{"name":"Minya","photo":"https://upload.wikimedia.org/wikipedia/commons/thumb/f/f1/Coat_of_arms_of_Minya_Govenorate.JPG/117px-Coat_of_arms_of_Minya_Govenorate.JPG"},{"name":"New Valley","photo":"https://i0.wp.com/landioustravel.com/wp-content/uploads/2022/05/New-Valley-Governorate-e1651652412280.jpg?fit=1200%2C675&ssl=1"},{"name":"Qena","photo":"https://upload.wikimedia.org/wikipedia/commons/1/16/Emblem_Qena_Governorate.jpg"},{"name":"Rashid","photo":"https://upload.wikimedia.org/wikipedia/commons/4/4e/Rosetta-Montage.png"},{"name":"Red Sea","photo":"https://upload.wikimedia.org/wikipedia/commons/1/18/Coat_of_arms_of_Red_Sea_Governorate.JPG"},{"name":"Sharqia","photo":"https://upload.wikimedia.org/wikipedia/commons/5/56/Emblem_Sharqia_Governorate.jpg"},{"name":"Sinai","photo":"https://upload.wikimedia.org/wikipedia/commons/e/e5/Emblem_South_Sinai_Governorate.jpg"},{"name":"Siwa","photo":"https://upload.wikimedia.org/wikipedia/commons/e/e6/Matrouh_Governorate-logo.PNG"},{"name":"Sohag","photo":"https://upload.wikimedia.org/wikipedia/commons/c/c8/Emblem_Sohag_Governorate.jpg"},{"name":"Suez","photo":"https://upload.wikimedia.org/wikipedia/commons/b/b2/Coat_of_arms_of_Suze_Governorate.JPG"},{"name":"Tanta","photo":"https://safariword.com/wp-content/uploads/2024/06/%D9%85%D8%AF%D9%8A%D9%86%D8%A9-%D8%B7%D9%86%D8%B7%D8%A7.jpg"},{"name":"Wadi El Natrun","photo":"https://upload.wikimedia.org/wikipedia/commons/8/8d/WadiEl-NatrunPics.jpg"}]

class AllGovernoratesResponse {
  AllGovernoratesResponse({
      this.allGovernorate,});

  AllGovernoratesResponse.fromJson(dynamic json) {
    if (json['allGovernorate'] != null) {
      allGovernorate = [];
      json['allGovernorate'].forEach((v) {
        allGovernorate?.add(AllGovernorate.fromJson(v));
      });
    }
  }
  List<AllGovernorate>? allGovernorate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (allGovernorate != null) {
      map['allGovernorate'] = allGovernorate?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}