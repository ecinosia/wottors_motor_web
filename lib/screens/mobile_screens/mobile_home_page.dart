import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wottors_motor_web/screens/mobile_screens/categories/category1.dart';
import 'package:wottors_motor_web/screens/mobile_screens/categories/category19.dart';
import 'package:wottors_motor_web/screens/mobile_screens/categories/category22.dart';
import 'package:wottors_motor_web/screens/mobile_screens/categories/category9.dart';
import 'package:wottors_motor_web/widgets/mobile_widgets/mobile_header.dart';
import 'package:wottors_motor_web/widgets/mobile_widgets/mobile_sidebar.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_about_us_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_communication_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_product_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wottors_motor_web/widgets/app_colors.dart';

import '../../widgets/onhover.dart';

class MobileHomePage extends StatefulWidget {
  const MobileHomePage({super.key});

  @override
  State<MobileHomePage> createState() => _MobileHomePageState();
}

class _MobileHomePageState extends State<MobileHomePage> {
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
                child: Column(
              children: [
                //First Item - Carousel
                Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        height: 225,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1500),
                        autoPlayCurve: Curves.fastOutSlowIn),
                    items: [
                      'images/ford_bg1.png',
                      'images/ford_bg2.png',
                      'images/ford_bg3.png',
                      'images/ford_bg4.png',
                      'images/ford_bg5.png',
                    ].map((i) {
                      return Builder(builder: (BuildContext context) {
                        return Expanded(
                          child: SizedBox(
                            width: screenSize.width,
                            child: Stack(
                              children: [
                                Image.asset(
                                  i,
                                  width: screenSize.width,
                                ),
                                if (i == 'images/ford_bg1.png')
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 15, 0, 0),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            "YEDEK PARÇA İÇİN\nEN DOĞRU TERCİH",
                                            textStyle: GoogleFonts.staatliches(
                                                color: AppColors.white,
                                                fontSize: 26),
                                            textAlign: TextAlign.center,
                                            speed: const Duration(
                                                milliseconds: 200),
                                          ),
                                        ],
                                        totalRepeatCount: 1,
                                        pause: const Duration(milliseconds: 10),
                                        stopPauseOnTap: false,
                                        displayFullTextOnTap: false,
                                      )),
                                if (i == 'images/ford_bg2.png')
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          250, 70, 0, 0),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            "EN KALİTELİ\nEN EKONOMİK\nYEDEK PARÇALAR",
                                            textStyle: GoogleFonts.staatliches(
                                                color: AppColors.white,
                                                fontSize: 26),
                                            textAlign: TextAlign.center,
                                            speed: const Duration(
                                                milliseconds: 200),
                                          ),
                                        ],
                                        totalRepeatCount: 1,
                                        pause: const Duration(milliseconds: 10),
                                        stopPauseOnTap: false,
                                        displayFullTextOnTap: false,
                                      )),
                                if (i == 'images/ford_bg3.png')
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          50, 150, 0, 0),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            "ARABANIZ İÇİN\nEN İYİ SEÇİM",
                                            textStyle: GoogleFonts.staatliches(
                                                color: AppColors.white,
                                                fontSize: 26),
                                            textAlign: TextAlign.center,
                                            speed: const Duration(
                                                milliseconds: 200),
                                          ),
                                        ],
                                        totalRepeatCount: 1,
                                        pause: const Duration(milliseconds: 10),
                                        stopPauseOnTap: false,
                                        displayFullTextOnTap: false,
                                      )),
                                if (i == 'images/ford_bg4.png')
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          268, 85, 0, 0),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            "HEM ARABANIZI\nHEM CEBİNİZİ\nRAHATLATIN",
                                            textStyle: GoogleFonts.staatliches(
                                                color: AppColors.white,
                                                fontSize: 24),
                                            textAlign: TextAlign.center,
                                            speed: const Duration(
                                                milliseconds: 200),
                                          ),
                                        ],
                                        totalRepeatCount: 1,
                                        pause: const Duration(milliseconds: 10),
                                        stopPauseOnTap: false,
                                        displayFullTextOnTap: false,
                                      )),
                                if (i == 'images/ford_bg5.png')
                                  Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          30, 15, 0, 0),
                                      child: AnimatedTextKit(
                                        animatedTexts: [
                                          TypewriterAnimatedText(
                                            "BİLGİ ALMAK İÇİN\nHEMEN ARAYIN",
                                            textStyle: GoogleFonts.staatliches(
                                                color: AppColors.white,
                                                fontSize: 26),
                                            textAlign: TextAlign.center,
                                            speed: const Duration(
                                                milliseconds: 200),
                                          ),
                                        ],
                                        totalRepeatCount: 1,
                                        pause: const Duration(milliseconds: 10),
                                        stopPauseOnTap: false,
                                        displayFullTextOnTap: false,
                                      )),
                              ],
                            ),
                          ),
                        );
                      });
                    }).toList(),
                  ),
                ),
                //Dotted Line
                const SizedBox(
                  height: 25,
                  child: Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: DottedLine(),
                  ),
                ),
                //Second Item - Popular Categories
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        "POPÜLER KATEGORİLERİMİZ",
                        style: GoogleFonts.staatliches(
                            fontSize: 40, color: AppColors.mainBlue),
                      ),
                    ),
                    //Used And New Engines
                    MouseRegion(
                      cursor: MaterialStateMouseCursor.clickable,
                      child: GestureDetector(
                        onTap: () => Get.to(() => const CikmaMotorM()),
                        child: OnHover(builder: (isHovered) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 35),
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                  color: AppColors.mainGold,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3))
                                  ]),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "images/new_engine.png",
                                    width: 265,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "MOTORLAR",
                                    style: GoogleFonts.rowdies(
                                        color: AppColors.black, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    //Crankshafts
                    MouseRegion(
                      cursor: MaterialStateMouseCursor.clickable,
                      child: GestureDetector(
                        onTap: () => Get.to(() => const KrankM()),
                        child: OnHover(builder: (isHovered) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 35),
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                  color: AppColors.mainGold,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3))
                                  ]),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "images/crank.png",
                                    width: 265,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "KRANKLAR",
                                    style: GoogleFonts.rowdies(
                                        color: AppColors.black, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    //Used And New Transmission
                    MouseRegion(
                      cursor: MaterialStateMouseCursor.clickable,
                      child: GestureDetector(
                        onTap: () => Get.to(() => const SanzimanM()),
                        child: OnHover(builder: (isHovered) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 35),
                            child: Container(
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                  color: AppColors.mainGold,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3))
                                  ]),
                              child: Column(
                                children: [
                                  Image.asset(
                                    "images/transmission.png",
                                    width: 265,
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "ŞANZIMANLAR",
                                    style: GoogleFonts.rowdies(
                                        color: AppColors.black, fontSize: 18),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    //Cyclinder Head
                    MouseRegion(
                      cursor: MaterialStateMouseCursor.clickable,
                      child: GestureDetector(
                        onTap: () => Get.to(() => const SilindirKapakM()),
                        child: OnHover(builder: (isHovered) {
                          return Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                                color: AppColors.mainGold,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: AppColors.black.withOpacity(0.6),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3))
                                ]),
                            child: Column(
                              children: [
                                Image.asset(
                                  "images/cyclinder_head.png",
                                  width: 265,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "SİLİNDİR KAPAKLARI",
                                  style: GoogleFonts.rowdies(
                                      color: AppColors.black, fontSize: 18),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
                //Dotted Line
                const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: SizedBox(
                    height: 25,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: DottedLine(),
                    ),
                  ),
                ),
                //Third Item - Banner Image
                SizedBox(
                  width: screenSize.width,
                  child: Image.asset("images/ford_bg9.png"),
                ),
                //Dotted Line
                const SizedBox(
                  height: 25,
                  child: Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 15),
                    child: DottedLine(),
                  ),
                ),
                //Fourth Item - About Wottors
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: OnHover(builder: (isHovered) {
                        return isHovered
                            ? Container(
                                width: 315,
                                height: 315,
                                decoration: BoxDecoration(
                                    color: AppColors.mainOrange,
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Image.asset(
                                        "images/team.png",
                                        width: 195,
                                      ),
                                    ),
                                    Text(
                                      "Profesyonel Kadro",
                                      style: GoogleFonts.staatliches(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    AnimatedTextKit(
                                      animatedTexts: [
                                        FadeAnimatedText(
                                            "Alanında uzman ve deneyimli olan \n profesyonel kadromuzla sizlere\nhizmet vermekten mutluluk duyuyoruz.",
                                            textStyle: GoogleFonts.didactGothic(
                                                fontSize: 16,
                                                color: AppColors.black),
                                            textAlign: TextAlign.center,
                                            duration: const Duration(hours: 1),
                                            fadeInEnd: 0.00015)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: 315,
                                height: 315,
                                decoration: BoxDecoration(
                                    color: AppColors.mainOrange,
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Image.asset(
                                        "images/team.png",
                                        width: 240,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        "Profesyonel Kadro",
                                        style: GoogleFonts.staatliches(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: OnHover(builder: (isHovered) {
                        return isHovered
                            ? Container(
                                width: 315,
                                height: 315,
                                decoration: BoxDecoration(
                                    color: AppColors.mainOrange,
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Image.asset(
                                        "images/fast_shipment.png",
                                        width: 195,
                                      ),
                                    ),
                                    Text(
                                      "HIZLI TESLİMAT",
                                      style: GoogleFonts.staatliches(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    AnimatedTextKit(
                                      animatedTexts: [
                                        FadeAnimatedText(
                                            "Siparişlerinizi en güvenli, en hızlı \n ve en ekonomik yollarla\n sizlere ulaştırma garantisi veriyoruz.",
                                            textStyle: GoogleFonts.didactGothic(
                                                fontSize: 16,
                                                color: AppColors.black),
                                            textAlign: TextAlign.center,
                                            duration: const Duration(hours: 1),
                                            fadeInEnd: 0.00015)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: 315,
                                height: 315,
                                decoration: BoxDecoration(
                                    color: AppColors.mainOrange,
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Image.asset(
                                        "images/fast_shipment.png",
                                        width: 240,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        "HIZLI TESLİMAT",
                                        style: GoogleFonts.staatliches(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      }),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: OnHover(builder: (isHovered) {
                        return isHovered
                            ? Container(
                                width: 315,
                                height: 315,
                                decoration: BoxDecoration(
                                    color: AppColors.mainOrange,
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Image.asset(
                                        "images/happy_customer.png",
                                        width: 195,
                                      ),
                                    ),
                                    Text(
                                      "MÜŞTERİ MEMNUNİYETİ",
                                      style: GoogleFonts.staatliches(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    AnimatedTextKit(
                                      animatedTexts: [
                                        FadeAnimatedText(
                                            "Müşterilerimizin memnuniyeti bizim için\nen önemli noktadır. Her zaman müşteri\nmemnuniyeti için çalışıyoruz.",
                                            textStyle: GoogleFonts.didactGothic(
                                                fontSize: 16,
                                                color: AppColors.black),
                                            textAlign: TextAlign.center,
                                            duration: const Duration(hours: 1),
                                            fadeInEnd: 0.00015)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                width: 315,
                                height: 315,
                                decoration: BoxDecoration(
                                    color: AppColors.mainOrange,
                                    borderRadius: BorderRadius.circular(35),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Image.asset(
                                        "images/happy_customer.png",
                                        width: 240,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: Text(
                                        "MÜŞTERİ MEMNUNİYETİ",
                                        style: GoogleFonts.staatliches(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 32),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      }),
                    ),
                    OnHover(builder: (isHovered) {
                      return isHovered
                          ? Container(
                              width: 315,
                              height: 315,
                              decoration: BoxDecoration(
                                  color: AppColors.mainOrange,
                                  borderRadius: BorderRadius.circular(35),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3))
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Image.asset(
                                      "images/warranty.png",
                                      width: 195,
                                    ),
                                  ),
                                  Text(
                                    "GARANTİLİ ÜRÜNLER",
                                    style: GoogleFonts.staatliches(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23),
                                  ),
                                  AnimatedTextKit(
                                    animatedTexts: [
                                      FadeAnimatedText(
                                          "Ürünlerimizin her zaman arkasındayız.\nHerhangi bir sorun olması durumunda\nanında sizlere yardımcı oluyoruz.",
                                          textStyle: GoogleFonts.didactGothic(
                                              fontSize: 16,
                                              color: AppColors.black),
                                          textAlign: TextAlign.center,
                                          duration: const Duration(hours: 1),
                                          fadeInEnd: 0.00015)
                                    ],
                                  ),
                                ],
                              ),
                            )
                          : Container(
                              width: 315,
                              height: 315,
                              decoration: BoxDecoration(
                                  color: AppColors.mainOrange,
                                  borderRadius: BorderRadius.circular(35),
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.black.withOpacity(0.6),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3))
                                  ]),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5.0),
                                    child: Image.asset(
                                      "images/warranty.png",
                                      width: 240,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 12),
                                    child: Text(
                                      "GARANTİLİ ÜRÜNLER",
                                      style: GoogleFonts.staatliches(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 32),
                                    ),
                                  ),
                                ],
                              ),
                            );
                    }),
                  ],
                ),
                //Dotted Line
                const Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: SizedBox(
                    height: 25,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: DottedLine(),
                    ),
                  ),
                ),
                //Fifth Item - Banner Image
                SizedBox(
                  width: screenSize.width,
                  child: Image.asset("images/ford_bg10.png"),
                ),
                //Dotted Line
                const SizedBox(
                  height: 25,
                  child: Padding(
                    padding: EdgeInsets.only(top: 12, bottom: 12),
                    child: DottedLine(),
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
          flex: 10),
    );
  }
}
