import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/get_icon_for_status.dart';

class OneStatus extends StatelessWidget {
  final String status;
  final String Time;
  final String city;

  const OneStatus({super.key, 
    required this.status,
    required this.Time,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            getIconForStatus(status),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$status, $city",
                  style: GoogleFonts.aBeeZee(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Time,
                  style: GoogleFonts.aBeeZee(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
