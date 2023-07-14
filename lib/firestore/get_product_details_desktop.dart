import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_communication_page.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_product_list_page.dart';
import 'package:wottors_motor_web/widgets/app_colors.dart';
import 'package:wottors_motor_web/widgets/desktop_widgets/desktop_header.dart';
import 'package:footer/footer.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import '../screens/desktop_screens/desktop_about_us_page.dart';
import '../screens/desktop_screens/desktop_home_page.dart';

class DesktopProductDetailPage extends StatefulWidget {
  final Map<String, dynamic> productDetails;
  final List<String> imageUrls;
  const DesktopProductDetailPage({
    Key? key,
    required this.productDetails,
    required this.imageUrls,
  }) : super(key: key);

  @override
  State<DesktopProductDetailPage> createState() =>
      _DesktopProductDetailPageState();
}

class _DesktopProductDetailPageState extends State<DesktopProductDetailPage> {
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
  void dispose() {
    _scrollViewController.dispose();
    _scrollViewController.removeListener(() {});
    super.dispose();
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
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                    width: screenSize.width / 1.3,
                    height: screenSize.height * 1.7,
                    child: Column(
                      children: [
                        //Top Bar Name Etc.
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 5, 0, 0),
                          child: Row(children: [
                            InkWell(
                                child: Text(
                                  "Tüm Ürünler > ",
                                  style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 16)),
                                ),
                                onTap: () => Get.to(
                                    () => const DesktopProductListPage())),
                            InkWell(
                                child: Text(
                                  "${widget.productDetails['name']}",
                                  style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: AppColors.black,
                                          fontSize: 16)),
                                ),
                                onTap: () => Get.to(
                                    () => const DesktopProductListPage())),
                          ]),
                        ),
                        Column(
                          children: [
                            //Product Name
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Center(
                                child: Text(
                                  '${widget.productDetails['name']}',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.rubik(
                                      textStyle: TextStyle(
                                          color: AppColors.mainBlue,
                                          fontSize: 30)),
                                ),
                              ),
                            ),
                            //Carousel
                            Padding(
                              padding: const EdgeInsets.only(top: 45),
                              child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: 700,
                                  height: 350,
                                  child: CarouselSlider(
                                      options: CarouselOptions(
                                          height: 350,
                                          enableInfiniteScroll: true,
                                          autoPlay: true,
                                          autoPlayInterval:
                                              const Duration(seconds: 3),
                                          autoPlayAnimationDuration:
                                              const Duration(
                                                  milliseconds: 1500),
                                          autoPlayCurve: Curves.ease,
                                          enlargeCenterPage: true),
                                      items: widget.imageUrls.map((imageUrl) {
                                        return Builder(
                                            builder: (BuildContext context) {
                                          return Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 5),
                                            child: Image.network(
                                              imageUrl,
                                              fit: BoxFit.fitHeight,
                                            ),
                                          );
                                        });
                                      }).toList()),
                                ),
                              ),
                            ),
                            //Info Button
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: 200,
                                height: 55,
                                child: ElevatedButton(
                                  onPressed: () => Get.to(
                                      () => const DesktopCommunicationPage()),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.mainBlue,
                                    shadowColor: AppColors.black,
                                  ),
                                  child: Text(
                                    "BİLGİ AL!",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.josefinSans(
                                        textStyle: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 25)),
                                  ),
                                ),
                              ),
                            ),
                            //Product Details
                            Stack(
                              children: [
                                Container(
                                  width: screenSize.width / 1.1,
                                  height: 415,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors.mainBlue, width: 2),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: DottedLine(
                                      dashColor: AppColors.mainBlue,
                                      lineThickness: 2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                  child: Text(
                                    "ÜRÜN DETAYLARI",
                                    style: GoogleFonts.rowdies(
                                        textStyle: TextStyle(
                                            color: AppColors.mainBlue,
                                            fontSize: 24)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 60, 0, 0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          width: screenSize.width / 1.1,
                                          child: RichText(
                                            text: TextSpan(
                                                style: GoogleFonts.didactGothic(
                                                    color: AppColors.black,
                                                    fontSize: 19),
                                                children: [
                                                  const TextSpan(
                                                      text: "Ürün İsmi: \n",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w900)),
                                                  TextSpan(
                                                      text:
                                                          "${widget.productDetails['name']}"),
                                                ]),
                                          )),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                          width: screenSize.width / 1.1,
                                          child: RichText(
                                              text: TextSpan(
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 19),
                                                  children: [
                                                const TextSpan(
                                                    text: "Ürün Kategorisi: \n",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                                TextSpan(
                                                    text:
                                                        "${widget.productDetails['category']}")
                                              ]))),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                          width: screenSize.width / 1.1,
                                          child: RichText(
                                              text: TextSpan(
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 19),
                                                  children: [
                                                const TextSpan(
                                                    text: "Ürün Durumu: \n",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                                TextSpan(
                                                    text:
                                                        "${widget.productDetails['status']}")
                                              ]))),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                          width: screenSize.width / 1.1,
                                          child: RichText(
                                              text: TextSpan(
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 19),
                                                  children: [
                                                const TextSpan(
                                                    text:
                                                        "Uyumlu Araç Markası: \n",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                                TextSpan(
                                                    text:
                                                        "${widget.productDetails['brand']}")
                                              ]))),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                          width: screenSize.width / 1.1,
                                          child: RichText(
                                              text: TextSpan(
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 19),
                                                  children: [
                                                const TextSpan(
                                                    text:
                                                        "Uyumlu Araç Modeli: \n",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                                TextSpan(
                                                    text:
                                                        "${widget.productDetails['model']}")
                                              ]))),
                                      const SizedBox(
                                        height: 6,
                                      ),
                                      SizedBox(
                                          width: screenSize.width / 1.1,
                                          child: RichText(
                                              text: TextSpan(
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          color:
                                                              AppColors.black,
                                                          fontSize: 19),
                                                  children: const [
                                                TextSpan(
                                                    text:
                                                        "Ürün Stok Durumu: \n",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w900)),
                                                TextSpan(text: "Stokta Mevcut")
                                              ]))),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            //Product Description
                            Stack(
                              children: [
                                Container(
                                  width: screenSize.width / 1.1,
                                  height: 185,
                                  decoration: BoxDecoration(
                                      color: AppColors.white,
                                      border: Border.all(
                                          color: AppColors.mainBlue, width: 2),
                                      borderRadius: BorderRadius.circular(3)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 50),
                                    child: DottedLine(
                                      dashColor: AppColors.mainBlue,
                                      lineThickness: 2,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                  child: Text(
                                    "ÜRÜN AÇIKLAMASI",
                                    style: GoogleFonts.rowdies(
                                        textStyle: TextStyle(
                                            color: AppColors.mainBlue,
                                            fontSize: 24)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 70, left: 8, right: 8),
                                  child: Text(
                                    "${widget.productDetails['description']}",
                                    style: GoogleFonts.didactGothic(
                                        color: AppColors.black, fontSize: 19),
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )),
              ),
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
                      "images/logo_text.png",
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
