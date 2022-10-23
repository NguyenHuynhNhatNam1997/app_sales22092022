import 'package:app_sales22092022/common/app_constant.dart';
import 'package:app_sales22092022/data/datasources/local/share_pref.dart';
import 'package:app_sales22092022/data/model/user_model.dart';
import 'package:app_sales22092022/data/repositories/authentication_repository.dart';
import 'package:app_sales22092022/presentation/features/sign_in/sign_in_event.dart';
import 'package:app_sales22092022/presentation/features/sign_in/sign_in_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEventBase, SignInStateBase> {
  late AuthenticationRepository _repository;

  SignInBloc(AuthenticationRepository repository) : super(SignInStateInit()) {
    _repository = repository;

    on<SignInEvent>((event, emit) async {
      try {
        emit(SignInLoading());
        Response response =
            await _repository.signIn(event.email, event.password);
        //print(response.data.toString());
        // print(response.data.toString());
        if (response.statusCode == 200) {
          // Bước này là lấy dữ liệu từ Api trả về là kiểu Json mình chuyển sang kiểu Oject là dùng
          // phương thức UserModel.fromJson
          UserModel model = UserModel.fromJson(response.data["data"]);
          //print("Lay du lieu de xem co cai gi  " + model.phone.toString());
          await SharePre.instance.set(AppConstant.token, model.token);

          emit(SignInSuccess("Đăng nhập thành công " + model.email));
          // emit(SignInSuccess(model.name));
        }
      } on DioError catch (dioError) {
        emit(SignInSuccess(dioError.response!.data["message"]));
      } catch (e) {
        emit(SignInSuccess(e.toString()));
      }
    });
  }
}
