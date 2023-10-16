import 'package:flutter/material.dart';
import 'package:tawsil/utils/get_icon_for_status.dart';

class DeliveryStatusWidget extends StatelessWidget {
  final String status;
  const DeliveryStatusWidget({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[200], // White background
            borderRadius: BorderRadius.circular(20.0), // Rounded corners
          ),
          child: Row(
            children: [
              getIconForStatus(status),
              SizedBox(
                width: 10,
              ),
              Text(
                status,
                style: const TextStyle(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
