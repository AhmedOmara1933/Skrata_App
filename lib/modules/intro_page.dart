import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skrata_app/layout/home_layout.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/18973633.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'SKRATA',
              style: GoogleFonts.bebasNeue(
                letterSpacing: 8.0,
                fontSize: 75.0,
              ),
            ),
            Container(
              height: 80.0,
              width: 80.0,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(300.0)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                color: const Color(0xff50ad98),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeLayout(),
                      ));
                },
                child: const Text(
                  'GO',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
