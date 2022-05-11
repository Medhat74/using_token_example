import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:token_example/core/utils/naviagtion.dart';
import 'package:token_example/services/sp_helper/cache_helper.dart';
import 'package:token_example/views/register_view.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),

      body: Center(
        child:  ElevatedButton(
          child: Text("Logout"),
          onPressed: (){
            // ToDo ::  Remove Token and navigate
            SharedPreferencesHelper.removeData(key: 'token');

          },
        ),
      ),
    );
  }
}
