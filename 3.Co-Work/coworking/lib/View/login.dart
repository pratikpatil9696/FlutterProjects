import 'package:coworking/Controller/loginApi.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  
  @override
  State createState()=>_LoginState();
}

class _LoginState extends State{

  final TextEditingController _userIdController=TextEditingController();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 24          
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 44,
                        width: 44,
                        child: Image.asset("assets/Images/DF_Icon1.png"),
                      ),
        
                      Text("Co-working",
                        style: GoogleFonts.poppins(
                          fontWeight:FontWeight.w400,
                          fontSize:24,
                          color:const Color.fromRGBO(0, 0, 0, 1)
                       ),
                    ),
           
                    ],
                  ),
                ],
              ),
        
              const SizedBox(
                height: 90,
              ),
        
        
              Text("Mobile number or Email",
                style: GoogleFonts.poppins(
                  fontWeight:FontWeight.w400,
                  fontSize:16
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromRGBO(218, 218, 218, 1)
                      )
                  ),
                child: TextFormField(
                  controller: _userIdController,
                  decoration: const InputDecoration(
                    border: InputBorder.none            
                  ),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, .7)),
                ),
              ),
              
              const SizedBox(
                height:24
              ),
        
              Text("Password",
                style: GoogleFonts.poppins(
                  fontWeight:FontWeight.w400,
                  fontSize:16
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 56,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(249, 249, 249, 1),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromRGBO(218, 218, 218, 1)
                      )
                  ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none            
                  ),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Color.fromRGBO(0, 0, 0, .7)),
                ),
              ),
              
              const SizedBox(
                height: 180,
              ),
        
              GestureDetector(
                onTap: (){
                  
                  LoginAPI.loginAPIModel(_userIdController.text);

                  Navigator.pushReplacementNamed(context, 'Home');
                },
        
                child: Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(81, 103, 235, 1),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  alignment: Alignment.center,
                  child: Text("Log In",
                    style: GoogleFonts.poppins(
                      fontWeight:FontWeight.w700,
                      fontSize:16,
                      color:const Color.fromRGBO(255, 255, 255, 1)
                    ),
                  ),
                ),
              ),
        
              const SizedBox(
                height: 15,
              ),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New user?",
                    style: GoogleFonts.poppins(
                      fontWeight:FontWeight.w400,
                      fontSize:14,
                      color:const Color.fromRGBO(98,98, 98, 1)
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacementNamed(context, 'CreateAnAccount');
                    },
                    child: Text(" Create an account",
                      style: GoogleFonts.poppins(
                        fontWeight:FontWeight.w400,
                        fontSize:14,
                        color:const Color.fromARGB(255, 0, 21, 255)
                      ),
                    ),
                  ),
                ],
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}
