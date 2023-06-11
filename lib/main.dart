import 'package:flutter/material.dart';
import 'package:news/style/theme/mytheme.dart';
import 'package:news/ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MyTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
