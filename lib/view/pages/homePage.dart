import 'package:flutter/material.dart';
import 'package:houserent/constant/ui.dart';
import 'package:houserent/view/components/homePage/homeAppBar.dart';
import 'package:houserent/view/components/homePage/homeCardView.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _homePage();
  }
}

class _homePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(dSpace_16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeAppBar(),
                    SizedBox(
                      height: dSpace_16,
                    ),
                    const HomeCardView()
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
