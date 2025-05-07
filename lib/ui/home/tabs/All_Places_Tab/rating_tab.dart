
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp/ui/home/tabs/All_Places_Tab/ratings_items.dart';

import '../../../../Models/ratings_model.dart';

class RatingTab extends StatelessWidget {
  const RatingTab({super.key});
  static List<RatingsModel> ratingPlaces = [
    RatingsModel(
        image: "assets/images/pyramids.jpg",
        title: "Pyramids",
      rate: "4.5"
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
          itemBuilder: (context, index) => RatingsItem(ratingsModel: ratingPlaces[index]),
          separatorBuilder: (context, index) => SizedBox(height: 10,),
          itemCount: ratingPlaces.length
      ),
    );
  }
}
