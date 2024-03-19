import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteradvace/features/sign_up/data/models/signup_request_body.dart';
import 'package:flutteradvace/features/sign_up/data/repos/signup_repo.dart';
import 'package:flutteradvace/features/sign_up/logic/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;

  SignupCubit(this._signupRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signup(SignupRequestBody(
        name: nameController.text,
        phone: phoneController.text,
        gender: 0,
        passwordConfirmation: passwordConfirmationController.text,
        email: emailController.text,
        password: passwordController.text));
    response.when(success: (signupResponse) {
      emit(SignupState.signupSuccess(signupResponse));
    }, failure: (error) {
      emit(SignupState.signupError(error: error.apiErrorModel.message ?? ""));
    });
  }
}
