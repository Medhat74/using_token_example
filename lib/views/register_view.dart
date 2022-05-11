import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:token_example/bloc/User/user_cubit.dart';
import 'package:token_example/core/utils/naviagtion.dart';
import 'package:token_example/services/sp_helper/cache_helper.dart';
import 'package:token_example/views/home_view.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Screen"),
      ),

      body: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          //ToDO :: Check State to Save Token
          if (state is UserSuccessState){
            var token = state.userHub!.accessToken!;
            SharedPreferencesHelper.saveData(key: 'token', value: token);
          }
        },
        builder: (context, state) {
          var cubit = UserCubit.get(context);
          return Center(
            child: ElevatedButton(
              child: Text("Login"),
              onPressed: () {
                //TODO :: Login and navigate to next Screen
                cubit.login("email", "password");
              },
            ),
          );
        },
      ),
    );
  }
}
