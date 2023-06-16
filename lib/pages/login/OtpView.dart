import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:good_place/pages/location/Location.dart';
import 'package:good_place/pages/login/Login.dart';
import 'package:good_place/pages/tab/Main_Tab.dart';
import 'package:good_place/widgets/TextField.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/style/App_Colors.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 19, 18, 18),
              size: 30,
            )),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Vérification du contact",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: AppColor.secondaryText,
                    fontSize: 24,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Veillez entrer le code OTP",
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: AppColor.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 15,
              ),
              OtpTextField(
                numberOfFields: 5,
                borderColor: AppColor.grey,
                textStyle: GoogleFonts.lato(
                    color: AppColor.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
                focusedBorderColor: AppColor.primaryColor,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LocationScreen()),
                            (route) => true);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                        onPrimary: Colors.white,
                      ),
                      child: Text("Vérifier maintenant",
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w700, fontSize: 18)))),
              SizedBox(
                height: 5,
              ),
            ],
          )),
        ),
      ),
    );
  }
}
