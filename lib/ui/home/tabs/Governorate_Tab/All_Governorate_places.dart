import 'package:flutter/material.dart';
import 'package:gp/Models/Governrate%20Model.dart';
import 'package:gp/ui/home/tabs/Governorate_Tab/All_Governorates_Places_Item.dart';

class AllGovernoratePlaces extends StatelessWidget {
  static const routeName = "allGovernoratePlaces";
  static  List<GovernorateModel> governoratePlaces =[
    GovernorateModel(
      title: "Pyramids",
      image: "assets/images/pyramids.jpg",
        rate: "4.9"
    ),


  ];
  const AllGovernoratePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Giza"),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => AllGovernoratesPlacesItem(
              governorateModel: governoratePlaces[index]
          ),
          separatorBuilder: (context, index) => SizedBox(height: 10,),
          itemCount: governoratePlaces.length
      ),
    );
  }
}
