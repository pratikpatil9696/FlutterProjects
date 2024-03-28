import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';

class WelCome extends StatelessWidget {
  const WelCome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 200,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/Images/task-searching.png",
              height: 200,
              width: 200,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create",
                    style: GoogleFonts.quicksand(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(49, 68, 108, 0.7)),
                  ),
                  Text(
                    "Work Plan",
                    style: GoogleFonts.quicksand(
                      fontSize: 50,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromRGBO(102, 106, 246, 1),
                    ),
                  ),
                  Text(
                    "Here.",
                    style: GoogleFonts.quicksand(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(49, 68, 108, 0.7)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "This productive tool is designed to help you better manage your tasks.",
                    style: GoogleFonts.quicksand(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(49, 68, 108, 0.5)),
                  )
                ],
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 170,
            ),
            Container(
              height: 80,
              width: 300,
              decoration: const BoxDecoration(
                  //color: Color.fromRGBO(135, 138, 245, 1),
                  color: Color.fromRGBO(102, 106, 246, 1),
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: const Icon(
                  Icons.navigate_next_rounded,
                  size: 80,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    ));
  }
}
