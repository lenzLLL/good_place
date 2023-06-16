import 'package:flutter/material.dart';
import 'package:good_place/common/style/App_Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextViewWidget extends StatelessWidget {
  const TextViewWidget(
      {super.key, required this.title, required this.onSeeTap});
  final String title;
  final VoidCallback onSeeTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.left,
            style: GoogleFonts.lato(
                color: AppColor.secondaryText,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          TextButton(
              onPressed: () {},
              child: Text("voir plus",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.lato(
                      color: AppColor.primaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w700)))
        ],
      ),
    );
  }
}
