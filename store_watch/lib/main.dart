import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_watch/blocs/auth_bloc/bloc/auth_bloc.dart';
import 'package:store_watch/blocs/cart_bloc/bloc/cart_bloc.dart';
import 'package:store_watch/blocs/search_bloc/search_bloc.dart';
import 'package:store_watch/screens/get_started_screen.dart';
import 'package:store_watch/screens/navi_bar.dart';
import 'package:store_watch/screens/signin_screen.dart';
import 'package:store_watch/screens/signup_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
        BlocProvider(
          create: (context) => SearchBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: false),
        debugShowCheckedModeBanner: false,
        home: SignUp(),
      ),
    );
  }
}
