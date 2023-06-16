import 'package:flutter/material.dart';
import 'package:good_place/common/style/App_Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularBrandItemWidget extends StatelessWidget {
  final Map food;
  final int index;
  const PopularBrandItemWidget(
      {super.key, required this.food, required this.index});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(5.0),
      height: size.width * 0.3 + 40,
      width: size.width * 0.5,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            food["image"].toString(),
            width: size.width * 0.3,
            height: size.width * 0.3,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            food["name"],
            style: GoogleFonts.lato(
                color: AppColor.secondaryText, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.star,
                color: Color.fromARGB(255, 252, 228, 93),
              ),
              Text(
                "(4.1)",
                style: GoogleFonts.lato(color: AppColor.grey),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.place,
                color: AppColor.primaryColor,
              ),
              Text(
                food["place"].toString(),
                style: GoogleFonts.lato(color: AppColor.grey),
              )
            ],
          )
        ],
      ),
    );
  }
}
