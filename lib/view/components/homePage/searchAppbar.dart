import 'package:flutter/material.dart';

import '../../../constant/ui.dart';
class searchAppbar extends StatelessWidget {
  const searchAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
      margin: const EdgeInsets.only(left: 12,right: 12,bottom: 12,top: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 0.5,color: Colors.black26),
        borderRadius: const BorderRadius.all(Radius.circular(50))
      ),
      child: Row(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              icons_24(const Icon(Icons.location_on,color: Colors.green,)),
              SizedBox(width: dSpace_8,),
              const Text("Bail,IDN",style: TextStyle(color: Colors.black87),)
            ],
          ),
          const SizedBox(width: 24,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("where can i talk you?",style: TextStyle(color: Colors.black45),),
                icons_24(const Icon(Icons.search,color: Colors.black45,),)
              ],
            ),
          )
        ],
      ),
    );
  }
}