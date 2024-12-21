import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:new_project/core/functions/email_vaildation.dart';
import 'package:new_project/core/functions/navigation.dart';
import 'package:new_project/core/utils/colors.dart';
import 'package:new_project/core/utils/text_style.dart';
import 'package:new_project/core/widgets/nav_bar_widget.dart';
import 'package:new_project/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:new_project/feature/auth/presentation/view/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isVisable = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            pushReplacement(context, const NavBarWidget());
          } else if (state is AuthErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          } else if (state is LoginLoadingState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Loading')));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Gym Mode',
                    style: getHeadLineTextStyle(
                      context,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    'Welcome, Login to continue',
                    style: getTitleTextStyle(context),
                  ),
                  const Gap(10),
                  Text(
                    'Email',
                    style: getSmallTextStyle(context),
                  ),
                  const Gap(10),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'abdullahelmansy@gmail.com',
                      prefixIcon: Icon(Icons.email_rounded),
                    ),
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter your email';
                      } else if (!emailValidate(value)) {
                        return 'Enter your email correct';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const Gap(10),
                  Text(
                    'Password',
                    style: getSmallTextStyle(context),
                  ),
                  const Gap(10),
                  TextFormField(
                    style: const TextStyle(color: AppColors.textColor),
                    obscureText: isVisable,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(
                      hintText: '********',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisable = !isVisable;
                            });
                          },
                          icon: Icon((isVisable)
                              ? Icons.remove_red_eye
                              : Icons.visibility_off_rounded)),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Enter your password';
                      return null;
                    },
                  ),
                  const Gap(10),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            foregroundColor: AppColors.whiteColor),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(LoginEvent(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ));
                          }
                        },
                        child: const Text(
                          'Login ',
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t  have an account?',
                          style: getSmallTextStyle(context),
                        ),
                        TextButton(
                          onPressed: () {
                            pushReplacement(
                              context,
                              const RegisterView(),
                            );
                          },
                          child: Text(
                            'Register Now',
                            style: getSmallTextStyle(context,
                                color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
