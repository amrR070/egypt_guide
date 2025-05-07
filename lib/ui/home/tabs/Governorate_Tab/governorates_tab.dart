import 'package:flutter/material.dart';
import 'package:gp/Models/Governrate%20Model.dart';
import 'package:gp/ui/home/tabs/Governorate_Tab/governorate_item.dart';


class GovernoratesTab extends StatelessWidget {

  static  List<GovernorateModel> governs = [
    GovernorateModel(
      image: "assets/images/governorate.png",
      title: "Giza",
      rate: ""
    ),

  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
          itemBuilder: (context, index) => GovernorateItem(governorateModel: governs[index]),
          separatorBuilder: (context, index) => SizedBox(height: height * .03,),
          itemCount: governs.length
      ),
    );
  }
}
