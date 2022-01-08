import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopdibz/config/constant.dart';
import 'package:shopdibz/domain/authentication/cubit/authentication_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
      )),
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is LoginError) {
            Navigator.pop(context);
          }
          if (state is AuthOut) {
            Navigator.popAndPushNamed(context, '/login');
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Hi',
              style: GoogleFonts.laila(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            Text(
              FirebaseAuth.instance.currentUser!.email!,
              style: GoogleFonts.laila(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            space(),
            Center(
              child: CupertinoButton(
                color: Colors.red,
                onPressed: () {
                  context.read<AuthenticationCubit>().logout();
                },
                child: Text(
                  'signout',
                  style: GoogleFonts.laila(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
