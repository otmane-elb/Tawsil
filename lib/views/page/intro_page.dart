import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tawsil/views/page/search_page.dart';
import 'package:tawsil/views/widgets/button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 66, 59),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(
                height: 30,
              ),
              //  Shop name
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "Tawsil",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              //icon
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Image.asset("images/delivery-man.png"),
              ),
              //title
              Text(
                "THE FASTEST DELIVERY IN AND BETWEEN CASA AND AGADIR IN MOROCCO",
                style: GoogleFonts.dmSerifDisplay(
                    fontSize: 28, color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              //subtitle
              Text("Need to deliver something fast? use Tawsil  ",
                  style: TextStyle(color: Colors.grey[200], fontSize: 18)),
              const SizedBox(
                height: 20,
              ), //start button
              CButton(
                text: "Get started",
                onTap: () {
                  Get.to(() =>const SearchPage());
                },
              )
            ]),
      ),
    );
  }
}
