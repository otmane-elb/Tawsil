import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tawsil/views/widgets/deliverystatuswidget.dart';

class PackageView extends StatelessWidget {
  final String status;
  final String packageNum;
  final String time;
  final String city;
  final void Function()? onTap;

  const PackageView(
      {super.key,
      this.onTap,
      required this.packageNum,
      required this.time,
      required this.city,
      required this.status});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: height * 0.15,
        decoration: BoxDecoration(
          color: Colors.white, // White background
          borderRadius: BorderRadius.circular(20.0), // Rounded corners
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DeliveryStatusWidget(
              status: status,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      " Your delivery, $packageNum ",
                      style: GoogleFonts.aBeeZee(
                          fontSize: height * 0.017, color: Colors.black),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.blue,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text(
                          city,
                          style: GoogleFonts.aBeeZee(
                              fontSize: height * 0.017, color: Colors.black),
                        ),
                      ],
                    ),
                    Text(
                      "  Last updated $time",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: height * 0.015,
                      ),
                    ),
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
