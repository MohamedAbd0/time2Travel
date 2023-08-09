import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/features/auth/presentaion/widget/widget.dart';
import 'package:flutter/material.dart';

class OtpDialogContant extends StatefulWidget {
  final Function(String) onSubmit;
  const OtpDialogContant({super.key, required this.onSubmit});

  @override
  State<OtpDialogContant> createState() => _OtpDialogContantState();
}

class _OtpDialogContantState extends State<OtpDialogContant> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimens.smallCornerRadius),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const LoaingNewMessageWidget(),
          const HeaderText(
            text: "Verify Code",
          ),
          const Text(
            "We sent an OTP code on your\n Email.",
            textAlign: TextAlign.center,
          ),
          SpacerV(value: Dimens.space16),
          PinTextFiled(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            length: 6,
            onSubmit: (value) {
              setState(() => code = value);
              widget.onSubmit(value);
            },
          ),
          SpacerV(value: Dimens.space16),
          Button(
            title: "Validate",
            onPressed: () {
              widget.onSubmit(code);
            },
          ),
        ],
      ),
    );
  }
}
