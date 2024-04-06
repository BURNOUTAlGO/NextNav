import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:nextnav/constants/color.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text('NextNav',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 50,color:tdGreen,),),
            ),

            //SizedBox(height: 10),

           // Container(
             // padding: EdgeInsets.all(5.9),
             // decoration: BoxDecoration(color: tdGreen, borderRadius: BorderRadius.circular(40),),
             // child: Text("MARK YOUR STEPS",style: TextStyle(fontSize: 10.9, fontWeight: FontWeight.w800,color: tdgrey)),),
          ],
        ),
      ),
    );
  }
}
