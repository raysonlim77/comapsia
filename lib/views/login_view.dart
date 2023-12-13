import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/app_colors.dart';
import '../helpers/string_validator.dart';
import '../view_models/login_view_model.dart';
import '../widgets/app_button.dart';
import '../widgets/custom_formfield.dart';
import '../widgets/custom_richtext.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<LoginViewModel>(builder: (context, viewModel, child) {
          return Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                CustomFormField(
                  headingText: "Email",
                  hintText: "Email",
                  obsecureText: false,
                  suffixIcon: const SizedBox(),
                  controller: viewModel.emailController,
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => StringValidator.emailValidator(value),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomFormField(
                  headingText: "Password",
                  maxLines: 1,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: "At least 8 Character",
                  obsecureText: viewModel.obsecureText,
                  suffixIcon: IconButton(
                      icon: viewModel.obsecureText
                          ? const Icon(
                              Icons.visibility_outlined,
                              size: 22,
                            )
                          : const Icon(
                              Icons.visibility_off_outlined,
                              size: 22,
                            ),
                      onPressed: () {
                        viewModel.setObsecureText();
                      }),
                  controller: viewModel.passwordController,
                  validator: (value) =>
                      StringValidator.passwordValidator(value),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 24),
                      child: InkWell(
                        onTap: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                              color: AppColors.blue.withOpacity(0.7),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                AppButton(
                  onTap: () {
                    viewModel.login(context);
                  },
                  isLoading: viewModel.isLoading,
                  text: 'Sign In',
                ),
                CustomRichText(
                  discription: "Don't already Have an account? ",
                  text: "Sign Up",
                  onTap: () {},
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
