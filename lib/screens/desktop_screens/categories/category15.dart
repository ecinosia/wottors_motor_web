import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wottors_motor_web/screens/desktop_screens/categories/used_filter.dart';
import 'new_filter.dart';
import '../../../firestore/database_manager.dart';
import '../../../firestore/get_product_details_desktop.dart';
import '../../../firestore/get_product_details_mobile.dart';
import '../../../widgets/app_colors.dart';
import '../../../widgets/desktop_widgets/desktop_header.dart';
import '../desktop_product_list_page.dart';
import 'category1.dart';
import 'category10.dart';
import 'category11.dart';
import 'category12.dart';
import 'category13.dart';
import 'category14.dart';
import 'category16.dart';
import 'category17.dart';
import 'category18.dart';
import 'category19.dart';
import 'category2.dart';
import 'category20.dart';
import 'category21.dart';
import 'category22.dart';
import 'category23.dart';
import 'category3.dart';
import 'category4.dart';
import 'category5.dart';
import 'category6.dart';
import 'category7.dart';
import 'category8.dart';
import 'category9.dart';
import 'package:flutter/services.dart';
import 'package:footer/footer_view.dart';
import 'package:footer/footer.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:url_launcher/url_launcher.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_communication_page.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_home_page.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_about_us_page.dart';

class KarterHavalandirmaD extends StatefulWidget {
  const KarterHavalandirmaD({super.key});

  @override
  State<KarterHavalandirmaD> createState() => _KarterHavalandirmaDState();
}

class _KarterHavalandirmaDState extends State<KarterHavalandirmaD> {
  final controller = ScrollController();
  navigateToProductDetails(Map<String, dynamic> productDetails) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MobileProductDetailsPage(
          productDetails: productDetails,
          // ignore: prefer_const_literals_to_create_immutables
          imageUrls: [],
        ),
      ),
    );
  }

  List productDetailList = [];

  @override
  void initState() {
    super.initState();
    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getProductsList();

    if (resultant == null) {
      // ignore: avoid_print
      print("Unable to retrieve");
    } else {
      setState(() {
        productDetailList = resultant
            .where((product) => product['category'] == 'Karter Havalandırıcısı')
            .toList();
      });
    }
  }

  updateData(
      String name, String category, int id, List<String> imageUrls) async {
    await DatabaseManager().updateProductList(name, category, id, imageUrls);
    fetchDatabaseList();
  }

  bool _showCategories = false;
  bool _showProdStatus = false;

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
          children: <Widget>[getProductListDesktop(screenSize)],
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
          flex: 8,
        ));
  }

  Row getProductListDesktop(Size screenSize) {
    return Row(
      children: [
        //Left Container Filter Section
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(100, 50, 0, 20),
              child: Container(
                width: screenSize.width / 5,
                height: screenSize.height,
                decoration: BoxDecoration(
                    border:
                        Border.all(color: AppColors.mainBlue.withOpacity(0.7)),
                    color: AppColors.white),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Categories Filter
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 180,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _showCategories = !_showCategories;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Kategoriler ",
                                    style: GoogleFonts.righteous(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.mainBlue),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Icon(
                                    _showCategories
                                        ? CupertinoIcons.arrowtriangle_down_fill
                                        : CupertinoIcons.arrowtriangle_up_fill,
                                    color: AppColors.mainBlue,
                                    size: 18,
                                  )
                                ],
                              )),
                        ),
                      ),
                      //Categories
                      Padding(
                        padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                        child: Offstage(
                          offstage: _showCategories,
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () => Get.to(
                                    () => const DesktopProductListPage()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Tüm Ürünler",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Get.to(() => const KrankD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Krank",
                                    textAlign: TextAlign.left,
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 18,
                                    )),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const UstKapakD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Üst Kapak",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 18,
                                    )),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const EmmeManifoldD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Emme Manifoldu",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 18,
                                    )),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Get.to(() => const TesisatD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Tesisat",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 18,
                                    )),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const PistonKoluD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Piston Kolu",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Get.to(() => const TurboD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Turbo",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const MazotPompasiD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Mazot Pompası",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Get.to(() => const VakumD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Vakum",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const SilindirKapagiD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Silindir Kapağı",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Get.to(() => const ByPassD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "ByPass",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const EnjektorD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Enjektör",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const UstKafesD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Üst Kafes",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Get.to(() => const KasnakD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Kasnak",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const GazKelebegiD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Gaz Kelebeği",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const KarterHavalandirmaD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Karter Havalandırıcısı",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Get.to(() => const EgrD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "EGR",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const SarjDinamosuD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Şarj Dinamosu",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Get.to(() => const KapakD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Kapak",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const CikmaMotorD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Çıkma Motor",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const SifirMotorD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Sıfır Motor",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const MarsDinamosuD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Marş Dinamosu",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const SanzimanD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Şanzıman",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const YagKarteriD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Yağ Karteri",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      //Status Filter
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 200,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _showProdStatus = !_showProdStatus;
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "Ürün Durumu ",
                                    style: GoogleFonts.righteous(
                                      textStyle: TextStyle(
                                          fontSize: 20,
                                          color: AppColors.mainBlue),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Icon(
                                    _showProdStatus
                                        ? CupertinoIcons.arrowtriangle_down_fill
                                        : CupertinoIcons.arrowtriangle_up_fill,
                                    color: AppColors.mainBlue,
                                    size: 18,
                                  )
                                ],
                              )),
                        ),
                      ),
                      //Status
                      Offstage(
                        offstage: _showProdStatus,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(18, 0, 0, 0),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const SifirUrunlerD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Sıfır",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Get.to(() => const CikmaUrunlerD()),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Çıkma",
                                    style: GoogleFonts.righteous(
                                        textStyle: TextStyle(
                                            color: AppColors.black,
                                            fontSize: 18)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        //Right Container Product Section
        Padding(
          padding: const EdgeInsets.fromLTRB(25, 50, 0, 20),
          child: SizedBox(
              width: screenSize.width / 1.52,
              height: screenSize.height,
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: productDetailList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Stack(
                        children: [
                          Image.asset("assets/images/product_desktop_bg.png",
                              width: 1000, height: 800),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                              child: Image.asset(
                                "assets/images/product_desktop_detail.png",
                                width: 210,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 85, 0, 0),
                              child: SizedBox(
                                width: 190,
                                child: Text(
                                  productDetailList[index]['name'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'BebasNeue',
                                      fontSize: 26,
                                      color: AppColors.mainGold),
                                  maxLines: 3,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                              child: Image.network(
                                productDetailList[index]['imageUrls'][0],
                                fit: BoxFit.cover,
                                width: 204.5,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 265, left: 110),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DesktopProductDetailPage(
                                        productDetails:
                                            productDetailList[index],
                                        imageUrls: productDetailList[index]
                                            ['imageUrls'],
                                      ),
                                    ),
                                  );
                                },
                                child: SizedBox(
                                  width: 120,
                                  height: 30,
                                  child: Image.asset(
                                    "assets/images/product_desktop_buynow1.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  })),
        ),
      ],
    );
  }
}
