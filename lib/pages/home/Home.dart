import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_place/widgets/Country_Collection.dart';
import 'package:good_place/widgets/Food_Collection.dart';
import 'package:good_place/widgets/Food_item.dart';
import 'package:good_place/widgets/Popular_Brand.dart';
import 'package:good_place/widgets/TextField.dart';
import 'package:good_place/widgets/TextView.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/style/App_Colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Position? position;
  String? _currentAddress = "";
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position!.latitude, position!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}, ${place.isoCountryCode}, ${place.locality}';
      });
    });
  }

  fetchPosition() async {
    bool serviceEnable;
    LocationPermission permission;
    serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      Fluttertoast.showToast(msg: "Le service de localisation est désactivé");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "Vous avez refusé la localisation");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(
          msg: "Vous avez refusé la localisation pour toujours");
    }
    Position currentPosition = await Geolocator.getCurrentPosition();
    _getAddressFromLatLng(currentPosition);
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    TextEditingController search = TextEditingController();
    List array = [
      {
        "name": "Lombar Pizza",
        "address": "East 46th Street",
        "category": "Pizza, Italian",
        "image": "assets/img/l1.png"
      },
      {
        "name": "Sushi Bar",
        "address": "210 Salt Pond Rd.",
        "category": "Sushi, Japan",
        "image": "assets/img/l2.png"
      },
      {
        "name": "Steak House",
        "address": "East 46th Street",
        "category": "Steak, American",
        "image": "assets/img/l3.png"
      }
    ];
    List trenddingArray = [
      {
        "name": "Seafood Lee",
        "address": "210 Salt Pond Rd.",
        "category": "Seafood, Spain",
        "image": "assets/img/t1.png"
      },
      {
        "name": "Egg Tomato",
        "address": "East 46th Street",
        "category": "Egg, Italian",
        "image": "assets/img/t2.png"
      },
      {
        "name": "Burger Hot",
        "address": "East 46th Street",
        "category": "Pizza, Italian",
        "image": "assets/img/t3.png"
      }
    ];
    List collectionArray = [
      {"name": "Legendary food", "place": "34", "image": "assets/img/c1.png"},
      {"name": "Seafood", "place": "28", "image": "assets/img/c2.png"},
      {"name": "Fizza Meli", "place": "56", "image": "assets/img/c3.png"}
    ];
    List favoriteArray = [
      {"name": "American", "image": "assets/img/f1.png"},
      {"name": "France", "image": "assets/img/f2.png"},
      {"name": "Japan", "image": "assets/img/f3.png"},
      {"name": "health", "image": "assets/img/f4.png"},
      {"name": "American1", "image": "assets/img/f1.png"},
      {"name": "France1", "image": "assets/img/f2.png"},
      {"name": "Japan1", "image": "assets/img/f3.png"},
      {"name": "health1", "image": "assets/img/f4.png"}
    ];
    List popArray = [
      {
        "name": "Royal Food",
        "image": "assets/img/brand1.png",
        "place": "Ekélé"
      },
      {
        "name": "Cooking Mater",
        "image": "assets/img/brand2.jpg",
        "place": "Soa"
      },
      {
        "name": "Cuisine King",
        "image": "assets/img/brand3.jpg",
        "place": "Biyem-assi"
      },
      {
        "name": "Cooking Eat",
        "image": "assets/img/brand4.png",
        "place": "Ekélé"
      }
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  centerTitle: false,
                  leading: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back,
                        color: AppColor.primaryColor,
                      )),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Yaoundé, Ekélé",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                            fontSize: 20,
                            color: AppColor.secondaryText,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "votre position",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.lato(
                            fontSize: 16,
                            color: AppColor.grey,
                            fontWeight: FontWeight.normal),
                      )
                    ],
                  ),
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/img/notification.png",
                          width: 24,
                          height: 30,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/img/add.png",
                          width: 24,
                          height: 30,
                        ))
                  ],
                ),
                SliverAppBar(
                    backgroundColor: Colors.white,
                    automaticallyImplyLeading: false,
                    pinned: false,
                    floating: true,
                    primary: false,
                    leading: null,
                    title: RoundedTextFieldWidget(
                      controller: search,
                      type: TextInputType.text,
                      isClear: false,
                      onClearPressed: () {},
                      hintText: "Recherchez un restaurant...",
                      leftIcon: Icon(
                        Icons.search,
                        color: AppColor.grey,
                      ),
                    )),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextViewWidget(title: "Populaires", onSeeTap: () {}),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: array.length,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          Map item = array[index] as Map? ?? {};
                          return FoodItemWidget(food: item);
                        }),
                  ),
                  TextViewWidget(
                      title: "Trending this week-end", onSeeTap: () {}),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: array.length,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          Map item = trenddingArray[index] as Map? ?? {};
                          return FoodItemWidget(food: item);
                        }),
                  ),
                  TextViewWidget(title: "Collection", onSeeTap: () {}),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.65,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: array.length,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          Map item = collectionArray[index] as Map? ?? {};
                          return CollectionFoodItemWidget(food: item);
                        }),
                  ),
                  TextViewWidget(title: "Cuisines populaires", onSeeTap: () {}),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.65,
                    child: GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        scrollDirection: Axis.horizontal,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.6,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15),
                        itemCount: favoriteArray.length,
                        itemBuilder: (context, index) {
                          Map food = favoriteArray[index] as Map? ?? {};
                          return CountryCollectionFoodItemWidget(
                              food: food, index: index);
                        }),
                  ),
                  TextViewWidget(
                      title: "Restaurants populaires", onSeeTap: () {}),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.3 + 95,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: popArray.length,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        itemBuilder: (context, index) {
                          Map item = popArray[index] as Map? ?? {};
                          return PopularBrandItemWidget(
                            food: item,
                            index: index,
                          );
                        }),
                  )
                ],
              ),
            )));
  }
}
