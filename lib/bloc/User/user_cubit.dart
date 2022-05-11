import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:token_example/Model/user_hub.dart';
import 'package:token_example/services/dio_helper/dio_service.dart';
import 'package:token_example/services/sp_helper/cache_helper.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);
  late UserHub userHub;

  login(String email , String password ){
    // ToDO :: Create login
    emit(UserLoadingState());
    DioHelper.postData(url: "user/", data: {
      'email' : email,
      'password' : password
    }).then((value)  {
      userHub = UserHub.formJson(value.data);
      //SharedPreferencesHelper.saveData(key: 'token', value: userHub.accessToken);
      emit(UserSuccessState(userHub));
    }).catchError((error){
      emit(UserErrorState());
    });
  }
}
