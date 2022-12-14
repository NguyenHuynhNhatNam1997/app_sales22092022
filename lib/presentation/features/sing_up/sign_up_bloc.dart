import 'package:app_sales22092022/common/app_constant.dart';
import 'package:app_sales22092022/data/datasources/local/share_pref.dart';
import 'package:app_sales22092022/data/model/user_model.dart';
import 'package:app_sales22092022/data/model/user_signup_model.dart';
import 'package:app_sales22092022/data/repositories/authentication_repository.dart';
import 'package:app_sales22092022/presentation/features/sing_up/sign_up_event.dart';
import 'package:app_sales22092022/presentation/features/sing_up/sign_up_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBloc extends Bloc<SignUpEventBase, SignUpStateBase> {
  late AuthenticationRepository _repository;

  SignUpBloc(AuthenticationRepository repository) : super(SignUpStateInit()) {
    _repository = repository;

    on<SignUpEvent>((event, emit) async {
      try {
        emit(SignUpLoading());
        Response response = await _repository.signUp(event.email,
            event.password, event.address, event.phone, event.name);
        //
        print(response.data.toString());
        //
        if (response.statusCode == 200) {
          UserSignUpModel model =
              UserSignUpModel.fromJson(response.data["data"]);
          // await SharePre.instance.set(AppConstant.token);
          // print('AAAAAAAAAA  ' + model.email);
          emit(SignUpSuccess("Đăng ký thành công " + model.email));
        }
      } on DioError catch (dioError) {
        emit(SignUpError(dioError.response!.data["message"]));
      } catch (e) {
        emit(SignUpError(e.toString()));
      }
    });
  }
}
