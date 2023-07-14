import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_home_page.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_product_list_page.dart';
import 'dart:html' as html;
import '../../screens/desktop_screens/desktop_about_us_page.dart';
import '../../screens/desktop_screens/desktop_communication_page.dart';
import '../app_colors.dart';

class DesktopHeader extends StatefulWidget {
  const DesktopHeader({
    super.key,
  });

  @override
  State<DesktopHeader> createState() => _DesktopHeaderState();
}

class _DesktopHeaderState extends State<DesktopHeader> {
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
    var screenSize = MediaQuery.of(context).size;

    return headerNew(screenSize);
  }

  PreferredSize headerNew(Size screenSize) {
    return PreferredSize(
      preferredSize: Size(screenSize.width, 100),
      child: Column(
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(color: AppColors.footerBGtwo),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Icon(
                        CupertinoIcons.phone_fill,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "+90 506 456 4185",
                      style: GoogleFonts.didactGothic(
                          color: AppColors.white, fontSize: 16),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        CupertinoIcons.phone_fill,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      "+90 533 436 9350",
                      style: GoogleFonts.didactGothic(
                          color: AppColors.white, fontSize: 16),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () => html.window.open(
                      "https://www.instagram.com/wottorsmotor/",
                      "Wottors Motor Instagram"),
                  icon: Image.asset(
                    "images/instagram_icon.png",
                    width: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => html.window.open(
                      "https://www.facebook.com/WottorsMotor/",
                      "Wottors Motor Facebook"),
                  icon: Image.asset(
                    "images/facebook_icon.png",
                    width: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => html.window.open(
                      "https://twitter.com/WottorsMotor",
                      "Wottors Motor Twitter"),
                  icon: Image.asset(
                    "images/twitter_icon.png",
                    width: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => _emaillaunchURL(),
                  icon: Image.asset(
                    "images/gmail_icon.png",
                    width: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => html.window.open(
                      "https://tr.pinterest.com/wottorsmotor/",
                      "Wottors Motor Pinterest"),
                  icon: Image.asset(
                    "images/pinterest_icon.png",
                    width: 30,
                  ),
                ),
                IconButton(
                  onPressed: () => html.window.open(
                      "https://4sq.com/3kNvBZp", "Wottors Motor FourSquare"),
                  icon: Image.asset(
                    "images/foursquare_icon.png",
                    width: 30,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 85,
            decoration: BoxDecoration(color: AppColors.mainOrange),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton.icon(
                        onPressed: () => Get.to(() => const DesktopHomePage()),
                        icon: Icon(
                          CupertinoIcons.house_fill,
                          color: AppColors.mainBlue,
                          size: 32,
                        ),
                        label: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            "ANA SAYFA",
                            style: TextStyle(
                                fontFamily: "BebasNeue",
                                fontSize: 25,
                                color: AppColors.black),
                          ),
                        )),
                    TextButton.icon(
                        onPressed: () =>
                            Get.to(() => const DesktopProductListPage()),
                        icon: Icon(
                          CupertinoIcons.car_detailed,
                          color: AppColors.mainBlue,
                          size: 32,
                        ),
                        label: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            "ÜRÜNLERİMİZ",
                            style: TextStyle(
                                fontFamily: "BebasNeue",
                                fontSize: 25,
                                color: AppColors.black),
                          ),
                        )),
                  ],
                ),
                Image.asset("images/wottors_logo.png"),
                Row(
                  children: [
                    TextButton.icon(
                        onPressed: () =>
                            Get.to(() => const DesktopAboutUsPage()),
                        icon: Icon(
                          CupertinoIcons.info_circle,
                          color: AppColors.mainBlue,
                          size: 32,
                        ),
                        label: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            "KURUMSAL",
                            style: TextStyle(
                                fontFamily: "BebasNeue",
                                fontSize: 25,
                                color: AppColors.black),
                          ),
                        )),
                    TextButton.icon(
                        onPressed: () =>
                            Get.to(() => const DesktopCommunicationPage()),
                        icon: Icon(
                          CupertinoIcons.phone_circle,
                          color: AppColors.mainBlue,
                          size: 32,
                        ),
                        label: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            "İLETİŞİM",
                            style: TextStyle(
                                fontFamily: "BebasNeue",
                                fontSize: 25,
                                color: AppColors.black),
                          ),
                        )),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
