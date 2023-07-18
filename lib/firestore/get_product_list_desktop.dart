import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wottors_motor_web/firestore/database_manager.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_product_list_page.dart';
import '../screens/desktop_screens/categories/category1.dart';
import '../screens/desktop_screens/categories/category2.dart';
import '../screens/desktop_screens/categories/category3.dart';
import '../screens/desktop_screens/categories/category4.dart';
import '../screens/desktop_screens/categories/category5.dart';
import '../screens/desktop_screens/categories/category6.dart';
import '../screens/desktop_screens/categories/category7.dart';
import '../screens/desktop_screens/categories/category8.dart';
import '../screens/desktop_screens/categories/category9.dart';
import '../screens/desktop_screens/categories/category10.dart';
import '../screens/desktop_screens/categories/category11.dart';
import '../screens/desktop_screens/categories/category12.dart';
import '../screens/desktop_screens/categories/category13.dart';
import '../screens/desktop_screens/categories/category14.dart';
import '../screens/desktop_screens/categories/category15.dart';
import '../screens/desktop_screens/categories/category16.dart';
import '../screens/desktop_screens/categories/category17.dart';
import '../screens/desktop_screens/categories/category18.dart';
import '../screens/desktop_screens/categories/category19.dart';
import '../screens/desktop_screens/categories/category20.dart';
import '../screens/desktop_screens/categories/category21.dart';
import '../screens/desktop_screens/categories/category22.dart';
import '../screens/desktop_screens/categories/category23.dart';
import '../screens/desktop_screens/categories/new_filter.dart';
import '../screens/desktop_screens/categories/used_filter.dart';
import '../widgets/app_colors.dart';
import 'get_product_details_desktop.dart';

class GetProductListDesktop extends StatefulWidget {
  const GetProductListDesktop({super.key});

  @override
  State<GetProductListDesktop> createState() => _GetProductListDesktopState();
}

class _GetProductListDesktopState extends State<GetProductListDesktop> {
  final controller = ScrollController();

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
        productDetailList = resultant;
      });
    }
  }

  updaeData(
      String name, String category, int id, List<String> imageUrls) async {
    await DatabaseManager().updateProductList(name, category, id, imageUrls);
    fetchDatabaseList();
  }

  bool _showCategories = false;
  bool _showProdStatus = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return getProductListDesktop(screenSize);
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
                                            fontSize: 18,
                                            fontWeight: FontWeight.w900)),
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
                                            fontSize: 18)),
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
                                            fontSize: 18)),
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
                                            fontSize: 18)),
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
                                            fontSize: 18)),
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
                                            fontSize: 18)),
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
