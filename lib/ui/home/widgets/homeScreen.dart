
import 'package:flutter/material.dart';
import 'package:gp/style/AppColors.dart';

import '../tabs/category_tab.dart';
import '../tabs/costum_prog_tab.dart';
import '../tabs/Governorate_Tab/governorates_tab.dart';
import '../tabs/All_Places_Tab/rating_tab.dart';
class HomeScreen extends StatefulWidget {
  static const routeName = "home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentindex = 0;
  List<Widget> tabs = [
    RatingTab(),
    CategoryTab(),
    CostumProgTab(),
    GovernoratesTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Egypt Guide"),
        centerTitle: true,
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          currentIndex: currentindex,
          onTap: (index) {
            setState(() {
              currentindex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              backgroundColor: AppColors.lightBackgroundColor,
              label: "All Places"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded),
              label: "Categories"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt_outlined),
              label: "Custom Programs"
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.flag_sharp),
              label: "Governorates"
            ),
          ],
        ),
      ),
      body: tabs[currentindex],
    );
  }
}
