import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pageview/Screen/home_page.dart';

import '../sakil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  Future<void> goToScreen() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) =>  SwipePage().launch(context,isNewTask: true));
  }
  @override
  void initState() {
   goToScreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('images/splash.jpg'),fit: BoxFit.fill),
        ),
      ),

    );
  }
}
