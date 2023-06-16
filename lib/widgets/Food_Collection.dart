import 'package:flutter/material.dart';
import 'package:good_place/common/style/App_Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionFoodItemWidget extends StatelessWidget {
  final Map food;
  const CollectionFoodItemWidget({super.key, required this.food});

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
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
              width: size.width * 0.45,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: AppColor.secondaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5), topRight: Radius.circular(5)),
                child: Image.asset(
                  food["image"].toString(),
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [Colors.transparent, Colors.black12])),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 2,
                  decoration: BoxDecoration(color: AppColor.primaryColor),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  food["name"].toString(),
                  style: GoogleFonts.lato(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColor.primaryText),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  food["place"].toString(),
                  style: GoogleFonts.lato(
                      fontSize: 12,
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
