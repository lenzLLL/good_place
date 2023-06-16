import 'package:flutter/material.dart';
import 'package:good_place/common/style/App_Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodItemWidget extends StatelessWidget {
  final Map food;
  const FoodItemWidget({super.key, required this.food});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.45,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 2, offset: Offset(0, 1))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              width: size.width * 0.45,
              height: size.width * 0.25,
              decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: Image.asset(
                  food["image"].toString(),
                  fit: BoxFit.cover,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  food["name"].toString(),
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColor.secondaryText),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  food["address"].toString(),
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColor.grey),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  food["category"].toString(),
                  style: GoogleFonts.lato(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColor.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
