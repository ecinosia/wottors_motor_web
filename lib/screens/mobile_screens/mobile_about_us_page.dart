import 'package:flutter/material.dart';
import 'package:footer/footer_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wottors_motor_web/widgets/app_colors.dart';

import '../../widgets/mobile_widgets/mobile_header.dart';
import '../../widgets/mobile_widgets/mobile_sidebar.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'package:footer/footer.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_communication_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_home_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_product_list.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileAboutUsPage extends StatefulWidget {
  const MobileAboutUsPage({super.key});

  @override
  State<MobileAboutUsPage> createState() => _MobileAboutUsPageState();
}

class _MobileAboutUsPageState extends State<MobileAboutUsPage> {
  bool aboutClick = true;
  bool visionClick = false;
  bool missionClick = false;

  void aboutClickFunc() {
    setState(() {
      aboutClick = true;
      visionClick = false;
      missionClick = false;
    });
  }

  void visionClickFunc() {
    setState(() {
      aboutClick = false;
      visionClick = true;
      missionClick = false;
    });
  }

  void missionClickFunc() {
    setState(() {
      aboutClick = false;
      visionClick = false;
      missionClick = true;
    });
  }

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
                  Stack(
                    children: [
                      //Background
                      Column(
                        children: [
                          Image.asset(
                            "images/contact_bg1.png",
                          ),
                          Image.asset(
                            "images/contact_bg1.png",
                          ),
                          Image.asset(
                            "images/contact_bg1.png",
                          ),
                          Image.asset(
                            "images/contact_bg1.png",
                          ),
                          Visibility(
                            visible: visionClick || missionClick,
                            child: Image.asset(
                              "images/contact_bg1.png",
                            ),
                          ),
                          Visibility(
                            visible: missionClick,
                            child: Image.asset(
                              "images/contact_bg1.png",
                            ),
                          ),
                          Image.asset(
                            "images/contact_bg_full.png",
                          ),
                        ],
                      ),
                      //Dots
                      Padding(
                        padding: const EdgeInsets.only(top: 70, left: 20),
                        child: Image.asset(
                          "images/contact_dots.png",
                          width: 100,
                        ),
                      ),
                      //Dots
                      Padding(
                        padding: const EdgeInsets.only(top: 70, left: 382),
                        child: Image.asset(
                          "images/contact_dots.png",
                          width: 100,
                        ),
                      ),
                      //Buttons
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: visionClickFunc,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.mainGold),
                                  child: Text(
                                    "VİZYONUMUZ",
                                    style: GoogleFonts.righteous(
                                        color: AppColors.white, fontSize: 15),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: aboutClickFunc,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.mainBlue),
                                  child: Text(
                                    "HAKKIMIZDA",
                                    style: GoogleFonts.righteous(
                                        color: AppColors.white, fontSize: 15),
                                  )),
                            ),
                            SizedBox(
                              height: 30,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: missionClickFunc,
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.mainOrange),
                                  child: Text(
                                    "MİSYONUMUZ",
                                    style: GoogleFonts.righteous(
                                        color: AppColors.white, fontSize: 15),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      //Vision
                      Visibility(
                        visible: visionClick,
                        child: Column(
                          children: [
                            //Vision1
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 170),
                                child: SizedBox(
                                  height: 700,
                                  width: 450,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "images/wottors_vision1.png",
                                        height: 400,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: SizedBox(
                                          width: 400,
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      "Wottors Motor Oto Yedek Parça olarak, otomobil tutkunlarının ihtiyaçlarını ",
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          textStyle: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 24))),
                                              TextSpan(
                                                  text:
                                                      "en uygun fiyatlarla ve en yüksek kalitede ",
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          textStyle: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                              TextSpan(
                                                  text:
                                                      "karşılamayı hedefliyoruz. Amacımız, sektörde lider bir konuma yükselerek müşterilerimize mükemmel bir deneyim sunmaktır.",
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          textStyle: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 24))),
                                            ]),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //Vision2
                            Center(
                              child: SizedBox(
                                height: 700,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_vision2.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Müşteri memnuniyeti, önceliğimizdir. ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "Bu nedenle, sürekli olarak müşterilerimizin beklentilerini aşmayı ve ihtiyaçlarına uygun çözümler sunmayı amaçlıyoruz. Dinamik ve profesyonel ekibimiz, deneyimleriyle sizlere en iyi hizmeti sağlamak için çalışmaktadır.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Vision3
                            Center(
                              child: SizedBox(
                                height: 700,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_vision3.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Teknolojik gelişmeleri yakından takip ederek, sektördeki yenilikleri ve trendleri takip ediyoruz. Böylece, araçlarınız için ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                            TextSpan(
                                                text:
                                                    "en son ve en kaliteli yedek parçaları ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "sunabiliyoruz. Araştırma ve geliştirme çalışmalarına sürekli yatırım yaparak, müşterilerimize en iyi ürünleri sunmayı hedefliyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Vision4
                            Center(
                              child: SizedBox(
                                height: 730,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_vision4.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Küresel pazarda rekabetçi bir oyuncu olmak için sürekli büyümeyi ve gelişmeyi hedefliyoruz. ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23))),
                                            TextSpan(
                                                text:
                                                    "Türkiye'nin dört bir yanına ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "yayılan hizmet ağımızla, arabanızın ihtiyaç duyduğu parçalara ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23))),
                                            TextSpan(
                                                text:
                                                    "en hızlı ve en ekonomik ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "şekilde ulaşmanızı sağlıyoruz. Müşterilerimize geniş bir marka ve model yelpazesi sunarak, araçlarının performansını artırmalarına yardımcı oluyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Vision5
                            Center(
                              child: SizedBox(
                                height: 700,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_vision5.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Çevreye ve sürdürülebilirliğe verdiğimiz önemle, çevre dostu ürünleri tercih ediyoruz. Sürdürülebilir uygulamalarla, ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                            TextSpan(
                                                text:
                                                    "doğal kaynakları korumak ve gelecek nesillere temiz bir çevre bırakmak ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text: "için çaba gösteriyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Vision6
                            Center(
                              child: SizedBox(
                                height: 700,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_vision6.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Wottors Motor Oto Yedek Parça olarak, müşterilerimizin güvenini kazanmak ve sektörde öncü bir marka olmak için kararlıyız. Sizlerle birlikte büyümek ve başarıya ulaşmak için çalışıyoruz. ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                            TextSpan(
                                                text:
                                                    "Kaliteli ürünlerimiz, uygun fiyatlarımız ve müşteri odaklı yaklaşımımızla ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "sizlere hizmet etmekten gurur duyuyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                          ]),
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
                      //About
                      Visibility(
                        visible: aboutClick,
                        child: Column(
                          children: [
                            //About1
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 170),
                                child: SizedBox(
                                  height: 700,
                                  width: 450,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "images/wottors_about1.png",
                                        height: 400,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: SizedBox(
                                          width: 400,
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      "En uygun fiyatlarla ve en yüksek kalitede ",
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          textStyle: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                              TextSpan(
                                                  text:
                                                      "sıfır ve çıkma yedek parçalar için verdiğimiz hizmet sayesinde hem cebiniz rahat edecek hem de arabanız! İşinde uzman ve deneyimli, dinamik ve profesyonel ekibimizle sizlere hizmet vermekten memnuniyet duyuyoruz.",
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          textStyle: TextStyle(
                                                    color: AppColors.white,
                                                    fontSize: 24,
                                                  ))),
                                            ]),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //About2
                            Center(
                              child: SizedBox(
                                height: 700,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_about2.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Wottors Motor Oto Yedek Parça, Konya merkezli bir Oto Yedek Parça mağazasıdır. Merkez ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                            TextSpan(
                                                text:
                                                    "Konya'dan Türkiye'nin dört bir yanına ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "hizmet vermeye devam ediyoruz. Arabanız için ihtiyacınız olan parçaya en hızlı ve en ekonomik şekilde sizlere ulaştırıyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //About3
                            Center(
                              child: SizedBox(
                                height: 750,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_about3.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Ford, Opel, Peugeot, Renault, Volkswagen, Audi, Toyota, Mercedes, BMW, Hyundai, Nissan, Seat, Fiat, Mazda, Skoda, Honda, Dacia, Citroen, Mitsubishi, Mini Cooper ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "sıfır ve çıkma yedek parçası için en uygun fiyatlar ve en kaliteli ürünler için en doğru yere geldiniz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23))),
                                            TextSpan(
                                                text:
                                                    "Wottors Motor Oto Yedek Parça olarak sizlere ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23))),
                                            TextSpan(
                                                text:
                                                    "en iyi ürünlerle hizmet edebilmek ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "için büyük bir emekle çalışıyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //About4
                            Center(
                              child: SizedBox(
                                height: 730,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_about4.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Müşteri memnuniyeti Wottors Motor Oto Yedek Parça olarak bizim için en önemli değerdir. Sizlere sunduğumuz ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23))),
                                            TextSpan(
                                                text:
                                                    "uygun fiyatlı ve kaliteli ürünlerle kazandığımız bu memnuniyeti artırmaya gayret ediyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                          ]),
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
                      //Mission
                      Visibility(
                        visible: missionClick,
                        child: Column(
                          children: [
                            //Mission1
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 170),
                                child: SizedBox(
                                  height: 700,
                                  width: 450,
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        "images/wottors_mission1.png",
                                        height: 400,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: SizedBox(
                                          width: 400,
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(children: [
                                              TextSpan(
                                                  text:
                                                      "Wottors Motor Oto Yedek Parça olarak, müşterilerimize en yüksek kalitede ürünler sunarak, otomotiv sektöründe ",
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          textStyle: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 24))),
                                              TextSpan(
                                                  text: "güvenilir bir çözüm ",
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          textStyle: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 24,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                              TextSpan(
                                                  text:
                                                      "sağlamayı hedefliyoruz. Amacımız, araç sahiplerinin ihtiyaçlarını karşılamak ve onlara sorunsuz bir sürüş deneyimi sunmaktır.",
                                                  style:
                                                      GoogleFonts.didactGothic(
                                                          textStyle: TextStyle(
                                                              color: AppColors
                                                                  .white,
                                                              fontSize: 24))),
                                            ]),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //Mission2
                            Center(
                              child: SizedBox(
                                height: 700,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_mission2.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Müşteri memnuniyetini önceliğimiz ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "olarak görüyoruz. Bu nedenle, ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                            TextSpan(
                                                text:
                                                    "güvenilir ve dürüst bir iş ilişkisi kurmak ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "için çaba gösteriyoruz. Müşterilerimizin beklentilerini anlamak ve onlara en iyi çözümleri sunmak için sürekli olarak kendimizi geliştiriyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Mission3
                            Center(
                              child: SizedBox(
                                height: 700,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_mission3.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Sektördeki yenilikleri ve teknolojik gelişmeleri takip ediyoruz. ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "En son araç modellerine uyumlu yedek parçaları tedarik ederek, müşterilerimize güvenilir ve kaliteli ürünler sunuyoruz. Tedarikçilerimizle yakın işbirliği yaparak, geniş bir marka ve model yelpazesine erişim sağlıyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Mission4
                            Center(
                              child: SizedBox(
                                height: 730,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_mission4.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Çevreye duyarlılık, misyonumuzun önemli bir parçasıdır. Sürdürülebilir uygulamaları benimseyerek, çevresel etkilerimizi minimize etmeye çalışıyoruz. ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23))),
                                            TextSpan(
                                                text:
                                                    "Geri dönüşüme ve atık yönetimine özen göstererek, ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "doğal kaynakları koruma konusunda sorumluluk alıyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 23))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Mission5
                            Center(
                              child: SizedBox(
                                height: 700,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_mission5.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Ekip olarak, işimizi tutkuyla yapıyoruz. Uzmanlığımızı ve deneyimimizi müşterilerimizin hizmetine sunmak için sürekli olarak kendimizi geliştiriyoruz. ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                            TextSpan(
                                                text:
                                                    "Eğitim ve yenilikçi düşünceye yatırım yaparak, ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "sektörde öncü bir konumda kalıyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Mission6
                            Center(
                              child: SizedBox(
                                height: 700,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_mission6.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Topluma karşı sorumluluklarımızın farkındayız. Sosyal sorumluluk projelerine katkıda bulunarak, toplumun gelişimine destek olmayı amaçlıyoruz. ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                            TextSpan(
                                                text:
                                                    "İnsanların güvenini kazanmak ve değerli bir iş ortağı olmak ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "için adil ticaret ilkelerine bağlı kalıyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                          ]),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            //Mission7
                            Center(
                              child: SizedBox(
                                height: 700,
                                width: 450,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "images/wottors_mission7.png",
                                      height: 400,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: SizedBox(
                                        width: 400,
                                        child: RichText(
                                          textAlign: TextAlign.center,
                                          text: TextSpan(children: [
                                            TextSpan(
                                                text:
                                                    "Wottors Motor Oto Yedek Parça olarak, müşterilerimize ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                            TextSpan(
                                                text:
                                                    "mükemmel bir deneyim sunmayı, sektörde öncü olmayı ve toplum için değer yaratmayı ",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24,
                                                        fontWeight:
                                                            FontWeight.bold))),
                                            TextSpan(
                                                text:
                                                    "amaçlıyoruz. Her adımda kaliteyi ve müşteri memnuniyetini ön planda tutuyoruz.",
                                                style: GoogleFonts.didactGothic(
                                                    textStyle: TextStyle(
                                                        color: AppColors.white,
                                                        fontSize: 24))),
                                          ]),
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
                    ],
                  )
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
