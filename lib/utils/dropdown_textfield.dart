import 'package:flutter/material.dart';
import 'package:tawsil/service/getdata.dart';

class MyTextFieldWithOptions extends StatefulWidget {
  final TextEditingController packageId;
  final TextEditingController city;
  final void Function()? onTap;
  const MyTextFieldWithOptions({
    Key? key,
    required this.packageId,
    required this.city,
    this.onTap,
  }) : super(key: key);
  @override
  MyTextFieldWithOptionsState createState() => MyTextFieldWithOptionsState();
}

class MyTextFieldWithOptionsState extends State<MyTextFieldWithOptions> {
  String _selectedOption = 'To be shipped'; // Default selected option

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButton<String>(
          value: _selectedOption,
          onChanged: (newValue) {
            setState(() {
              _selectedOption = newValue!;
            });
          },
          items: <String>[
            "To be shipped",
            "transit to dest",
            "Arrived dest",
            "Out for delivery",
            "Delivered",
            "Return dest",
            "transit R origin",
            "return to origin",
            "Out for return",
            "Returned to sender"
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        ElevatedButton(
          onPressed: () {
            print('Selected Option: $_selectedOption');
            print(widget.packageId.text);
            print(widget.city.text);
            GetData().addPacakge(
                widget.packageId.text, _selectedOption, widget.city.text);
          },
          child: Text('Submit'),
        ),
      ],
    );
  }

  @override
  void dispose() {
    widget.city.dispose();
    widget.packageId.dispose();
    super.dispose();
  }
}
