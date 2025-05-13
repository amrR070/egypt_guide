import 'package:flutter/material.dart';
import 'package:gp/ui/home/tabs/Governorate_Tab/governorate_item.dart';
import '../../../../remote/Api_Manager.dart';

class GovernoratesTab extends StatefulWidget {
  @override
  State<GovernoratesTab> createState() => _GovernoratesTabState();
}

class _GovernoratesTabState extends State<GovernoratesTab> {
  @override
  void initState() {
    super.initState();
    ApiManager.getAllGovernorates();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   alignment: Alignment.center,
              //   margin: EdgeInsets.only(bottom: 10),
              //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              //   decoration: BoxDecoration(
              //     color: Colors.blue.shade100,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Text(
              //     "All Governorates",
              //     style: TextStyle(
              //       fontSize: 20,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.blue[900],
              //     ),
              //   ),
              // ),

              Expanded(
                child: FutureBuilder(
                  future: ApiManager.getAllGovernorates(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Column(
                        children: [
                          Text(snapshot.error.toString()),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {});
                            },
                            child: Text("Try again"),
                          )
                        ],
                      );
                    }
                    var response = snapshot.data;
                    var allGovernorate = response?.allGovernorate ?? [];
                    return ListView.separated(
                      itemBuilder: (context, index) => GovernorateItem(
                          governorateModel: allGovernorate[index]),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: height * .03),
                      itemCount: allGovernorate.length,
                    );
                  },
                ),
              ),
            ],
            ),
        );
    }
}
