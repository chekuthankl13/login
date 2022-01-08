import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopdibz/config/constant.dart';

class Field extends StatelessWidget {
  const Field(
      {Key? key,
      this.obsure = false,
      required this.icon,
      required this.ctr,
      required this.validator,
      required this.hint})
      : super(key: key);

  final TextEditingController ctr;
  final String hint;
  final IconData icon;
  final bool obsure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return ClayContainer(
      // height: 60,
      borderRadius: 20,
      width: sW(context) / 1.5,
      child: TextFormField(
        validator: validator,
        cursorColor: Colors.red,
        obscureText: obsure ? true : false,
        decoration: InputDecoration(
          errorStyle: TextStyle(fontSize: 16),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusColor: Colors.white,
          // add prefix icon
          prefixIcon: Icon(
            icon,
            color: Colors.black38,
          ),
          hintText: hint,
          hintStyle: GoogleFonts.laila(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        controller: ctr,
      ),
    );
  }
}
