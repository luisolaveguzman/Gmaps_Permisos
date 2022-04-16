import 'package:flutter/material.dart';
import 'package:maps/app/ui/pages/gmaps/gmaps.dart';
import 'package:maps/app/ui/routes/pages.dart';
import 'package:maps/app/ui/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.SPLAH,
      routes: appRoutes(),
    );
  }
}
