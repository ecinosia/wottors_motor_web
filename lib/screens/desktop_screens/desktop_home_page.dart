import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:footer/footer_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wottors_motor_web/screens/desktop_screens/categories/category1.dart';
import 'package:wottors_motor_web/screens/desktop_screens/categories/category19.dart';
import 'package:wottors_motor_web/screens/desktop_screens/categories/category22.dart';
import 'package:wottors_motor_web/screens/desktop_screens/categories/category9.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_about_us_page.dart';
import 'package:wottors_motor_web/widgets/app_colors.dart';
import 'package:wottors_motor_web/widgets/desktop_widgets/desktop_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:footer/footer.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_communication_page.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_product_list_page.dart';
import 'package:wottors_motor_web/widgets/onHover.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class DesktopHomePage extends StatefulWidget {
  const DesktopHomePage({super.key});

  @override
  State<DesktopHomePage> createState() => _DesktopHomePageState();
}

class _DesktopHomePageState extends State<DesktopHomePage> {
  final List<String> imageList = [
    'assets/images/ford_bg1.png',
    'assets/images/ford_bg2.png',
    'assets/images/ford_bg3.png',
    'assets/images/ford_bg4.png',
    'assets/images/ford_bg5.png',
  ];

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

  late ScrollController _scrollViewController;
  bool _showAppBar = true;
  bool isScrollingDown = false;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _scrollViewController.addListener(() {
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (!isScrollingDown) {
          isScrollingDown = true;
          _showAppBar = false;
          setState(() {});
        }
      }
      if (_scrollViewController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (isScrollingDown) {
          isScrollingDown = false;
          _showAppBar = true;
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: _showAppBar
          ? PreferredSize(
              preferredSize: Size(screenSize.width, 130),
              child: const DesktopHeader(),
            )
          : null,
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
                        height: 690,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1500),
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                      items: imageList.map((i) {
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
                                  if (i == 'assets/images/ford_bg1.png')
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            100, 75, 0, 0),
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                              "YEDEK PARÇA İÇİN\nEN DOĞRU TERCİH",
                                              textStyle:
                                                  GoogleFonts.staatliches(
                                                      color: AppColors.white,
                                                      fontSize: 65),
                                              textAlign: TextAlign.center,
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            ),
                                          ],
                                          totalRepeatCount: 1,
                                          pause:
                                              const Duration(milliseconds: 10),
                                          stopPauseOnTap: false,
                                          displayFullTextOnTap: false,
                                        )),
                                  if (i == 'assets/images/ford_bg2.png')
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            850, 200, 0, 0),
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                              "EN KALİTELİ\nEN EKONOMİK\nYEDEK PARÇALAR",
                                              textStyle:
                                                  GoogleFonts.staatliches(
                                                      color: AppColors.white,
                                                      fontSize: 65),
                                              textAlign: TextAlign.center,
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            ),
                                          ],
                                          totalRepeatCount: 1,
                                          pause:
                                              const Duration(milliseconds: 10),
                                          stopPauseOnTap: false,
                                          displayFullTextOnTap: false,
                                        )),
                                  if (i == 'assets/images/ford_bg3.png')
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            50, 375, 0, 0),
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                              "ARABANIZ İÇİN\nEN İYİ SEÇİM",
                                              textStyle:
                                                  GoogleFonts.staatliches(
                                                      color: AppColors.white,
                                                      fontSize: 65),
                                              textAlign: TextAlign.center,
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            ),
                                          ],
                                          totalRepeatCount: 1,
                                          pause:
                                              const Duration(milliseconds: 10),
                                          stopPauseOnTap: false,
                                          displayFullTextOnTap: false,
                                        )),
                                  if (i == 'assets/images/ford_bg4.png')
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            850, 235, 0, 0),
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                              "HEM ARABANIZI\nHEM CEBİNİZİ\nRAHATLATIN",
                                              textStyle:
                                                  GoogleFonts.staatliches(
                                                      color: AppColors.white,
                                                      fontSize: 65),
                                              textAlign: TextAlign.center,
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            ),
                                          ],
                                          totalRepeatCount: 1,
                                          pause:
                                              const Duration(milliseconds: 10),
                                          stopPauseOnTap: false,
                                          displayFullTextOnTap: false,
                                        )),
                                  if (i == 'assets/images/ford_bg5.png')
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            80, 45, 0, 0),
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                              "BİLGİ ALMAK İÇİN\nHEMEN ARAYIN",
                                              textStyle:
                                                  GoogleFonts.staatliches(
                                                      color: AppColors.white,
                                                      fontSize: 65),
                                              textAlign: TextAlign.center,
                                              speed: const Duration(
                                                  milliseconds: 200),
                                            ),
                                          ],
                                          totalRepeatCount: 1,
                                          pause:
                                              const Duration(milliseconds: 10),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Text(
                            "POPÜLER KATEGORİLERİMİZ",
                            style: GoogleFonts.staatliches(
                                fontSize: 40, color: AppColors.mainBlue),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Used And New Engines
                            MouseRegion(
                              cursor: MaterialStateMouseCursor.clickable,
                              child: GestureDetector(
                                onTap: () => Get.to(() => const CikmaMotorD()),
                                child: OnHover(builder: (isHovered) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Container(
                                      width: 300,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          color: AppColors.mainGold,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.black
                                                    .withOpacity(0.6),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3))
                                          ]),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/new_engine.png",
                                            width: 265,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "MOTORLAR",
                                            style: GoogleFonts.rowdies(
                                                color: AppColors.black,
                                                fontSize: 18),
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
                                onTap: () => Get.to(() => const KrankD()),
                                child: OnHover(builder: (isHovered) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Container(
                                      width: 300,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          color: AppColors.mainGold,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.black
                                                    .withOpacity(0.6),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3))
                                          ]),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/crank.png",
                                            width: 265,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "KRANKLAR",
                                            style: GoogleFonts.rowdies(
                                                color: AppColors.black,
                                                fontSize: 18),
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
                                onTap: () => Get.to(() => const SanzimanD()),
                                child: OnHover(builder: (isHovered) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 50),
                                    child: Container(
                                      width: 300,
                                      height: 300,
                                      decoration: BoxDecoration(
                                          color: AppColors.mainGold,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: AppColors.black
                                                    .withOpacity(0.6),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: const Offset(0, 3))
                                          ]),
                                      child: Column(
                                        children: [
                                          Image.asset(
                                            "assets/images/transmission.png",
                                            width: 265,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "ŞANZIMANLAR",
                                            style: GoogleFonts.rowdies(
                                                color: AppColors.black,
                                                fontSize: 18),
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
                                onTap: () =>
                                    Get.to(() => const SilindirKapagiD()),
                                child: OnHover(builder: (isHovered) {
                                  return Container(
                                    width: 300,
                                    height: 300,
                                    decoration: BoxDecoration(
                                        color: AppColors.mainGold,
                                        borderRadius: BorderRadius.circular(50),
                                        boxShadow: [
                                          BoxShadow(
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/images/cyclinder_head.png",
                                          width: 265,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "SİLİNDİR KAPAKLARI",
                                          style: GoogleFonts.rowdies(
                                              color: AppColors.black,
                                              fontSize: 18),
                                        )
                                      ],
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
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
                    child: Image.asset("assets/images/ford_bg7.png"),
                  ),
                  //Dotted Line
                  const SizedBox(
                    height: 25,
                    child: Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 12),
                      child: DottedLine(),
                    ),
                  ),
                  //Fourth Item - About Wottors
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
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
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Image.asset(
                                            "assets/images/team.png",
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
                                                textStyle:
                                                    GoogleFonts.didactGothic(
                                                        fontSize: 16,
                                                        color: AppColors.black),
                                                textAlign: TextAlign.center,
                                                duration:
                                                    const Duration(hours: 1),
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
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Image.asset(
                                            "assets/images/team.png",
                                            width: 240,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                          padding: const EdgeInsets.only(right: 50),
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
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Image.asset(
                                            "assets/images/fast_shipment.png",
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
                                                textStyle:
                                                    GoogleFonts.didactGothic(
                                                        fontSize: 16,
                                                        color: AppColors.black),
                                                textAlign: TextAlign.center,
                                                duration:
                                                    const Duration(hours: 1),
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
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Image.asset(
                                            "assets/images/fast_shipment.png",
                                            width: 240,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                          padding: const EdgeInsets.only(right: 50),
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
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Image.asset(
                                            "assets/images/happy_customer.png",
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
                                                textStyle:
                                                    GoogleFonts.didactGothic(
                                                        fontSize: 16,
                                                        color: AppColors.black),
                                                textAlign: TextAlign.center,
                                                duration:
                                                    const Duration(hours: 1),
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
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Image.asset(
                                            "assets/images/happy_customer.png",
                                            width: 240,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
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
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Image.asset(
                                            "assets/images/warranty.png",
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
                                                textStyle:
                                                    GoogleFonts.didactGothic(
                                                        fontSize: 16,
                                                        color: AppColors.black),
                                                textAlign: TextAlign.center,
                                                duration:
                                                    const Duration(hours: 1),
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
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              spreadRadius: 5,
                                              blurRadius: 7,
                                              offset: const Offset(0, 3))
                                        ]),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Image.asset(
                                            "assets/images/warranty.png",
                                            width: 240,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 12),
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
                        ),
                      ],
                    ),
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
                    child: Image.asset("assets/images/ford_bg8.png"),
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
              ),
            ),
          ],
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
                                            color: AppColors.white,
                                            fontSize: 16))
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
          flex: 10),
    );
  }

  Stack homePageCarousel1() {
    return Stack(
      children: [
        Image.asset("assets/images/ford_bg.jpg"),
      ],
    );
  }
}
