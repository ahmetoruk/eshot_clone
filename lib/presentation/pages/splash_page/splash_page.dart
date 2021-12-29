import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:eshot_clone/blocs/auth_cubit.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthStatusState>(
          listener: (context, state) async {
        await Future.delayed(const Duration(seconds: 1));
        context.go("/favorites");
      }, builder: (context, state) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
