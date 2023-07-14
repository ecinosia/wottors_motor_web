// ignore_for_file: avoid_web_libraries_in_flutter

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import 'package:wottors_motor_web/screens/mobile_screens/mobile_about_us_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_communication_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_home_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_product_list.dart';
import 'package:wottors_motor_web/widgets/app_colors.dart';
import 'package:dotted_line/dotted_line.dart';

class MobileSideBar extends StatefulWidget {
  const MobileSideBar({super.key});

  @override
  State<MobileSideBar> createState() => _MobileSideBarState();
}

class _MobileSideBarState extends State<MobileSideBar> {
  void closeDrawer() {
    Navigator.of(context).pop();
  }

  _emaillaunchURL() async {
    const url = 'mailto:wottorsmotor@gmail.com';
    // ignore: deprecated_member_use
    if (await canLaunch(url)) {
      // ignore: deprecated_member_use
      await launch(url);
    } else {
      await Clipboard.setData(
          const ClipboardData(text: "wottorsmotor@gmail.com"));
      throw 'E-Posta Adresi Kopyalandı.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.grey,
      child: ListView(
        children: [
          //Header Logo
          DrawerHeader(
            child: InkWell(
                onTap: () => Get.to(const MobileHomePage()),
                child: Image.asset("images/wottors_logo.png")),
          ),
          //Home Page Button
          ListTile(
              leading: Icon(
                CupertinoIcons.house_fill,
                color: AppColors.mainBlue,
              ),
              title: Text(
                "ANA SAYFA",
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: 'BebasNeue',
                  fontSize: 15,
                ),
              ),
              onTap: () => Get.to(const MobileHomePage())),
          const DottedLine(),
          //Product Button
          ListTile(
              leading: Icon(
                CupertinoIcons.car_detailed,
                color: AppColors.mainBlue,
              ),
              title: Text(
                "ÜRÜNLERİMİZ",
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: 'BebasNeue',
                  fontSize: 15,
                ),
              ),
              onTap: () => Get.to(const MobileProductListPage())),
          const DottedLine(),
          //About Vision Mission Button
          ListTile(
              leading: Icon(
                CupertinoIcons.info_circle,
                color: AppColors.mainBlue,
              ),
              title: Text(
                "KURUMSAL",
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: 'BebasNeue',
                  fontSize: 15,
                ),
              ),
              onTap: () => Get.to(const MobileAboutUsPage())),
          const DottedLine(),
          //Communication Button
          ListTile(
              leading: Icon(
                CupertinoIcons.phone_circle,
                color: AppColors.mainBlue,
              ),
              title: Text(
                "İLETİŞİM",
                style: TextStyle(
                  color: AppColors.black,
                  fontFamily: 'BebasNeue',
                  fontSize: 15,
                ),
              ),
              onTap: () => Get.to(const MobileCommunicationPage())),
          const DottedLine(),
          //Back Button
          Expanded(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(225, 262, 0, 0),
                child: IconButton(
                    onPressed: closeDrawer,
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 40,
                      color: AppColors.mainBlue,
                    ))),
          ),
          //Social Media Icons
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => html.window.open(
                      "https://www.instagram.com/wottorsmotor/",
                      "Wottors Motor Instagram"),
                  icon: Image.asset(
                    "images/instagram_icon_blue.png",
                    width: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => html.window.open(
                      "https://www.facebook.com/WottorsMotor/",
                      "Wottors Motor Facebook"),
                  icon: Image.asset(
                    "images/facebook_icon_blue.png",
                    width: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => html.window.open(
                      "https://twitter.com/WottorsMotor",
                      "Wottors Motor Twitter"),
                  icon: Image.asset(
                    "images/twitter_icon_blue.png",
                    width: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => _emaillaunchURL(),
                  icon: Image.asset(
                    "images/gmail_icon_blue.png",
                    width: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => html.window.open(
                      "https://tr.pinterest.com/wottorsmotor/",
                      "Wottors Motor Pinterest"),
                  icon: Image.asset(
                    "images/pinterest_icon_blue.png",
                    width: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => html.window.open(
                      "https://4sq.com/3kNvBZp", "Wottors Motor FourSquare"),
                  icon: Image.asset(
                    "images/foursquare_icon_blue.png",
                    width: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
