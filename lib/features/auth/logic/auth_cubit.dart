import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project1/core/network/local/shared_preference.dart';
import 'package:project1/features/auth/data/models/login_request_body.dart';
import 'package:project1/features/auth/data/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  var formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() {
    emit(LoginLoadingState());
    _authRepository
        .login(LoginRequestBody(
            phone: phoneController.text, password: passwordController.text))
        .then((value) {
      CacheHelper.saveData(key: "token", value: value.accessToken) ; 
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }

  bool isShow = false;
  showPassword() {
    isShow = !isShow;
    emit(ChangeISShowPassword());
  }
}
