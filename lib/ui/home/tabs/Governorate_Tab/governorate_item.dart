import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp/Models/Governrate%20Model.dart';

import 'All_Governorate_places.dart';

class GovernorateItem extends StatelessWidget {
  final GovernorateModel governorateModel;
  const GovernorateItem({super.key, required this.governorateModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(AllGovernoratePlaces.routeName);

      },
      child: Column(
        children: [
          Image.asset(
            governorateModel.image,
            width: 150,
            fit: BoxFit.cover,
          ),
          SizedBox(height: height * .01,),
          Text(
            governorateModel.title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
