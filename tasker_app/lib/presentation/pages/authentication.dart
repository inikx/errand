import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasker_app/bloc/authentication/authentication_cubit.dart';
import 'package:tasker_app/constants/strings.dart';
import 'package:tasker_app/presentation/widgets/snackbars/exception_widget.dart';
import 'package:tasker_app/presentation/widgets/snackbars/success_widget.dart';
import 'package:tasker_app/presentation/widgets/wallpaper.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        switch (state.runtimeType) {
          case AuthenticationSuccess:
            Navigator.pushNamedAndRemoveUntil(context, HOME, (r) => false);
            return;
          case AuthenticationFailed:
            showTopSnackBar(context,
                const ErrorSnackbar(info: "Сессия устарела, войдите снова"));
            Navigator.pushNamedAndRemoveUntil(context, LOGIN, (r) => false);
            return;
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const Wallpaper(),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 50),
                child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationChecking) {
                      return Column(
                        children: const [
                          Text(
                            'Errand',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircularProgressIndicator()
                        ],
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
