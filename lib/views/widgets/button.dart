// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const CButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 162, 83, 77),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // text
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                width: 10,
              ),
              //icon
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
