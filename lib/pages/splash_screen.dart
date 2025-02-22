import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import '../controller/percent_of_tasks.dart';
import '../controller/pick_and_load_image.dart';
import '../service/hive_database.dart';
import '../string_text.dart';
import 'bottom_nav_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  HiveService get2 = Get.put(HiveService());
  ImageController imageController = Get.put(ImageController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get2.getTasksForSelectedDate(DateTime.now());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Percent
          .updatePercentView(); // Ensure percentView is updated when the home page is opened
      imageController.loadImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/img_1.png"))),
        child: Stack(children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                gradient: const LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white60, Colors.white]),
              ),
            ),
          ),
          ListView(
            children: [
              Image.asset(
                "assets/images/girl1.png",
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  title1,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  title2,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: 30.0,
              ),
              InkWell(
                splashColor: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(20.0),
                onTap: () {
                         Get.off(HomePage());

                  },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: const Color(0xff5f33e1),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2.0,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(child: Container()),
                      const Text(
                        "Let's Start",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child:
                            Icon(IconlyBold.arrow_right, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
