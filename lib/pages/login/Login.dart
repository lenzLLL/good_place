import 'package:flutter/material.dart';
import 'package:good_place/pages/login/OtpView.dart';
import 'package:good_place/pages/login/ResetPassword.dart';
import 'package:good_place/pages/login/SignUp.dart';
import 'package:good_place/widgets/TextField.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/style/App_Colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
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
                           Text("veillez vous connecter pour continuer",textAlign: TextAlign.center, style:GoogleFonts.lato(color: AppColor.grey,fontSize: 14,fontWeight: FontWeight.w700),),
                           SizedBox(height: 10,),
                           TextFieldWidget(controller: txtEmail, hintText: "Email", type: TextInputType.emailAddress,),
                           SizedBox(height: 5,),
                           TextFieldWidget(controller: txtPassword, hintText: "Mot De Passe",type:TextInputType.none),
                           Container(margin:const EdgeInsets.only(right: 10), child: Align(alignment: Alignment.topRight, child: TextButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>ResetPassword()));}, child: Text("Mot de passe oublié?",textAlign: TextAlign.right, style:GoogleFonts.lato(color: AppColor.primaryColor,fontSize: 14,fontWeight: FontWeight.w700),),))),
                           Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(onPressed:(){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>OtpScreen()));
                            },style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor,onPrimary: Colors.white,), child:Text("Connexion",style:GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 18)) ))
                           ,SizedBox(height: 5,),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                                Text("Avez-vous déja un compte?",textAlign: TextAlign.right, style:GoogleFonts.lato(color: AppColor.grey,fontSize: 14,fontWeight: FontWeight.w700)  ),
                                TextButton(onPressed: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>SignUpScreen()));
                                }, child:Text("S'enregistrer",textAlign: TextAlign.right, style:GoogleFonts.lato(color: AppColor.primaryColor,fontSize: 14,fontWeight: FontWeight.w700)))
                            ],
                           )
            ],
          )),
        ),
      ),
    );
  }
}