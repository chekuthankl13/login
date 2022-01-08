//import 'package:clay_containers/clay_containers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:shopdibz/config/constant.dart';
import 'package:shopdibz/domain/authentication/cubit/authentication_cubit.dart';
import 'package:shopdibz/presentation/widgets/circlebutton.dart';
import 'package:shopdibz/presentation/widgets/message.dart';
import 'package:shopdibz/presentation/widgets/textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  TextEditingController? emlctr = TextEditingController();
  TextEditingController? paswctr = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is LoginError) {
            message(context, state);
          }
          if (state is LoginSuccess) {
            Navigator.popAndPushNamed(context, '/home');
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                Container(
                  height: 250,
                  width: sW(context),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        // begin: Alignment.topLeft,
                        // end: Alignment.bottomLeft,
                        colors: [
                          //Color(0XFFF57000),
                          Color(0XFFEF6000),
                          Colors.orange,
                          Colors.amber,
                        ]),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(150),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Login',
                      style: GoogleFonts.pacifico(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    height: 200,
                    width: sW(context),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent[400]!.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(150),
                          topRight: Radius.circular(150)),
                    ),
                  ),
                )
              ]),
              Form(
                key: formkey,
                child: Column(
                  children: [
                    space(),
                    Field(
                      ctr: emlctr!,
                      hint: 'jhon@mail.com',
                      icon: Icons.mail,
                      validator: MultiValidator([
                        RequiredValidator(errorText: ' Required'),
                        EmailValidator(errorText: ' Enter valid email')
                      ]),
                    ),
                    space(),
                    Field(
                        validator: RequiredValidator(errorText: ' Required'),
                        ctr: paswctr!,
                        obsure: true,
                        hint: '*****',
                        icon: Icons.lock),
                    space(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        space(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.popAndPushNamed(context, '/forgot');
                            },
                            child: Text(
                              'Forget Password ?',
                              style: GoogleFonts.laila(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    CircleButton(
                      fun: () {
                        if (formkey.currentState!.validate()) {
                          context.read<AuthenticationCubit>().login(
                              email: emlctr!.text, password: paswctr!.text);
                        }
                      },
                      wdg:
                          BlocBuilder<AuthenticationCubit, AuthenticationState>(
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const CupertinoActivityIndicator();
                          } else {
                            return icon(ic: Icons.arrow_forward_ios_outlined);
                          }
                        },
                      ),
                    ),
                    space(),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Dont have Account ?',
                            style: GoogleFonts.laila(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Text(
                              ' Register',
                              style: GoogleFonts.laila(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
