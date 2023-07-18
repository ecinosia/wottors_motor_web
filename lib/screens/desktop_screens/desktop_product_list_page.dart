import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:wottors_motor_web/firestore/get_product_list_desktop.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_about_us_page.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_communication_page.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_home_page.dart';
import 'package:wottors_motor_web/widgets/app_colors.dart';
import 'package:wottors_motor_web/widgets/desktop_widgets/desktop_header.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class DesktopProductListPage extends StatelessWidget {
  const DesktopProductListPage({super.key});

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

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 130),
        child: const DesktopHeader(),
      ),
      body: FooterView(
        // ignore: sort_child_properties_last
        children: const <Widget>[GetProductListDesktop()],
        footer: Footer(
          backgroundColor: AppColors.footerBG,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: DottedLine(
                  lineLength: screenSize.width / 1.16,
                  dashColor: AppColors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Logo
                  Padding(
                    padding: const EdgeInsets.only(top: 30, bottom: 30),
                    child: Image.asset(
                      "assets/images/logo_text.png",
                      width: 400,
                    ),
                  ),
                  //Nav Links
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: TextButton(
                          onPressed: () =>
                              Get.to(() => const DesktopHomePage()),
                          child: Text("ANA SAYFA",
                              style: GoogleFonts.rowdies(
                                  fontSize: 20, color: AppColors.white)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: TextButton(
                          onPressed: () =>
                              Get.to(() => const DesktopProductListPage()),
                          child: Text("ÜRÜNLERİMİZ",
                              style: GoogleFonts.rowdies(
                                  fontSize: 20, color: AppColors.white)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: TextButton(
                          onPressed: () =>
                              Get.to(() => const DesktopAboutUsPage()),
                          child: Text("KURUMSAL",
                              style: GoogleFonts.rowdies(
                                  fontSize: 20, color: AppColors.white)),
                        ),
                      ),
                      TextButton(
                        onPressed: () =>
                            Get.to(() => const DesktopCommunicationPage()),
                        child: Text("İLETİŞİM",
                            style: GoogleFonts.rowdies(
                                fontSize: 20, color: AppColors.white)),
                      ),
                    ],
                  ),
                  //Address Phone Social Media
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //Address Info
                      Padding(
                        padding: const EdgeInsets.only(bottom: 35),
                        child: Row(
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
                        padding: const EdgeInsets.only(bottom: 35),
                        child: Row(
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
                                        color: AppColors.white, fontSize: 16))
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 57),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Icon(
                                      CupertinoIcons.phone_fill,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  Text("+90 533 436 9350",
                                      style: GoogleFonts.didactGothic(
                                          color: AppColors.white, fontSize: 16))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Social Media Icons
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: IconButton(
                              onPressed: () => html.window.open(
                                  "https://www.instagram.com/wottorsmotor/",
                                  "Wottors Motor Instagram"),
                              icon: Image.asset(
                                "assets/images/instagram_icon.png",
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
                                "assets/images/facebook_icon.png",
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
                                "assets/images/twitter_icon.png",
                                width: 35,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: IconButton(
                              onPressed: () => _emaillaunchURL(),
                              icon: Image.asset(
                                "assets/images/gmail_icon.png",
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
                                "assets/images/pinterest_icon.png",
                                width: 35,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () => html.window.open(
                                "https://4sq.com/3kNvBZp",
                                "Wottors Motor FourSquare"),
                            icon: Image.asset(
                              "assets/images/foursquare_icon.png",
                              width: 35,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: DottedLine(
                  lineLength: screenSize.width / 1.16,
                  dashColor: AppColors.white,
                ),
              ),
              //Bottom Bar Designer Info
              Container(
                  height: 30,
                  color: AppColors.mainGold,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                          "Tüm Hakları Saklıdır. © 2023 • Wottors Motor Oto Yedek Parça • Bu websitesi "),
                      InkWell(
                        onTap: () => html.window.open(
                            "https://wa.me/905070078595",
                            "Furkan SARIDİKEN WhatsApp"),
                        child: const Text("Furkan SARIDİKEN"),
                      ),
                      const Text(" tarafından hazırlanmıştır."),
                    ],
                  ))
            ],
          ),
        ),
        flex: 8,
      ),
    );
  }
}
