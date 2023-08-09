import 'package:flutter/material.dart';

import '../../../constant/ui.dart';

class TopCard extends StatelessWidget{
  const TopCard({super.key});
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: 300,
          alignment: Alignment.topCenter,
          width: size.width,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            height: 250,
          ),
        ),
        Positioned(
          top: 200,left: 0,right: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: size.width,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withAlpha(10),blurRadius: 8,spreadRadius: 0,offset: const Offset(0, 20))],
              borderRadius: const BorderRadius.all(Radius.circular(20))
            ),
            child: Row(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("The Oasis lagoon Sanr",style: TextStyle(color: Colors.black87,fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: dSpace_4,),
                        Row(
                          children: [
                            icons_24(const Icon(Icons.star,color: Colors.black38,)),
                            const Text("4.8",style: TextStyle(color: Colors.black38),),
                            SizedBox(width: dSpace_8,),
                            icons_24(const Icon(Icons.navigation,color: Colors.black38,)),
                            const Text("21 miles",style: TextStyle(color: Colors.black38),),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      children: [
                        Text("/height",style: TextStyle(color: Colors.white),),
                        Text("\$55",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 24),),
                        Text("/night",style: TextStyle(color: Colors.black38),),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }

}