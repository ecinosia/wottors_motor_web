import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wottors_motor_web/screens/desktop_screens/desktop_home_page.dart';
import 'package:wottors_motor_web/screens/mobile_screens/mobile_home_page.dart';
import 'widgets/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 670;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 670;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wottors Motor',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          isDesktop(context) ? const DesktopHomePage() : const MobileHomePage(),
    );
  }
}
