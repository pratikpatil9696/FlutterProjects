import 'dart:convert';
import 'package:coworking/Controller/dialogeData.dart';
import 'package:coworking/Controller/getSlotsAPI.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class Home extends StatelessWidget{
  const Home({super.key});

  static List<dynamic> booking=[];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor:Colors.white,
      
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SizedBox(
                  height: 22,
                  width: 22,
                  child: Image.asset("assets/Images/DF_Icon1.png"),
                ),
                
                Text("Co-working",
                  style: GoogleFonts.poppins(
                    fontWeight:FontWeight.w700,
                    fontSize:14
                  ),
                ),

                const Spacer(),

                GestureDetector(
                  
                  onTap: ()async{
                  
                    Uri url = Uri.parse("https://demo0413095.mockable.io/digitalflake/api/get_bookings?user_id=1");
                    http.Response response = await http.get(url);
                    var responseData = json.decode(response.body);
                    
                      booking=responseData['bookings'];
                    
                    Navigator.pushNamed(context, 'Booking');
                  },
                  child: Container(
                    height: 30,
                    width: 131,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(81, 103, 235, 1),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow:const [
                        BoxShadow(
                          color:Color.fromRGBO(0, 0, 0, 0.2),
                          offset: Offset(1, 1),
                          blurRadius: 10
                        )
                      ]
                    ),
                    alignment: Alignment.center,
                    child: Text("Booking history",
                      style: GoogleFonts.poppins(
                        fontWeight:FontWeight.w500,
                        fontSize:14,
                        color:const Color.fromRGBO(255, 255, 255, 1)
                      ),
                    ),
                  ),
                )
              ],
            ),


            const SizedBox(
              height: 61,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Column(
                  
                  children: [
                    GestureDetector(
                      onTap: ()async{

                        DialogData.toggle=true;
                        GetSlotsAPI.getSlots();
                        Navigator.pushNamed(context, 'Desk');
                      },
                      child: Container(
                        height: 147,
                        width: 147,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(77, 96, 209, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset("assets/Images/Vector1.png"),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Text("Book Work\nStation",
                     style:GoogleFonts.poppins(
                      fontWeight:FontWeight.w400,
                      fontSize:20,
                     ), 
                     textAlign: TextAlign.center,
                    )
                  ],
                ),

                const SizedBox(
                  width: 10,
                ),

                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        
                        
                        DialogData.toggle=false;

                        Navigator.pushNamed(context, 'Desk');
                      },
                      child: Container(
                        height: 147,
                        width: 147,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(77, 96, 209, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset("assets/Images/meeting.png"),
                      ),
                    ),

                    const SizedBox(
                      height: 10,
                    ),

                    Text("Meeting\nroom",
                     style:GoogleFonts.poppins(
                      fontWeight:FontWeight.w400,
                      fontSize:20,
                     ), 
                     textAlign: TextAlign.center,
                    )
                  ],
                ),

                
              ],
            )
          ],
        ),
      ),
    );
}

}
