import 'package:flutter/material.dart';
import 'package:good_place/common/style/App_Colors.dart';
import 'package:good_place/pages/bookmarker/Bookmarker.dart';
import 'package:good_place/pages/discovery/Discovery.dart';
import 'package:good_place/pages/profile/Profile.dart';
import 'package:good_place/pages/top_food/Top_Food.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/Home.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  TabController? tab;
  @override
  void initState() {
    tab = TabController(length: 5, vsync: this);
    tab?.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(controller: tab, children: [
        HomeScreen(),
        DiscoveryScreen(),
        BookMarker(),
        TopFood(),
        Profile()
      ]),
      bottomNavigationBar: BottomAppBar(
        child: TabBar(
          labelColor: AppColor.primaryColor,
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          unselectedLabelColor: AppColor.grey,
          labelStyle: GoogleFonts.lato(fontSize: 10),
          controller: tab,
          indicatorColor: Colors.transparent,
          onTap: (value) {},
          tabs: [
            Tab(
              icon: Image.asset(
                "assets/img/home_tab.png",
                color: tab?.index == 0 ? AppColor.primaryColor : AppColor.grey,
                fit: BoxFit.contain,
                width: 25,
                height: 25,
              ),
              text: "Accueil",
            ),
            Tab(
              icon: Image.asset(
                "assets/img/discovery_tab.png",
                color: tab?.index == 1 ? AppColor.primaryColor : AppColor.grey,
                fit: BoxFit.contain,
                width: 25,
                height: 25,
              ),
              text: "Découverte",
            ),
            Tab(
              icon: Image.asset(
                "assets/img/bookmark_tab.png",
                color: tab?.index == 2 ? AppColor.primaryColor : AppColor.grey,
                fit: BoxFit.contain,
                width: 25,
                height: 25,
              ),
              text: "Favoris",
            ),
            Tab(
              icon: Image.asset(
                "assets/img/top_foodie_tab.png",
                color: tab?.index == 3 ? AppColor.primaryColor : AppColor.grey,
                fit: BoxFit.contain,
                width: 25,
                height: 25,
              ),
              text: "Populaires",
            ),
            Tab(
              icon: Image.asset(
                "assets/img/my_profile_tab.png",
                color: tab?.index == 4 ? AppColor.primaryColor : AppColor.grey,
                fit: BoxFit.contain,
                width: 25,
                height: 25,
              ),
              text: "Profil",
            ),
          ],
        ),
      ),
    );
  }
}
