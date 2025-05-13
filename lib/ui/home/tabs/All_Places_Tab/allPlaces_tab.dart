
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gp/remote/Api_Manager.dart';
import 'package:gp/ui/home/tabs/All_Places_Tab/allPlaces_items.dart';


class AllPlaces_Tab extends StatefulWidget {
  const AllPlaces_Tab({super.key});

  @override
  State<AllPlaces_Tab> createState() => _AllPlaces_TabState();
}

class _AllPlaces_TabState extends State<AllPlaces_Tab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiManager.getAllPlaces();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FutureBuilder(
          future: ApiManager.getAllPlaces(),
          builder: (context, snapshot) {
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.hasError){
              return Column(
                children: [
                  Text(snapshot.hasError.toString()),
                  ElevatedButton(onPressed: () {
                    setState(() {

                    });
                  }, child: Text("try again"))
                ],
              );
            }
            var response = snapshot.data;
            var allPlaces = response?.places??[];
            return ListView.separated(
                itemBuilder: (context, index) => AllPlaces_Item(
                    ratingsModel: allPlaces[index]
                ),
                separatorBuilder: (context, index) => SizedBox(height: 12,),
                itemCount: allPlaces.length
            );
            },
          ),
    );
  }
}


