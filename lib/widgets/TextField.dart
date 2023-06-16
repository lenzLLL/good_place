import 'package:flutter/material.dart';
import 'package:good_place/common/style/App_Colors.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.ot = false,
      required this.type,
      this.isClear = false,
      this.onClearPressed});
  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final bool isClear;
  final bool ot;
  final VoidCallback? onClearPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        keyboardType: type,
        obscureText: ot,
        style: GoogleFonts.lato(fontSize: 16),
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            suffixIcon: isClear
                ? IconButton(
                    icon: Image.asset(
                      "assets/img/cancel.png",
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () {
                      if (onClearPressed != null) {
                        onClearPressed!();
                      }
                    },
                  )
                : null,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColor.primaryColor))),
      ),
    );
  }
}

class RoundedTextFieldWidget extends StatelessWidget {
  const RoundedTextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      this.ot = false,
      required this.type,
      this.isClear = false,
      this.onClearPressed,
      this.leftIcon});
  final TextEditingController controller;
  final String hintText;
  final TextInputType type;
  final bool isClear;
  final bool ot;
  final VoidCallback? onClearPressed;
  final Widget? leftIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColor.grey.withOpacity(0.2)),
      height: 40,
      width: double.infinity,
      child: TextField(
        controller: controller,
        keyboardType: type,
        obscureText: ot,
        style: GoogleFonts.lato(fontSize: 16),
        decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: InputBorder.none,
            prefixIcon: leftIcon,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            suffixIcon: isClear
                ? IconButton(
                    icon: Image.asset(
                      "assets/img/cancel.png",
                      width: 20,
                      height: 20,
                    ),
                    onPressed: () {
                      if (onClearPressed != null) {
                        onClearPressed!();
                      }
                    },
                  )
                : null,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
