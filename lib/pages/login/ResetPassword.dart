import 'package:flutter/material.dart';
import 'package:good_place/pages/login/Login.dart';
import 'package:good_place/widgets/TextField.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/style/App_Colors.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState() ;
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: InkWell(onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));}, child: Icon(Icons.arrow_back,color:Color.fromARGB(255, 19, 18, 18),size: 30,)),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                           Text("Mot de passe oublié ?",textAlign: TextAlign.center, style:GoogleFonts.lato(color: AppColor.secondaryText,fontSize: 24,fontWeight: FontWeight.w700),),
                           SizedBox(height: 5,),
                           Text("Réinitialiser votre mot de passe",textAlign: TextAlign.center, style:GoogleFonts.lato(color: AppColor.grey,fontSize: 14,fontWeight: FontWeight.w700),),
                           SizedBox(height: 10,),
                           TextFieldWidget(controller: txtEmail, hintText: "Email",type: TextInputType.emailAddress,),
                           Container(
                            margin: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
                            width: double.infinity,
                            height: 45,
                            child: ElevatedButton(onPressed:(){},style: ElevatedButton.styleFrom(backgroundColor: AppColor.primaryColor,onPrimary: Colors.white,), child:Text("Confirmer",style:GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 18)) ))
                           ,SizedBox(height: 5,),
                      
            ],
          )),
        ),
      ),
    );
  }
}