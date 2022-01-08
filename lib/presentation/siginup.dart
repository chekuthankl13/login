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

class SiginupPage extends StatelessWidget {
  SiginupPage({Key? key}) : super(key: key);

  final TextEditingController? emailctr = TextEditingController();
  final TextEditingController? passctr = TextEditingController();
  final TextEditingController? passconformctr = TextEditingController();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SigninError) {
          message(context, state);
        }

        if (state is SigninSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
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
                  gradient: LinearGradient(colors: [
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
                    'Register',
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
                    validator: MultiValidator([
                      RequiredValidator(errorText: '  Required'),
                      EmailValidator(errorText: ' Enter valid email')
                    ]),
                    ctr: emailctr!,
                    hint: 'jhon@mail.com',
                    icon: Icons.mail,
                  ),
                  space(),
                  Field(
                      validator: MultiValidator([
                        RequiredValidator(errorText: '  password is required'),
                        MinLengthValidator(8,
                            errorText:
                                '  password must be at least 8 digits long'),
                        PatternValidator(r'(?=.*?[#?!@$%^&*-])',
                            errorText:
                                ' passwords must have at least one special character')
                      ]),
                      ctr: passctr!,
                      obsure: true,
                      hint: '*****',
                      icon: Icons.lock),
                  space(),
                  Field(
                      validator: (p0) {
                        if (passctr!.text != p0) {
                          return 'Password not match';
                        }
                      },
                      icon: Icons.lock,
                      obsure: true,
                      ctr: passconformctr!,
                      hint: 'conform password'),
                  space(),
                  CircleButton(
                    fun: () {
                      if (formkey.currentState!.validate()) {
                        context.read<AuthenticationCubit>().signUp(
                            email: emailctr!.text,
                            password: passconformctr!.text);
                      }
                    },
                    wdg: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        if (state is SigninLoading) {
                          return const CupertinoActivityIndicator();
                        } else {
                          return icon(ic: Icons.check);
                        }
                      },
                    ),
                  ),
                  space()
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
