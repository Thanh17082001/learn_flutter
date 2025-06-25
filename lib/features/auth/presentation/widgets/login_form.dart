import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/core/theme/app_colors.dart';
import 'package:learn_flutter/features/auth/presentation/widgets/input_form.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              InputForm(
                labelText: 'Tài khoản',
                controller: _usernameController,
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tài khoản';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              InputForm(
                labelText: 'Mật khẩu',
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  if (state is AuthLoading) {
                    isLoading = true;
                  return SubmitButton();

                  }
                  else if (state is AuthFailure) {
                    // Khi có kết quả hoặc lỗi thì tắt loading
                    if (isLoading) {
                        isLoading = false;
                  return SubmitButton();
                    }
                  }
                  return SubmitButton();


                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.white,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SubmitButton() {
    return GestureDetector(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          BlocProvider.of<AuthBloc>(context).add(LoginRequested(
            _usernameController.text,
            _passwordController.text,
          ));
        }
      },
      child: Container(
        width: double.infinity,
        height: 50.0,
        alignment: Alignment.center,
        margin: const EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: !isLoading
            ? const Text('Đăng nhập',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold))
            : buildLoadingIndicator(),
      ),
    );
  }
}
