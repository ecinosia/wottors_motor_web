import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wottors_motor_web/screens/mobile_screens/categories/category22.dart';
import 'package:wottors_motor_web/screens/mobile_screens/categories/used_filter.dart';

import '../../../firestore/database_manager.dart';
import '../../../firestore/get_product_details_mobile.dart';
import '../../../widgets/app_colors.dart';
import '../../../widgets/mobile_widgets/mobile_header.dart';
import '../../../widgets/mobile_widgets/mobile_sidebar.dart';
import '../../../widgets/scroll.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_product_list.dart';
import 'category10.dart';
import 'category11.dart';
import 'category12.dart';
import 'category13.dart';
import 'category14.dart';
import 'category15.dart';
import 'category16.dart';
import 'category17.dart';
import 'category18.dart';
import 'category19.dart';
import 'category2.dart';
import 'category20.dart';
import 'category21.dart';
import 'category23.dart';
import 'category3.dart';
import 'category4.dart';
import 'category5.dart';
import 'category6.dart';
import 'category7.dart';
import 'category8.dart';
import 'category9.dart';
import 'new_filter.dart';

class KrankM extends StatefulWidget {
  const KrankM({super.key});

  @override
  State<KrankM> createState() => _KrankMState();
}

class _KrankMState extends State<KrankM> {
  final controller = ScrollController();
  navigateToProductDetails(Map<String, dynamic> productDetails) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MobileProductDetailsPage(
          productDetails: productDetails,
          imageUrls: [],
        ),
      ),
    );
  }

  List productDetailList = [];

  bool _showCategories = true;
  bool _showProdStatus = true;

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
            .where((product) => product['category'] == 'Krank')
            .toList();
      });
    }
  }

  updateData(
      String name, String category, int id, List<String> imageUrls) async {
    await DatabaseManager().updateProductList(name, category, id, imageUrls);
    fetchDatabaseList();
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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                "ÜRÜNLERİMİZ",
                style: GoogleFonts.bebasNeue(
                    textStyle:
                        TextStyle(color: AppColors.mainBlue, fontSize: 30)),
                textAlign: TextAlign.center,
              ),
            ),
            const DottedLine(),
            SizedBox(
              width: screenSize.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showCategories = !_showCategories;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      elevation: 0),
                  child: Row(
                    children: [
                      Text(
                        "Kategoriler ",
                        style: GoogleFonts.righteous(
                            textStyle: TextStyle(
                                fontSize: 20, color: AppColors.mainBlue)),
                        textAlign: TextAlign.left,
                      ),
                      Icon(
                        _showCategories
                            ? CupertinoIcons.arrowtriangle_down_fill
                            : CupertinoIcons.arrowtriangle_up_fill,
                        size: 15,
                        color: AppColors.mainBlue,
                      )
                    ],
                  ),
                ),
              ),
            ),
            CustomScrollbarWithSingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              child: Offstage(
                offstage: _showCategories,
                child: SizedBox(
                  height: 65,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: ElevatedButton(
                            onPressed: () =>
                                Get.to(() => const MobileProductListPage()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Tüm Ürünler",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(const KrankM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainGold),
                            child: Text("Krank",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(UstKapakM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Üst Kapak",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(EmmeManifoldM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Emme Manifoldu",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(TesisatM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Tesisat",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(PistonKoluM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Piston Kolu",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(TurboM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Turbo",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(MazotPompasiM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Mazot Pompası",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(VakumM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Vakum",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(SilindirKapakM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Silindir Kapağı",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(ByPassM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("ByPass",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(EnjektorM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Enjektör",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(UstKafesM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Üst Kafes",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(KasnakM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Kasnak",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(GazKelebegiM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Gaz Kelebeği",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(KarterHavalandirmaM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Karter Havalandırıcısı",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(EgrM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("EGR",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(SarjDinamosuM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Şarj Dinamosu",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(KapakM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Kapak",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(CikmaMotorM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Çıkma Motor",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(SifirMotorM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Sıfır Motor",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(MarsDinamosuM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Marş Dinamosu",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(SanzimanM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Şanzıman",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () => Get.to(YagKarteriM()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Yağ Karteri",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: screenSize.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _showProdStatus = !_showProdStatus;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      elevation: 0),
                  child: Row(
                    children: [
                      Text(
                        "Ürün Durumu ",
                        style: GoogleFonts.righteous(
                            textStyle: TextStyle(
                                fontSize: 20, color: AppColors.mainBlue)),
                        textAlign: TextAlign.left,
                      ),
                      Icon(
                        _showProdStatus
                            ? CupertinoIcons.arrowtriangle_down_fill
                            : CupertinoIcons.arrowtriangle_up_fill,
                        size: 15,
                        color: AppColors.mainBlue,
                      )
                    ],
                  ),
                ),
              ),
            ),
            CustomScrollbarWithSingleChildScrollView(
              controller: controller,
              scrollDirection: Axis.horizontal,
              child: Offstage(
                offstage: _showProdStatus,
                child: SizedBox(
                  height: 65,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: ElevatedButton(
                            onPressed: () =>
                                Get.to(() => const NewProductFilter()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Sıfır",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: ElevatedButton(
                            onPressed: () =>
                                Get.to(() => const UsedProductFilter()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainOrange),
                            child: Text("Çıkma",
                                style: GoogleFonts.righteous(
                                    textStyle: TextStyle(
                                        color: AppColors.black,
                                        fontSize: 18)))),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: productDetailList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(2, 0, 0, 0),
                          child:
                              Image.asset("images/wottors_product_card_bg.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                          child: Image.asset(
                              "images/wottors_product_card_details.png"),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(235, 340, 0, 0),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        MobileProductDetailsPage(
                                      productDetails: productDetailList[index],
                                      imageUrls: productDetailList[index]
                                          ['imageUrls'],
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset(
                                "images/wottors_product_card_buynow.png",
                                width: 250,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 315),
                          child: Center(
                            child: SizedBox(
                              width: 300,
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(34, 156.5, 0, 0),
                          child: Image.network(
                            productDetailList[index]['imageUrls'][0],
                            fit: BoxFit.cover,
                            width: 318,
                          ),
                        )
                      ],
                    );
                  }),
            ),
          ],
        ));
  }
}
