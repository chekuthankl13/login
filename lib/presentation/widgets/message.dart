import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopdibz/domain/authentication/cubit/authentication_cubit.dart';

void message(BuildContext context, AuthenticationState state) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 5,
      //margin: EdgeInsets.only(bottom: 20),
      behavior: SnackBarBehavior.floating,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.grey[200],
      content: Text(
        state.error!,
        style: GoogleFonts.laila(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
      ),
    ),
  );
}

void successMessage(BuildContext context, AuthenticationState state) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 5,
      //margin: EdgeInsets.only(bottom: 20),
      behavior: SnackBarBehavior.floating,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.greenAccent[400],
      content: Text(
        'Password Reset Link is Sent the Email...',
        style: GoogleFonts.laila(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.grey[100],
        ),
      ),
    ),
  );
}
