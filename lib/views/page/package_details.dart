import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tawsil/core/models/package_model.dart';
import 'package:tawsil/views/widgets/one_status.dart';

class PackageDetails extends StatelessWidget {
  final Package? package; // Non-nullable package object

  const PackageDetails({Key? key, required this.package}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromARGB(255, 158, 66, 59),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              Column(
                children: [
                  Text(
                    "Tawsil",
                    style: GoogleFonts.dmSerifDisplay(
                        fontSize: 28, color: Colors.white),
                  ),
                  const Text(
                    "By Otmane",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const CircleAvatar(
                backgroundImage: AssetImage("images/man.png"),
              )
            ],
          ),
        ),
        body: Column(children: [
          Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text("Package #MAR190920231925"),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Image.asset(
                    "images/package.png",
                    scale: 4,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.grey[200], // White background
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0), // Rounded top-left corner
                topRight: Radius.circular(20.0), // Rounded top-right corner
              ),
            ),
            child: Column(
              children: [
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    const Icon(Icons.history),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "History",
                      style: GoogleFonts.acme(fontSize: 30),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: package!.statuses.length,
                    itemBuilder: (context, index) {
                      final status = package!.statuses.values.toList()[index];
                      return OneStatus(
                        status: status.status,
                        city: status.city,
                        Time: status.time,
                      );
                    },
                  ),
                ),
              ],
            ),
          ))
        ]));
  }
}
