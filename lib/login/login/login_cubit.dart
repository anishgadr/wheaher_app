import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const Loaded(null));
  //final api = Api();

  void login(String email, String password) async {
    emit(Loading());

    if (email == "testapp@google.com" && password == "Test@123456") {
      emit(Loaded("success"));
    }else{
       emit(Error("error"));
    }
  }
}
