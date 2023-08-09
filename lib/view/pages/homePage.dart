import 'package:flutter/material.dart';
import 'package:houserent/constant/text.dart';
import 'package:houserent/constant/ui.dart';
import 'package:houserent/view/components/placePage/Facilities.dart';
import 'package:houserent/view/components/placePage/aboutText.dart';
import 'package:houserent/view/components/placePage/topCard.dart';
import '../components/placePage/placeAppbar.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _homePage();
  }

}
class _homePage extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PlaceAppBar(),
                    TopCard(),
                    SizedBox(height: dSpace_8,),
                    AboutText(txtAbout: txt_About),
                    SizedBox(height: dSpace_16,),
                    Facilities(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

