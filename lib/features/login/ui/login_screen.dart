import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvace/core/helpers/spacing.dart';
import 'package:flutteradvace/core/theming/styles.dart';
import 'package:flutteradvace/core/wedigets/app_text_button.dart';
import 'package:flutteradvace/features/login/data/models/login_request_body.dart';
import 'package:flutteradvace/features/login/logic/login_cubit.dart';
import 'package:flutteradvace/features/login/ui/wedigts/already_have_account_text.dart';
import 'package:flutteradvace/features/login/ui/wedigts/email_and_password.dart';
import 'package:flutteradvace/features/login/ui/wedigts/login_bloc_listener.dart';
import 'package:flutteradvace/features/login/ui/wedigts/terms_and_coditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Welcome Back",
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(36),
              Column(
                children: [
                  const EmailAndPassword(),
                  verticalSpace(24),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'Forget Password?',
                      style: TextStyles.font13BlueRegular,
                    ),
                  ),
                ],
              ),
              verticalSpace(40),
              AppTextButton(
                buttonText: 'Login',
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  validateThenLogin(context);
                },
              ),
              verticalSpace(16),
              const TermsAndConditionsText(),
              verticalSpace(60),
              const AlreadyHaveAccountText(),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text));
    }
  }
}
