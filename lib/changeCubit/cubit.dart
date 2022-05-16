import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/changeCubit/states.dart';
import 'package:newsapp/model/Cach_Helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(initailAppstate());
  static AppCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changAppMode({bool sharedform}) {
    if (sharedform != null) {
      isDark = sharedform;
      emit(ChangeAppState());
    } else {
      isDark = !isDark;
      CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeAppState());
      });
    }
  }
}
