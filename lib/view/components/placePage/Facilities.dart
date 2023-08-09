import 'package:flutter/material.dart';
import '../../../constant/ui.dart';

class Facilities extends StatefulWidget{
  Facilities({super.key});
  @override
  State<StatefulWidget> createState() {
    return FacilitiesState();
  }
}
class FacilitiesState extends State<Facilities> {
  bool facililitiesStatus = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Facilities",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: dSpace_8 + dSpace_4,),
        Wrap(
          children: [
            CardItemFacilities("Swimming pool",Icons.pool),
            CardItemFacilities("Lounge bar & cafe",Icons.no_drinks),
            CardItemFacilities("Free wifi",Icons.wifi),
            CardItemFacilities("Air conditioner",Icons.air),
            facililitiesStatus== false?Padding(
              padding:  EdgeInsets.symmetric(horizontal: dSpace_8,vertical: dSpace_4),
              child: InkWell(
                overlayColor: MaterialStateColor.resolveWith((states) => Colors.blue),
                borderRadius: const BorderRadius.all(Radius.circular(30)),
                onTap: (){
                  setState(() {
                    facililitiesStatus = true;
                  });
                },
                child: Ink(
                  padding: EdgeInsets.symmetric(horizontal: dSpace_8,vertical: dSpace_8),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(31, 117, 161, 202),
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: const Text("+10",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 16),),
                ),
              ),
            ):Container(),
            facililitiesStatus== true?CardItemFacilities("Lounge bar & cafe",Icons.no_drinks):Container(),
            facililitiesStatus== true?CardItemFacilities("Free wifi",Icons.wifi):Container(),
            facililitiesStatus== true?CardItemFacilities("Air conditioner",Icons.air):Container(),
          ],
        )
      ],
    );
  }

  Container CardItemFacilities(String txt,IconData icon) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: dSpace_8,vertical: dSpace_4),
      padding: EdgeInsets.symmetric(horizontal: dSpace_8,vertical: dSpace_8),
      decoration: const BoxDecoration(
        color: Color.fromARGB(31, 117, 161, 202),
        borderRadius: BorderRadius.all(Radius.circular(30))
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icons_24(Icon(icon,color: Colors.black38,)),
          SizedBox(width: dSpace_8,),
          Text(txt,style: const TextStyle(color: Colors.black38),)
        ],
      ),
    );
  }
}

