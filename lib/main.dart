import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopdibz/config/constant.dart';
import 'package:shopdibz/config/route.dart';
import 'package:shopdibz/domain/authentication/cubit/authentication_cubit.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationCubit>(
          create: (context) => AuthenticationCubit(),
        )
      ],
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        onGenerateRoute: AppRoute.generateRoute,
      ),
    );
  }
}
