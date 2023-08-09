import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:houserent/routing/routeGenerator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "appName",
      theme: ThemeData.dark(),
      initialRoute: '/homePage',
      // the routes are defined in generateRoute method
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}