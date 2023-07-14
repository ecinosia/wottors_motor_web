import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_about_us_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_communication_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_home_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_product_list.dart';
import 'package:wottors_motor_web/widgets/scroll.dart';
import '../widgets/app_colors.dart';
import '../widgets/mobile_widgets/mobile_header.dart';
import 'package:carousel_slider/carousel_slider.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';

class MobileProductDetailsPage extends StatefulWidget {
  final Map<String, dynamic> productDetails;
  final List<String> imageUrls;

  const MobileProductDetailsPage(
      {Key? key, required this.productDetails, required this.imageUrls})
      : super(key: key);

  @override
  _MobileProductDetailsPageState createState() =>
      _MobileProductDetailsPageState();
}

class _MobileProductDetailsPageState extends State<MobileProductDetailsPage> {
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
                  CustomScrollbarWithSingleChildScrollView(
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            child: Text(
                              "Tüm Ürünler > ",
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      color: AppColors.black, fontSize: 16)),
                            ),
                            onTap: () =>
                                Get.to(() => const MobileProductListPage()),
                          ),
                          GestureDetector(
                            child: Text(
                              "${widget.productDetails['name']}",
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      color: AppColors.black, fontSize: 16)),
                            ),
                            onTap: () =>
                                Get.to(() => const MobileProductListPage()),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        //Product Name
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 5, 0, 8),
                          child: Center(
                            child: Text(
                              '${widget.productDetails['name']}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                  textStyle: TextStyle(
                                      color: AppColors.mainBlue, fontSize: 24)),
                            ),
                          ),
                        ),
                        //Product Image Carousel
                        CarouselSlider(
                          options: CarouselOptions(
                              height: 200,
                              enableInfiniteScroll: true,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 1500),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true),
                          items: widget.imageUrls.map((imageUrls) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: Image.network(
                                    imageUrls,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        //Info Button
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 200,
                            height: 55,
                            child: ElevatedButton(
                              onPressed: () =>
                                  Get.to(() => const MobileCommunicationPage()),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainBlue,
                                shadowColor: AppColors.black,
                              ),
                              child: Text(
                                "BİLGİ AL!",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.josefinSans(
                                    textStyle: TextStyle(
                                        color: AppColors.white, fontSize: 25)),
                              ),
                            ),
                          ),
                        ),

                        Stack(
                          children: [
                            Container(
                              width: screenSize.width / 1.1,
                              height: 360,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                      color: AppColors.mainBlue, width: 2),
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                              child: Text(
                                "ÜRÜN DETAYLARI",
                                style: GoogleFonts.rowdies(
                                    textStyle: TextStyle(
                                        color: AppColors.mainBlue,
                                        fontSize: 24)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50, left: 2),
                              child: DottedLine(
                                lineLength: screenSize.width / 1.098,
                                dashColor: AppColors.mainBlue,
                                lineThickness: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 60, 0, 0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: screenSize.width / 1.1,
                                    child: RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.didactGothic(
                                            color: AppColors.black,
                                            fontSize: 16),
                                        children: [
                                          const TextSpan(
                                              text: "Ürün İsmi: \n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900)),
                                          TextSpan(
                                              text:
                                                  "${widget.productDetails['name']}"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 1.1,
                                    child: RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.didactGothic(
                                            color: AppColors.black,
                                            fontSize: 16),
                                        children: [
                                          const TextSpan(
                                              text: "Ürün Kategorisi: \n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900)),
                                          TextSpan(
                                              text:
                                                  "${widget.productDetails['category']}")
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 1.1,
                                    child: RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.didactGothic(
                                            color: AppColors.black,
                                            fontSize: 16),
                                        children: [
                                          const TextSpan(
                                              text: "Ürün Durumu: \n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900)),
                                          TextSpan(
                                              text:
                                                  "${widget.productDetails['status']}")
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 1.1,
                                    child: RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.didactGothic(
                                            color: AppColors.black,
                                            fontSize: 16),
                                        children: [
                                          const TextSpan(
                                              text: "Uyumlu Araç Markası: \n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900)),
                                          TextSpan(
                                              text:
                                                  "${widget.productDetails['brand']}")
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 1.1,
                                    child: RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.didactGothic(
                                            color: AppColors.black,
                                            fontSize: 16),
                                        children: [
                                          const TextSpan(
                                              text: "Uyumlu Araç Modeli: \n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900)),
                                          TextSpan(
                                              text:
                                                  "${widget.productDetails['model']}")
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6,
                                  ),
                                  SizedBox(
                                    width: screenSize.width / 1.1,
                                    child: RichText(
                                      text: TextSpan(
                                        style: GoogleFonts.didactGothic(
                                            color: AppColors.black,
                                            fontSize: 16),
                                        children: const [
                                          TextSpan(
                                              text: "Ürün Stok Durumu: \n",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w900)),
                                          TextSpan(text: "Stokta Mevcut")
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: screenSize.width / 1.1,
                              height: 245,
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  border: Border.all(
                                      color: AppColors.mainBlue, width: 2),
                                  borderRadius: BorderRadius.circular(3)),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                              child: Text(
                                "ÜRÜN AÇIKLAMASI",
                                style: GoogleFonts.rowdies(
                                    textStyle: TextStyle(
                                        color: AppColors.mainBlue,
                                        fontSize: 24)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50, left: 2),
                              child: DottedLine(
                                lineLength: screenSize.width / 1.098,
                                dashColor: AppColors.mainBlue,
                                lineThickness: 2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 70, left: 8, right: 8),
                              child: SizedBox(
                                width: screenSize.width / 1.15,
                                child: Text(
                                  "${widget.productDetails['description']}",
                                  style: GoogleFonts.didactGothic(
                                      color: AppColors.black, fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
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
