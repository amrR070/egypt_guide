import 'package:flutter/material.dart';

class AllPlacesDetails extends StatelessWidget {

  static const String routeName = "allPlacesDetails";
  const AllPlacesDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Pyramids"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: height * 0.015),
          Center(
              child: Image.asset(
              "assets/images/pyramids.jpg",
            height: 232,
            width: 388,
            fit: BoxFit.cover,
          )
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
                """The Egyptian pyramids are ancient masonry structures located in Egypt. Most were built as tombs for the pharaohs and their consorts during the Old and Middle Kingdom periods.[1][2][3] At least 138 identified pyramids have been discovered in Egypt.[4][5] Approximately 80 pyramids were built within the Kingdom of Kush, now located in the modern country of Sudan.

The earliest known Egyptian pyramids are at Saqqara, west of Memphis. Step-pyramid-like structures, like Mastaba 3808 attributed to pharaoh Anedjib,[6] may the predate the Pyramid of Djoser built c. 2630–2610 BCE during the Third Dynasty.[7] This pyramid and its surrounding complex are generally considered to be the world's oldest monumental structures constructed of dressed masonry.""",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
