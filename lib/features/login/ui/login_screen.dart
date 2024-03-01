import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvace/core/helpers/spacing.dart';
import 'package:flutteradvace/core/theming/styles.dart';
import 'package:flutteradvace/core/wedigets/app_text_button.dart';
import 'package:flutteradvace/core/wedigets/app_text_form_field.dart';
import 'package:flutteradvace/features/login/ui/wedigts/already_have_account_text.dart';
import 'package:flutteradvace/features/login/ui/wedigts/terms_and_coditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

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
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const AppTextFormField(hintText: "Email"),
                    verticalSpace(18),
                    AppTextFormField(
                      hintText: "Password",
                      isObscureText: isObscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(isObscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
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
              ),
              verticalSpace(40),
              AppTextButton(
                buttonText: 'Login',
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {},
              ),
              verticalSpace(16),
              const TermsAndConditionsText(),
              verticalSpace(60),
              const AlreadyHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
