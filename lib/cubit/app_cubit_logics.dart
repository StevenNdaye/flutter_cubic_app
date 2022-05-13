import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit_app/cubit/app_cubits.dart';
import 'package:flutter_cubit_app/pages/home_page.dart';
import 'package:flutter_cubit_app/pages/welcome_page.dart';

import 'app_cubit_states.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is WelcomeState) {
          return WelcomePage();
        } else if (state is LoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is LoadedState) {
          return HomePage();
        } else {
          return Container();
        }
      }),
    );
  }
}
