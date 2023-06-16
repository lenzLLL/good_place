import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/style/App_Colors.dart';


class ButtonScreen extends StatelessWidget {
  final String text;
  final VoidCallback onpress;
  const ButtonScreen({super.key, required this.text, required this.onpress});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10.0,left: 10.0,bottom: 10.0),
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: onpress,style: ElevatedButton.styleFrom(backgroundColor: Color(0xffffffff),onPrimary: AppColor.primaryColor,), child:Text(text,style:GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 18)) ));
}
}