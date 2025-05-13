import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gp/Models/AllGovernoratesResponse/AllGovernorate.dart';
import 'All_Governorate_places.dart';

class GovernorateItem extends StatelessWidget {
  final AllGovernorate governorateModel;

  const GovernorateItem({super.key, required this.governorateModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AllGovernoratePlaces.routeName,
          arguments: governorateModel.name,
        );
      },
      child: Column(
        children: [
          Container(
            height: height * 0.20,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CachedNetworkImage(
              imageUrl: governorateModel.photo ?? "",
              fit: BoxFit.contain,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Icon(
                Icons.error,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
          Text(
            governorateModel.name ?? "",
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
