import 'package:flutter/material.dart';
import 'package:houserent/constant/text.dart';
import 'package:houserent/constant/ui.dart';
import 'package:houserent/view/components/placePage/Facilities.dart';
import 'package:houserent/view/components/placePage/aboutText.dart';
import 'package:houserent/view/components/placePage/topCard.dart';
import '../components/placePage/NearbyWidget.dart';
import '../components/placePage/placeAppbar.dart';
import '../components/placePage/placeBottomBar.dart';

class PlacePage extends StatefulWidget{
  const PlacePage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    return _PlacePage();
  }

}
class _PlacePage extends State<PlacePage>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: dSpace_12,vertical: dSpace_8),
                    child: const PlaceAppBar(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: dSpace_12,right: dSpace_12,bottom: dSpace_12),
                    child: const TopCard(),
                  ),
                  SizedBox(height: dSpace_8,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: AboutText(txtAbout: txt_About),
                  ),
                  SizedBox(height: dSpace_16,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Facilities(),
                  ),
                  SizedBox(height: dSpace_16,),
                  NearbyWidget(),
                  SizedBox(height: 56 + dSpace_16,),
                ],
              ),
            ),
            Positioned(
              bottom: 0,left: 0,right: 0,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white,Colors.white.withOpacity(0.0)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter
                  )
                ),
              ),
            ),
            const Positioned(
              bottom: 0,right: 0,left: 0,
              child: PlaceBottomBar(),
            ),
          ],
        ),
      ),
    );
  }
}

// class PlacePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('ShrinkWrap Example'),
//         ),
//         body: ListView.builder(
//           shrinkWrap: true, // انتخاب shrinkWrap
//           scrollDirection: Axis.horizontal, // جهت عمودی
//           itemCount: 10, // تعداد آیتم‌ها
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               height: 50, // ارتفاع هر آیتم
//               margin: EdgeInsets.all(8), // حاشیه آیتم‌ها
//               color: Colors.blue,
//               child: Center(
//                 child: Text(
//                   'Item $index',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

