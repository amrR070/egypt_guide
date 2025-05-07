import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp/Models/Governrate%20Model.dart';
import 'package:gp/ui/home/tabs/Governorate_Tab/Governorat_Places_details.dart';

class AllGovernoratesPlacesItem extends StatelessWidget {
  final GovernorateModel governorateModel;
  const AllGovernoratesPlacesItem({super.key,required this.governorateModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(GovernoratePlacesDetails.routeName);

      },
      child: Column(
        children: [
          SizedBox(height: height * 0.01,),
          Stack(
            children: [
              Image.asset(
                governorateModel.image,
                height: 232,
                width: 388,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(12),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.3),
                  //     blurRadius: 4,
                  //     offset: Offset(2, 2),
                  //   ),
                  // ],
                ),
                child: Text(
                  governorateModel.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  borderRadius: BorderRadius.circular(12),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.3),
                  //     blurRadius: 4,
                  //     offset: Offset(2, 2),
                  //   ),
                  // ],
                ),
                child: Row(
                  children: [
                    Text(
                      governorateModel.rate, // أو governorateModel.rating.toString()
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 18,
                    ),
                  ],
                ),
              ),
              ],
              ),
          ),
            ],
          ),
        ],
      ),
    );
  }
}
