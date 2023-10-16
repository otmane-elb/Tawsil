import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tawsil/core/models/package_model.dart';
import 'package:tawsil/service/getdata.dart';
import 'package:tawsil/views/page/add_modify_package_page.dart';
import 'package:tawsil/views/page/package_details.dart';
import 'package:tawsil/views/widgets/package_widget.dart';

import '../../core/models/lasttime.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  LastTime? lastTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Add a Drawer
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            // Drawer Header
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 158, 66, 59),
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
              leading: const Icon(Icons.search),
              title: const Text('Search for package'),
              onTap: () {
                // Handle Home item tap
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.add_box),
              title: const Text('Add or modify package'),
              onTap: () {
                // Handle Settings item tap

                Get.to(() => const AddModifyPackage());
              },
            ),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 158, 66, 59),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            const Align(
              alignment: Alignment
                  .centerRight, // This aligns the CircleAvatar to the right
              child: CircleAvatar(
                backgroundImage: AssetImage("images/man.png"),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Text(
                  "TRACK YOUR PACKAGE",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28, color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Please enter theTracking number",
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
                  onSubmitted: (value) async {
                    lastTime = await GetData().getPackagelastupdate(value);

                    setState(() {
                      lastTime != null
                          ? lastTime = LastTime(lastTime?.status,
                              lastTime?.Time, lastTime?.city, value)
                          : lastTime = null;
                    });
                  },
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 158, 66, 59),
                    ),
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 158, 66, 59), fontSize: 16),
                    hintText: "Enter the tracking number",
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
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200], // White background
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0), // Rounded top-left corner
                  topRight: Radius.circular(20.0), // Rounded top-right corner
                ),
              ),
              child: lastTime == null
                  ? const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text("No data available")))
                  : ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return PackageView(
                          status: lastTime!.status!,
                          packageNum: lastTime!.id!,
                          time: lastTime!.Time!,
                          city: lastTime!.city!,
                          onTap: () async {
                            Package? package =
                                await GetData().getPackage(lastTime!.id!);
                            Get.to(
                              () => PackageDetails(
                                package: package,
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}
