// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_about_us_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_home_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_product_list.dart';
import 'package:wottors_motor_web/widgets/app_colors.dart';

import 'package:wottors_motor_web/widgets/mobile_widgets/mobile_header.dart';
import 'package:wottors_motor_web/widgets/mobile_widgets/mobile_sidebar.dart';

class MobileCommunicationPage extends StatefulWidget {
  const MobileCommunicationPage({super.key});

  @override
  State<MobileCommunicationPage> createState() =>
      _MobileCommunicationPageState();
}

class _MobileCommunicationPageState extends State<MobileCommunicationPage> {
  _emaillaunchURL() async {
    const url = 'mailto:wottorsmotor@gmail.com';
    if (await canLaunch(url)) {
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

    return Scaffold(
        drawer: const MobileSideBar(),
        appBar: AppBar(
          title: Center(
            child: PreferredSize(
              preferredSize: Size(screenSize.width, 90),
              child: const MobileHeader(),
            ),
          ),
          toolbarHeight: 120,
        ),
        body: FooterView(
            // ignore: sort_child_properties_last
            children: <Widget>[
              SingleChildScrollView(
                  child: Stack(
                children: <Widget>[
                  Image.asset("images/contact_bg.png"),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 230, 0, 0),
                    child: InkWell(
                      child: Image.asset(
                        "images/contact_web.png",
                        width: 340,
                        height: 99,
                      ),
                      onTap: () => html.window.open(
                          "www.wottorsmotor.com", "Wottors Motor Websitesi"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 300, 0, 0),
                    child: InkWell(
                        child: Image.asset(
                          "images/contact_mail.png",
                          width: 340,
                          height: 99,
                        ),
                        onTap: () => _emaillaunchURL()),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 370, 0, 0),
                    child: InkWell(
                      child: Image.asset(
                        "images/contact_phone1.png",
                        width: 340,
                        height: 99,
                      ),
                      onTap: () => html.window.open(
                          "https://wa.me/905064564185",
                          "Serkan Erkek Whatsapp İletişim"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 440, 0, 0),
                    child: InkWell(
                      child: Image.asset(
                        "images/contact_phone2.png",
                        width: 340,
                        height: 99,
                      ),
                      onTap: () => html.window.open(
                          "https://wa.me/905334369350",
                          "Servet Erkek Whatsapp İletişim"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(80, 510, 0, 0),
                    child: InkWell(
                      child: Image.asset(
                        "images/contact_address.png",
                        width: 340,
                        height: 99,
                      ),
                      onTap: () => html.window.open(
                          "https://goo.gl/maps/YLdEmt6oJqzL3God8",
                          "Wottors Motor Konum"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 585, 0, 0),
                    child: InkWell(
                      child: Image.asset(
                        "images/contact_map.png",
                        width: 360,
                        height: 300,
                      ),
                      onTap: () => html.window.open(
                          "https://goo.gl/maps/YLdEmt6oJqzL3God8",
                          "Wottors Motor Konum"),
                    ),
                  ),
                ],
              )),
            ],
            footer: Footer(
              backgroundColor: AppColors.footerBG,
              child: Column(
                children: [
                  //Top Dotted Line
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 10),
                    child: DottedLine(
                      lineLength: screenSize.width / 1.16,
                      dashColor: AppColors.white,
                    ),
                  ),
                  //Logo and Infos
                  Column(
                    children: [
                      //Logo
                      Padding(
                        padding: const EdgeInsets.only(top: 30, bottom: 30),
                        child: Image.asset(
                          "images/logo_text.png",
                          width: 400,
                        ),
                      ),
                      //Address, Phone, Social Media
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //Address Info
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    CupertinoIcons.location_solid,
                                    color: AppColors.white,
                                  ),
                                ),
                                Text(
                                    "Fatih Mah. Kesmetaş Sk. No:132 Selçuklu/KONYA",
                                    style: GoogleFonts.didactGothic(
                                        color: AppColors.white, fontSize: 16))
                              ],
                            ),
                          ),
                          //Two Phone Info
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        CupertinoIcons.phone_fill,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    Text("+90 506 456 4185",
                                        style: GoogleFonts.didactGothic(
                                            color: AppColors.white,
                                            fontSize: 16))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 57),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Icon(
                                          CupertinoIcons.phone_fill,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      Text("+90 533 436 9350",
                                          style: GoogleFonts.didactGothic(
                                              color: AppColors.white,
                                              fontSize: 16))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //Social Media Icons
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 17),
                                  child: IconButton(
                                    onPressed: () => html.window.open(
                                        "https://www.instagram.com/wottorsmotor/",
                                        "Wottors Motor Instagram"),
                                    icon: Image.asset(
                                      "images/instagram_icon.png",
                                      width: 35,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 17),
                                  child: IconButton(
                                    onPressed: () => html.window.open(
                                        "https://www.facebook.com/WottorsMotor/",
                                        "Wottors Motor Facebook"),
                                    icon: Image.asset(
                                      "images/facebook_icon.png",
                                      width: 35,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 17),
                                  child: IconButton(
                                    onPressed: () => html.window.open(
                                        "https://twitter.com/WottorsMotor",
                                        "Wottors Motor Twitter"),
                                    icon: Image.asset(
                                      "images/twitter_icon.png",
                                      width: 35,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 17),
                                  child: IconButton(
                                    onPressed: () => _emaillaunchURL(),
                                    icon: Image.asset(
                                      "images/gmail_icon.png",
                                      width: 35,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 17),
                                  child: IconButton(
                                    onPressed: () => html.window.open(
                                        "https://tr.pinterest.com/wottorsmotor/",
                                        "Wottors Motor Pinterest"),
                                    icon: Image.asset(
                                      "images/pinterest_icon.png",
                                      width: 35,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () => html.window.open(
                                      "https://4sq.com/3kNvBZp",
                                      "Wottors Motor FourSquare"),
                                  icon: Image.asset(
                                    "images/foursquare_icon.png",
                                    width: 35,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      //Nav Links
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextButton(
                              onPressed: () =>
                                  Get.to(() => const MobileHomePage()),
                              child: Text("ANA SAYFA",
                                  style: GoogleFonts.rowdies(
                                      fontSize: 20, color: AppColors.white)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextButton(
                              onPressed: () =>
                                  Get.to(() => const MobileProductListPage()),
                              child: Text("ÜRÜNLERİMİZ",
                                  style: GoogleFonts.rowdies(
                                      fontSize: 20, color: AppColors.white)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextButton(
                              onPressed: () =>
                                  Get.to(() => const MobileAboutUsPage()),
                              child: Text("KURUMSAL",
                                  style: GoogleFonts.rowdies(
                                      fontSize: 20, color: AppColors.white)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: TextButton(
                              onPressed: () =>
                                  Get.to(() => const MobileCommunicationPage()),
                              child: Text("İLETİŞİM",
                                  style: GoogleFonts.rowdies(
                                      fontSize: 20, color: AppColors.white)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Bottom Dotted Line
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: DottedLine(
                      lineLength: screenSize.width / 1.16,
                      dashColor: AppColors.white,
                    ),
                  ),
                  //Designer Info
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      height: 60,
                      color: AppColors.mainGold,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "• Tüm Hakları Saklıdır. © 2023 •",
                            textAlign: TextAlign.center,
                          ),
                          const Text(
                            "• Wottors Motor Oto Yedek Parça •",
                            textAlign: TextAlign.center,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Bu websitesi "),
                              InkWell(
                                onTap: () => html.window.open(
                                    "https://wa.me/905070078595",
                                    "Furkan SARIDİKEN WhatsApp"),
                                child: const Text("Furkan SARIDİKEN"),
                              ),
                              const Text(" tarafından hazırlanmıştır."),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            flex: 10));
  }
}
