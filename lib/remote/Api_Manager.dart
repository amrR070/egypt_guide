import 'dart:convert';

import 'package:gp/Models/AllGovernoratesResponse/AllGovernoratesResponse.dart';
import 'package:gp/Models/AllPlacesResponse/AllPlacesResponse.dart';
import 'package:http/http.dart' as http;

import '../Models/AllGovPlacesResponse/AllGovPlacesResponse.dart';

class ApiManager{

  static Future<AllPlacesResponse?> getAllPlaces() async{
    // https://egypt-guid26.runasp.net/api/Place/DisplayAllPlaces
    try{
      Uri url = Uri.https("egypt-guid26.runasp.net","api/Place/DisplayAllPlaces");
      var response = await http.get(url,);
      var json = jsonDecode(response.body);
      var allPlacesResponse = AllPlacesResponse.fromJson(json);
      return allPlacesResponse;
    }catch(error){
      print((error.toString()));
    }
  }
  static Future<AllGovernoratesResponse?> getAllGovernorates() async{
    // https://egypt-guid26.runasp.net/api/Governerate/All-Governorate
    try{
      Uri url = Uri.https("egypt-guid26.runasp.net","api/Governerate/All-Governorate");
      var response = await http.get(url,);
      var json = jsonDecode(response.body);
      var allGovernorates = AllGovernoratesResponse.fromJson(json);
      return allGovernorates;
    }catch(error){
      print((error.toString()));
    }
  }
  static Future<AllGovPlacesResponse?> getAllGovPlaces(String govName) async{
    // https://egypt-guid26.runasp.net/api/Governerate/GovernorateAndPlaces?name=Cairo
    try{
      Uri url = Uri.https(
          "egypt-guid26.runasp.net",
          "api/Governerate/GovernorateAndPlaces",
        {
          "name":govName
        }
      );
      var response = await http.get(url,);
      var json = jsonDecode(response.body);
      var allGovPlaces = AllGovPlacesResponse.fromJson(json);
      return allGovPlaces;
    }catch(error){
      print((error.toString()));
    }
  }
}


