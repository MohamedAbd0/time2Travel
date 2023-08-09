import 'package:time2Travel/features/auth/presentaion/widget/widget.dart';
import 'package:flutter/material.dart';
import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/features.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// Controller
  final _conFullName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPhone = TextEditingController();
  final _conPassword = TextEditingController();
  final _conPasswordRepeat = TextEditingController();

  /// Focus Node
  final _fnFullName = FocusNode();
  final _fnEmail = FocusNode();
  final _fnPhone = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordRepeat = FocusNode();

  /// Global key form
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Parent(
      backgroundAsset: Images.background,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (_, state) {
          if (state is AuthStateLoading) {
            context.show();
          } else if (state is AuthStateSuccess) {
            context.dismiss();
            context.dismiss();
            //context.go(Routes.home.path);
          } else if (state is AuthStateVerifyOtp) {
            context.dismiss();
            openOtpDialog(context: context, userId: state.userID!);
          } else if (state is AuthStateFailed) {
            context.dismiss();
            state.error.toString().toToastError(context);
          }
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.space24),
              child: Form(
                key: _keyForm,
                child: CustomContaner(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const HeaderText(
                        text: "Register for New User",
                      ),
                      TextF(
                        key: const Key("full_name"),
                        curFocusNode: _fnFullName,
                        nextFocusNode: _fnEmail,
                        textInputAction: TextInputAction.next,
                        controller: _conFullName,
                        keyboardType: TextInputType.text,
                        hintText: 'Mohamed Abdo',
                        hint: "Full Name",
                        validator: (String? value) => value != null
                            ? (value.length < 5 ? "Invalid name" : null)
                            : null,
                      ),
                      TextF(
                        key: const Key("email"),
                        curFocusNode: _fnEmail,
                        nextFocusNode: _fnPhone,
                        textInputAction: TextInputAction.next,
                        controller: _conEmail,
                        keyboardType: TextInputType.emailAddress,
                        hintText: 'username@domain.com',
                        hint: "Email",
                        validator: (String? value) => value != null
                            ? (!value.isValidEmail()
                                ? "Invalid email format"
                                : null)
                            : null,
                      ),
                      TextF(
                        key: const Key("phone"),
                        curFocusNode: _fnPhone,
                        nextFocusNode: _fnPassword,
                        textInputAction: TextInputAction.next,
                        controller: _conPhone,
                        keyboardType: TextInputType.phone,
                        hintText: '+971556074080',
                        hint: "Phone",
                        validator: (String? value) => value != null
                            ? (!value.isValidPhoneNumber()
                                ? "Invalid phone number format"
                                : null)
                            : null,
                      ),
                      TextF(
                        isHintVisible: true,
                        key: const Key("password"),
                        curFocusNode: _fnPassword,
                        nextFocusNode: _fnPasswordRepeat,
                        textInputAction: TextInputAction.next,
                        controller: _conPassword,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        hintText: '••••••••••••',
                        maxLine: 1,
                        hint: "Password",
                        validator: (String? value) => value != null
                            ? (value.length < 8
                                ? "Password must be at least 8 characters"
                                : null)
                            : null,
                      ),
                      TextF(
                        isHintVisible: true,
                        key: const Key("confirm_password"),
                        curFocusNode: _fnPasswordRepeat,
                        textInputAction: TextInputAction.done,
                        controller: _conPasswordRepeat,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        hintText: '••••••••••••',
                        maxLine: 1,
                        hint: "Confirm Password",
                        validator: (String? value) => value != null
                            ? (value != _conPassword.text
                                ? "Password not match"
                                : null)
                            : null,
                      ),
                      const SpacerV(),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Checkbox(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: const VisualDensity(
                                horizontal: -4, vertical: -4),
                            value: true,
                            onChanged: (value) {},
                          ),
                          const SpacerH(),
                          const Expanded(
                            child: Text(
                              "i agree to the terms of service and privacy policy",
                              style: TextStyle(color: Colors.grey),
                              textScaleFactor: 0.8,
                            ),
                          ),
                        ],
                      ),
                      SpacerV(value: Dimens.space16),
                      Button(
                        key: const Key("btn_register"),
                        title: "Register",
                        onPressed: () {
                          /// Validate form first
                          if (_keyForm.currentState?.validate() ?? false) {
                            context.read<AuthCubit>().register(
                                  RegisterParams(
                                    email: _conEmail.text,
                                    password: _conPassword.text,
                                    name: _conFullName.text,
                                    phone: _conPhone.text,
                                  ),
                                );
                          }
                        },
                      ),
                      SpacerV(value: Dimens.space16),
                      Wrap(
                        children: [
                          const Text(
                            "Already have an account?",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SpacerH(),
                          ButtonText(
                            title: "Login",
                            onPressed: () {
                              /// Direct to register page
                              context.back();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  openOtpDialog({context, required int userId}) {
    showDialog(
      context: context,
      builder: (context) {
        return OtpDialogContant(
          onSubmit: (value) {
            context.read<AuthCubit>().otp(
                  OtpParams(
                    userID: userId,
                    code: value,
                  ),
                );
          },
        );
      },
    );
  }
}
