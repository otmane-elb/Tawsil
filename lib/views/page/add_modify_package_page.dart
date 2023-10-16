import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tawsil/service/getdata.dart';
import 'package:tawsil/utils/dropdown_textfield.dart';

import '../../core/models/package_model.dart';
import '../widgets/one_status.dart';

class AddModifyPackage extends StatefulWidget {
  const AddModifyPackage({super.key});

  @override
  State<AddModifyPackage> createState() => _AddModifyPackageState();
}

class _AddModifyPackageState extends State<AddModifyPackage> {
  TextEditingController cityController = TextEditingController();
  TextEditingController packageIdController = TextEditingController();
  Package? package;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header
            DrawerHeader(
              decoration: BoxDecoration(
                
                color: const Color.fromARGB(255, 158, 66, 59),
              ),
              child: Text(
                'My App Drawer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            // Drawer Items
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search for package'),
              onTap: () {
                // Handle Home item tap
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                // Handle Settings item tap
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 158, 66, 59),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Column(
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
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddModifyPackage()));
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage("images/man.png"),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                Text(
                  "ADD OR MODIFY A PACKAGE",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Please enter A number",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 15, color: Colors.grey[400]),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // White background
                borderRadius: BorderRadius.circular(20.0), // Rounded corners
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextField(
                  controller: packageIdController,
                  onSubmitted: (value) async {
                    package = await GetData().getPackage(value);

                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 158, 66, 59),
                    ),
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 158, 66, 59), fontSize: 16),
                    hintText: "Enter a tracking number",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200], // White background
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0), // Rounded top-left corner
                  topRight: Radius.circular(20.0), // Rounded top-right corner
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white, // White background
                        borderRadius:
                            BorderRadius.circular(20.0), // Rounded corners
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextField(
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Color.fromARGB(255, 158, 66, 59),
                            ),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 158, 66, 59),
                                fontSize: 16),
                            hintText: "City",
                            border: InputBorder.none,
                          ),
                          controller: cityController,
                        ),
                      ),
                    ),
                  ),
                  MyTextFieldWithOptions(
                    onTap: () {
                      print(packageIdController.text);
                    },
                    city: cityController,
                    packageId: packageIdController,
                  ),
                  Expanded(
                    child: package == null
                        ? Center(
                            child: Text(
                                "No data available"), // Replace with your empty state widget
                          )
                        : ListView.builder(
                            itemCount: package!.statuses.length,
                            itemBuilder: (context, index) {
                              final status =
                                  package!.statuses.values.toList()[index];
                              return OneStatus(
                                status: status.status,
                                city: status.city,
                                Time: status.time,
                              );
                            },
                          ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
