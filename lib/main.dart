import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nextnav/screens/Home.dart';
import 'package:nextnav/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  // from here
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  bool showSplash = true;
  showSplashScreen(){
    Future.delayed(Duration(seconds: 3),(){
      setState(() {
        showSplash = false;
      });
    });

  }
  @override
  void initState() {
    showSplashScreen();
    super.initState();
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Nextnav',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home:  showSplash? SplashScreen():Home(),
    );
  }
}
