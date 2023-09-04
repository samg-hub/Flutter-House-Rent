import 'package:flutter/material.dart';
import '../../../constant/ui.dart';
import '../cardviewPlace.dart';

class NearbyWidget extends StatefulWidget {
  const NearbyWidget({super.key});
  @override
  State<StatefulWidget> createState() {
    return NearbyWidgetState();
  }
}

class NearbyWidgetState extends State<NearbyWidget> {
  bool reademeStatus = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: dSpace_12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Nearby Place",
            style: TextStyle(color: colorText, fontSize: 20),
          ),
          SizedBox(
            height: dSpace_8 + dSpace_4,
          ),
          SizedBox(
            height: 320,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const CardViewplace(),
            ),
          ),
        ],
      ),
    );
  }

  void onTapClick() {
    setState(() {
      reademeStatus = !reademeStatus;
    });
  }
}
