import 'package:flutter/material.dart';
import 'package:good_place/common/style/App_Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CountryCollectionFoodItemWidget extends StatelessWidget {
  final Map food;
  final int index;
  const CountryCollectionFoodItemWidget(
      {super.key, required this.food, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.45,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))
          ]),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              width: size.width * 0.45,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  food["image"].toString(),
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration:
                BoxDecoration(color: AppColor.primaryColor.withOpacity(0.09)),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  food["name"].toString(),
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryText),
                ),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
