import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:intl/intl.dart';
import 'package:tawsil/core/models/package_model.dart';
import 'package:tawsil/utils/datetime_now.dart';
import 'package:get/get.dart';
import '../core/models/lasttime.dart';

class GetData {
  Future<LastTime?> getPackagelastupdate(String packageId) async {
    // Access the desired package
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("/Tawsil/Pacakges/$packageId");

    try {
      DatabaseEvent event = await ref.once();
      //check if it's a valid ID
      if (event.snapshot.exists) {
        Map<String, dynamic> data =
            jsonDecode(jsonEncode(event.snapshot.value));

        List<String> keys = data.keys.toList();
        // sort the delivery statuses by date 
        keys.sort((a, b) =>
            DateFormat('dd/MM/yyyy HH:mm').parse(data[b]['Time']).compareTo(
                  DateFormat('dd/MM/yyyy HH:mm').parse(data[a]['Time']),
                ));

        Map<String, dynamic> lastEntry = data[keys.first];
        String status = keys.first;

        LastTime lastTime = LastTime(
          status,
          lastEntry['Time'],
          lastEntry['City'],
          keys.first,
        );

        return lastTime;
      } else {
        // Package with the provided ID doesn't exist
        Get.snackbar(
          "Error",
          "Package not found",
        );
        return null;
      }
    } catch (e) {
// Errors other then not found
      print('Error: $e');
      return null;
    }
  }

  Future<Package?> getPackage(String packageId) async {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("/Tawsil/Pacakges/$packageId");
    try {
      DatabaseEvent event = await ref.once();
      if (event.snapshot.exists) {
        Map<String, dynamic> data =
            jsonDecode(jsonEncode(event.snapshot.value));

        // Extract the keys and sort them in descending order
        List<String> keys = data.keys.toList();
        keys.sort((a, b) => DateFormat('dd/MM/yyyy HH:mm')
            .parse(data[a]['Time'])
            .compareTo(DateFormat('dd/MM/yyyy HH:mm').parse(data[b]['Time'])));

        // Create a new Map with sorted data
        Map<String, dynamic> sortedData = {};
        for (var key in keys) {
          sortedData[key] = data[key];
        }

        Package package = Package.fromJson(packageId, sortedData);
        print('this is id :${package.id}');
        package.statuses.forEach((key, value) {
          print('$key: $value');
        });
        return package;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  addPacakge(String packageId, String status, String city) {
    DatabaseReference ref =
        FirebaseDatabase.instance.ref("/Tawsil/Pacakges/$packageId");
    ref.child(status).set({
      "City": city,
      "Time": formattedDateTime(),
    });
  }
}
