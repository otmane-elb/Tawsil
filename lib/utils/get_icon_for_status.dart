import 'package:flutter/material.dart';

Icon getIconForStatus(String status) {
  if (status == "Delivered") {
    return const Icon(Icons.check, color: Colors.green);
  } else if (status == "To be shipped") {
    return const Icon(Icons.home, color: Colors.orange);
  } else if (status == "transit to dest") {
    return const Icon(Icons.linear_scale, color: Colors.amber);
  } else if (status == "Arrived dest") {
    return const Icon(Icons.home, color: Colors.orange);
  } else if (status == "Out for delivery") {
    return const Icon(Icons.timeline, color: Colors.amber);
  } else if (status == "Return dest") {
    return const Icon(Icons.home, color: Colors.orange);
  } else if (status == "transit R origin") {
    return const Icon(Icons.linear_scale, color: Colors.amber);
  } else if (status == "return to origin") {
    return const Icon(Icons.home, color: Colors.red);
  } else if (status == "Out for return") {
    return const Icon(Icons.timeline, color: Colors.red);
  } else if (status == "Returned to sender") {
    return const Icon(Icons.arrow_back, color: Colors.red);
  } else {
    return const Icon(Icons.error, color: Colors.red);
  }
}
