import 'package:flutter/material.dart';
import 'package:good_place/pages/login/Login.dart';
import 'package:good_place/pages/login/ResetPassword.dart';
import 'package:good_place/widgets/TextField.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/style/App_Colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  TextEditingController txtMobile = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                           Text("Bienvenue\nSur Good Place",textAlign: TextAlign.center, style:GoogleFonts.lato(color: AppColor.secondaryText,fontSize: 24,fontWeight: FontWeight.w700),),
                           SizedBox(height: 5,),
                           Text("veillez vous enregistrer pour continuer",textAlign: TextAlign.center, style:GoogleFonts.lato(color: AppColor.grey,fontSize: 14,fontWeight: FontWeight.w700),),
                           SizedBox(height: 10,),
                           TextFieldWidget(controller: txtEmail, hintText: "Email", type: TextInputType.emailAddress,),
                           SizedBox(height: 5,),
                           TextFieldWidget(controller: txtMobile, hintText: "Contact", type: TextInputType.phone,),
                           SizedBox(height: 5,),
                           TextFieldWidget(controller: txtPassword, hintText: "Mot De Passe",type:TextInputType.none),
                           TextFieldWidget(controller: txtEmail, hintText: "Confirmer le mot de passe", type: TextInputType.none,),
                           SizedBox(height: 5,),
                           Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(onPressed:(){},style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor,onPrimary: Colors.white,), child:Text("S'enregistrer",style:GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 18)) ))
                           ,SizedBox(height: 5,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Text("Avez-vous déja un compte?",textAlign: TextAlign.right, style:GoogleFonts.lato(color: AppColor.grey,fontSize: 14,fontWeight: FontWeight.w700)  ),
                                TextButton(onPressed: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));
                                }, child:Text("Se connecter",textAlign: TextAlign.right, style:GoogleFonts.lato(color: AppColor.primaryColor,fontSize: 14,fontWeight: FontWeight.w700)))
                            ],
                           )
            ],
          )),
        ),
      ),
    );
  }
}