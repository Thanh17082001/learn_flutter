import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter/core/theme/app_colors.dart';
import 'package:learn_flutter/core/utils/ware.clipper.dart';
import 'package:learn_flutter/features/auth/presentation/widgets/login_footer.dart';
import '../../../../injection.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_state.dart';
import '../widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(sl()),
      child: Scaffold(
        appBar: AppBar(
           backgroundColor: AppColors.primary,
         
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
                Navigator.pushReplacementNamed(context, '/home');
            if (state is AuthSuccess) {
              // Chuyển trang nếu muốn
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content:  Text('Đang nhập thất bại, thử lại sau')));
            }
          },
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              // Phần đầu trang với hình nền và tiêu đề
              ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.45,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                  ),
                ),
              ),
              // Tiêu đề đăng nhập
              Container(
                margin: const EdgeInsets.only(top: 20.0 ,left: 20.0),
                height: MediaQuery.of(context).size.width * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget> [
                    const Text('Đăng nhập',style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color:  Color.fromARGB(255, 117, 117, 117)
                    ),),
                     Container(
                      margin: const EdgeInsets.only(top: 3.0,left: 4),
                      height: 2, color: AppColors.primary,width: 100,),
                  ],
                ),
              ),
              // Phần nhập thông tin đăng nhập
              Container(
                color: Colors.white,
                width: double.infinity,
                child: LoginForm(),
              ),
          
              // Phần chân trang với các nút đăng nhập bằng mạng xã hội
              const SizedBox(height: 20.0),
              const LoginFooter(),
              
            ],
          ),
        ),
      ),
    );
  }
}
