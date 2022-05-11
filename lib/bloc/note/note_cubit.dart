import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:token_example/Model/note_hub.dart';
import 'package:token_example/services/dio_helper/dio_service.dart';
import 'package:token_example/services/sp_helper/cache_helper.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  static NoteCubit get(context)=>BlocProvider.of(context);
  late NoteHub noteHub;

  void getNotes(){
    // Todo :: Create get data
    emit(NoteLoadingState());
    DioHelper.getData(url: "user/" , token: SharedPreferencesHelper.getData(key: 'token')).then((value) {
      noteHub = NoteHub.fromJson(value.data);
      emit(NoteSuccessState());
    }).catchError((onError){
      emit(NoteErrorState());
    });
  }

}
