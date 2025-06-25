import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/usecases/login_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc(this.loginUseCase) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
      LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final prefs = await SharedPreferences.getInstance();

      // Kiểm tra nếu đã có token cũ thì xóa
      final oldToken = prefs.getString(Constants.tokenKey);
      if (oldToken != null && oldToken.isNotEmpty) {
        await prefs.remove(Constants.tokenKey);
        print('Đã xóa token cũ: $oldToken');
      }

      // Thực hiện login
      final token =
          await loginUseCase.executeLogin(event.username, event.password);

      // Lưu token mới
      await prefs.setString(Constants.tokenKey, token);
      print('Đã lưu token mới: $token');

      emit(AuthSuccess());
    } catch (e) {
      emit(AuthSuccess());
    }
  }

}
