
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:work_done/todoxmodelclass.dart';
import 'login.dart';
class LoginSignup extends StatefulWidget {
  const LoginSignup({super.key});

  @override
  State createState() => _StateLoginSignup();
}

class _StateLoginSignup extends State {
  final GlobalKey<FormState> _formFieldKey = GlobalKey<FormState>();

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmpasswordController = TextEditingController();

  List<Map> userNameandPassword = [
    {"userNamemap": "pratik", "passWordmap": "1234"},
  ];

  bool _obscureText=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formFieldKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  "assets/Images/task-searching.png",
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Let's get started!",
                  style: GoogleFonts.quicksand(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromRGBO(102, 106, 246, 1),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.only(
                      left: 25, right: 25, top: 30, bottom: 30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(102, 106, 246, 1),
                      ),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(10, 10),
                            blurRadius: 10)
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: _nameController,
                          cursorColor: const Color.fromRGBO(135, 138, 245, 1),
                          decoration: InputDecoration(
                            labelText: "Enter Your Name",
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(135, 138, 245, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(135, 138, 245, 1),
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(135, 138, 245, 1),
                                    width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 0, 0),
                                    width: 1)),
                            errorStyle: const TextStyle(color: Colors.red),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(135, 138, 245, 1),
                                    width: 1)),
                          ),
                          // validator: (value) {
                          //   if (value !=
                          //       userNameandPassword[0]["userNamemap"]) {
                          //     return "Please enter username";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: _userNameController,
                          cursorColor: const Color.fromRGBO(135, 138, 245, 1),
                          decoration: InputDecoration(
                            labelText: "Enter Your Username",
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(135, 138, 245, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(135, 138, 245, 1),
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(135, 138, 245, 1),
                                    width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 0, 0),
                                    width: 1)),
                            errorStyle: const TextStyle(color: Colors.red),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(135, 138, 245, 1),
                                    width: 1)),
                          ),
                          // validator: (value) {
                          //   if (value !=
                          //       userNameandPassword[0]["userNamemap"]) {
                          //     return "Please enter username";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText:_obscureText,
                          cursorColor: const Color.fromRGBO(135, 138, 245, 1),
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(135, 138, 245, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(135, 138, 245, 1),
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(135, 138, 245, 1),
                                    width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 0, 0),
                                    width: 1)),
                            errorStyle: const TextStyle(color: Colors.red),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(135, 138, 245, 1),
                                    width: 1)),
                            
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText= !_obscureText;
                                });
                              },
                            ),
                            suffixIconColor: const Color.fromRGBO(102, 106, 246, 1),
                            

                          ),
                          // validator: (value) {
                          //   if (value !=
                          //       userNameandPassword[0]["passWordmap"]) {
                          //     return "Please enter password";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),


                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          controller: _confirmpasswordController,
                          obscureText:_obscureText,
                          cursorColor: const Color.fromRGBO(135, 138, 245, 1),
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            labelStyle: const TextStyle(
                              color: Color.fromRGBO(135, 138, 245, 1),
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Color.fromRGBO(135, 138, 245, 1),
                                  width: 1,
                                )),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(135, 138, 245, 1),
                                    width: 1)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 255, 0, 0),
                                    width: 1)),
                            errorStyle: const TextStyle(color: Colors.red),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                    color: Color.fromRGBO(135, 138, 245, 1),
                                    width: 1)),
                            
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText= !_obscureText;
                                });
                              },
                            ),
                            suffixIconColor: const Color.fromRGBO(102, 106, 246, 1),
                            

                          ),
                          // validator: (value) {
                          //   if (value !=
                          //       userNameandPassword[0]["passWordmap"]) {
                          //     return "Please enter password";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),

                      const SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () async {
                          await createDatabase();
                          data = await getData();
                          setState(() {});

                          bool validation =
                              _formFieldKey.currentState!.validate();

                          if (validation) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Registration Successful"),
                              ),
                            );
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Login()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Registration Failed"),
                              ),
                            );
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 170,
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(102, 106, 246, 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              "Register",
                              style: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                
                const SizedBox(
                  height: 35,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                  "Already have an Account? ",
                  style: GoogleFonts.quicksand(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(102, 106, 246, 1),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>const Login())
                    );
                  },
                  child: Text(
                    "SignIn",
                    style: GoogleFonts.quicksand(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(102, 106, 246, 1),
                    ),
                  ),
                ),

                  ],
                ),

                const SizedBox(
                  height: 50,
                ),

                

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
