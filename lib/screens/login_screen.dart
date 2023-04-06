import 'package:coinfo_app/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import '../constant/theme.dart';
import '../widgets/input_field.dart';
import '../widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool passwordVisible = true;
  bool isChecked = false;
  void togglePasswordVisible() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  void initState() {
    emailController = TextEditingController(text: '');
    passwordController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: kWhiteColor,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 40,
                  bottom: 48,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login to your\naccount',
                      style: blackTextStyle.copyWith(
                        fontWeight: bold,
                        fontSize: 24,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: 99,
                      height: 4,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/image_accent.png',
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputField(
                      hintText: 'Email',
                      suffixIcon: const SizedBox(),
                      controller: emailController,
                      validator: ValidationBuilder().email().build(),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    InputField(
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        splashRadius: 1,
                        color: kGreyColor,
                        onPressed: togglePasswordVisible,
                        icon: Icon(
                          passwordVisible
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                      obscureText: passwordVisible,
                      controller: passwordController,
                      validator: ValidationBuilder().minLength(8).build(),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: isChecked
                                  ? kPrimaryColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4.0),
                              border: isChecked
                                  ? null
                                  : Border.all(color: kGreyColor, width: 1.5),
                            ),
                            width: 20,
                            height: 20,
                            child: isChecked
                                ? const Icon(
                                    Icons.check,
                                    size: 20,
                                    color: Colors.white,
                                  )
                                : null,
                          ),
                        ),
                        Text(
                          'Remember Me',
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/main', (route) => false);
                  } else if (state is AuthFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red.shade700,
                        content: Text(
                          state.error,
                        ),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AuthLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CustomButton(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().signIn(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      }
                    },
                    text: 'Login',
                    bgColor: kPrimaryColor,
                    textStyle: whiteTextStyle.copyWith(
                        fontSize: 18, fontWeight: semiBold),
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                child: Center(
                  child: Text(
                    'OR',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                ),
              ),
              CustomButton(
                text: 'Login with Google',
                bgColor: kBackgroundColor,
                textStyle:
                    blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold),
                onTap: () {},
              ),
              const SizedBox(
                height: 95,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don’t have an account?',
                    style: greyTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/register', (route) => false);
                    },
                    child: Text(
                      'Register',
                      style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
