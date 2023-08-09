
import 'package:flutter/material.dart';

import '../../../constant/ui.dart';
import '../Circleicon.dart';

class PlaceAppBar extends StatelessWidget {
  const PlaceAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: dSpace_16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Colors.black54,width: 0.5)
            ),
            child: const Row(
              children: [
                Icon(Icons.arrow_back_ios,color: Colors.black45,size: 14,),
                SizedBox(width: 12,),
                Text("Back",style: TextStyle(color: Colors.black87,fontSize: 16),)
              ],
            ),
          ),
          Row(
            children: [
              CircleIcon(icon: const Icon(Icons.heart_broken,color: Colors.black54,)),
              SizedBox(width: dSpace_8,),
              CircleIcon(icon: const Icon(Icons.upload,color: Colors.black54,)),
            ],
          )
        ],
      ),
    );
  }
}

