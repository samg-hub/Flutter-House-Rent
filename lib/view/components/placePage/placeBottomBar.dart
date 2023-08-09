import 'package:flutter/material.dart';

import '../../../constant/ui.dart';

class PlaceBottomBar extends StatelessWidget {
  const PlaceBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: dSpace_16),
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.black.withAlpha(30),blurRadius:7,spreadRadius: 0,offset: const Offset(0, 3)),
              ],
              borderRadius: BorderRadius.circular(50)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: InkWell(
                    overlayColor: MaterialStateColor.resolveWith((states) => Colors.green),
                    borderRadius: BorderRadius.circular(30),
                    onTap: (){
                        
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: dSpace_32,vertical: dSpace_16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.navigation,color: Colors.black54,),
                            SizedBox(width: dSpace_4,),
                            const Text("Direction",style: TextStyle(color: Colors.black54,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: InkWell(
                    overlayColor: MaterialStateColor.resolveWith((states) => Colors.green),
                    borderRadius: BorderRadius.circular(30),
                    onTap: (){
                        
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: dSpace_32,vertical: dSpace_16),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.reset_tv_rounded,color: Colors.white,),
                            SizedBox(width: dSpace_4,),
                            const Text("Reserve",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

