import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:good_place/pages/tab/Main_Tab.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/style/App_Colors.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Position? position;
  String? _currentAddress = "";
  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(position!.latitude, position!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}, ${place.isoCountryCode}, ${place.locality}';
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Main()));
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
    return Scaffold(
        body: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/home_page_icon.png",
              width: screen.width * 0.5,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Hey, Bienvenue\nSur Good Place",
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.lato(color: AppColor.secondaryText, fontSize: 20),
            ),
            Text(_currentAddress == "" ? "" : _currentAddress.toString()),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Veillez activer la géolocalisation pour accéder aux restaurants proches de chez vous!",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      color: AppColor.secondaryText, fontSize: 12),
                )),
            Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    onPressed: () {
                      ;
                      fetchPosition();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.primaryColor,
                      onPrimary: Colors.white,
                    ),
                    child: Text("Activer la localisation",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.w700, fontSize: 18))))
          ],
        ),
      ),
    ));
  }
}
