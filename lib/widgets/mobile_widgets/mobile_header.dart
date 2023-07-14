import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_home_page.dart';
import 'package:wottors_motor_web/widgets/app_colors.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class MobileHeader extends StatefulWidget {
  const MobileHeader({super.key});

  @override
  State<MobileHeader> createState() => _MobileHeaderState();
}

class _MobileHeaderState extends State<MobileHeader> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return headerNew(screenSize);
  }

  PreferredSize headerNew(Size screenSize) {
    return PreferredSize(
      preferredSize: Size(screenSize.width, 100),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Center(
              child: InkWell(
                onTap: () => Get.to(const MobileHomePage()),
                child: Image.asset(
                  "images/wottors_logo.png",
                  height: 95,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSize headerOld(Size screenSize) {
    return PreferredSize(
      preferredSize: Size(screenSize.width, 50),
      child: Column(
        children: [
          //Logo Place
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: InkWell(
              onTap: () => Get.to(const MobileHomePage()),
              child: Image.asset(
                "images/wottors_logo.png",
                width: screenSize.width,
                height: 60,
              ),
            ),
          ),
          //Communication Info Section
          Container(
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "images/phone-icon.png",
                  width: 35,
                  height: 35,
                ),
                const SizedBox(width: 5),
                Text(
                  "+90 506 456 4185",
                  style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 15,
                      color: AppColors.black),
                ),
                const SizedBox(width: 5),
                Image.asset(
                  "images/phone-icon.png",
                  width: 35,
                  height: 35,
                ),
                const SizedBox(width: 5),
                Text(
                  "+90 533 436 9350",
                  style: TextStyle(
                      fontFamily: 'BebasNeue',
                      fontSize: 15,
                      color: AppColors.black),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: () => html.window.open(
                      "https://www.instagram.com/wottorsmotor",
                      "Wottors Motor Instagram"),
                  child: Image.asset(
                    "images/instagram-icon.png",
                    width: 35,
                    height: 35,
                  ),
                ),
                const SizedBox(width: 4),
                TextButton(
                    onPressed: () => html.window.open(
                        "https://www.instagram.com/wottorsmotor",
                        "Wottors Motor Instagram"),
                    child: Text(
                      "@wottorsmotor",
                      style: TextStyle(
                        fontFamily: 'BebasNeue',
                        fontSize: 15,
                        color: AppColors.black,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
