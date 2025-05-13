import 'package:flutter/material.dart';
import 'package:gp/ui/home/tabs/Governorate_Tab/All_Governorates_Places_Item.dart';

import '../../../../remote/Api_Manager.dart';

class AllGovernoratePlaces extends StatelessWidget {
  static const routeName = "allGovernoratePlaces";

  const AllGovernoratePlaces({super.key});

  @override
  Widget build(BuildContext context) {
    final String govName = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(govName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder(
          future: ApiManager.getAllGovPlaces(govName),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError || snapshot.data == null) {
              return const Center(child: Text("Error loading data"));
            }
            else {
              final places = snapshot.data!.places ?? [];

              return ListView.separated(
                itemCount: places.length,
                separatorBuilder: (context, index) => const SizedBox(height: 20),
                itemBuilder: (context, index) {
                  return AllGovernoratesPlacesItem(placeModel: places[index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
