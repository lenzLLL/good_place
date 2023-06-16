import 'package:flutter/material.dart';
import 'package:good_place/common/style/App_Colors.dart';
import 'package:good_place/pages/login/Login.dart';
import 'package:good_place/widgets/Button1.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoarding1 extends StatefulWidget {
  const OnBoarding1({super.key});

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  int currentPage = 0;
  PageController page = PageController();
  List arr = [
      {
        "title":"Recherche rapide",
        "sub_title":"Activez votre localisation pour visiter les restaurant proches de chez-vous !",
        "icon":"assets/img/1.png"
      } ,
            {
        "title":"Recherchez un restaurant",
        "sub_title":"Activez votre localisation pour visiter les restaurant proches de chez-vous",
        "icon":"assets/img/2.png"
      } ,      {
        "title":"Menu diversifié",
        "sub_title":"Activez votre localisation pour visiter les restaurant proches de chez-vous",
        "icon":"assets/img/3.png"
      } ,      {
        "title":"Livraison à domicile",
        "sub_title":"Activez votre localisation pour visiter les restaurant proches de chez-vous",
        "icon":"assets/img/4.png"
      } ,
  ];
  @override
  void initState(){
      page.addListener(() { 
          currentPage = page.page?.round()??0;
          if(mounted)
          {
            setState(() {
              
            });
          }

      });
      super.initState();  
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Stack(
          children: [
              PageView.builder(controller: page, scrollDirection: Axis.horizontal, itemCount: arr.length, itemBuilder:(BuildContext context,int index){
                  var currentData = arr[index] as Map ?? {};
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                         Image.asset(currentData["icon"].toString(),width: size.width*0.45,height: size.height *0.45),
                         Text(currentData["title"].toString(),style:GoogleFonts.lato(color: AppColor.primaryText,fontSize: 24,fontWeight: FontWeight.w700),),
                         SizedBox(height: 5,),
                         Text(currentData["sub_title"].toString(),textAlign: TextAlign.center, style:GoogleFonts.lato(color: AppColor.primaryText,fontSize: 14,fontWeight: FontWeight.w500),),
                      ],
                  ) ; 
              }),
              Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      ButtonScreen(text: "Se Connecter",onpress:(){
                       Navigator.push(context,MaterialPageRoute(builder: (context)=>LoginScreen()));   
                      }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:arr.map((e){
                            var a = arr.indexOf(e);
                            return Container(
                              margin: const EdgeInsets.all(15),
                              height: 15,
                              width: 15,
                              decoration: BoxDecoration(
                                  color: currentPage == a?Colors.white:Colors.white54   ,
                                  borderRadius: BorderRadius.circular(7.5)
                              ),
                            );
                        }).toList()
                      )  
                  ],  
              )      
          ],  
      ),
    );
  }
}