import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopdibz/config/constant.dart';
import 'package:shopdibz/domain/authentication/cubit/authentication_cubit.dart';
import 'package:shopdibz/presentation/widgets/circlebutton.dart';
import 'package:shopdibz/presentation/widgets/message.dart';
import 'package:shopdibz/presentation/widgets/textfield.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  TextEditingController? emailctrl = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is ForgotPswError) {
            message(context, state);
          }
          if (state is ForgotPswSuccess) {
            successMessage(context, state);
            Navigator.pop(context);
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
                      'Forgot Password ?',
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
                      ctr: emailctrl!,
                      hint: 'Enter the Registerd Email',
                      icon: Icons.mail,
                      validator: MultiValidator([
                        //RequiredValidator(errorText: ' Required'),
                        EmailValidator(errorText: ' Enter valid email')
                      ]),
                    ),
                    space(),
                    space(),
                    CircleButton(fun: () {
                      if (formkey.currentState!.validate()) {
                        context
                            .read<AuthenticationCubit>()
                            .forgotpassword(email: emailctrl!.text);
                      }
                    }, wdg:
                        BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        if (state is ForgotPswLoading) {
                          return const CupertinoActivityIndicator();
                        } else {
                          return icon(ic: Icons.send);
                        }
                      },
                    ))
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
