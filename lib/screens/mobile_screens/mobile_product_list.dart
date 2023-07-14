import 'package:flutter/material.dart';
import 'package:wottors_motor_web/firestore/get_product_list_mobile.dart';
import 'package:wottors_motor_web/widgets/mobile_widgets/mobile_sidebar.dart';
import '../../widgets/mobile_widgets/mobile_header.dart';

class MobileProductListPage extends StatefulWidget {
  const MobileProductListPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileProductListPage> createState() => _MobileProductListPageState();
}

class _MobileProductListPageState extends State<MobileProductListPage> {



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
      body: const GetProductListMobile(),
    );
  }
}
