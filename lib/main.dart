import 'package:flutter/material.dart';
import 'package:token_example/services/dio_helper/dio_service.dart';
import 'package:token_example/services/sp_helper/cache_helper.dart';
import 'package:token_example/src/app_root.dart';

Future<void> main()

async {

  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  DioHelper.init();
  runApp(AppRoot());
}