// ignore_for_file: library_private_types_in_public_api
import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextF extends StatefulWidget {
  const TextF({
    super.key,
    this.curFocusNode,
    this.nextFocusNode,
    this.hint,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.controller,
    this.onTap,
    this.textAlign,
    this.enable,
    this.inputFormatter,
    this.minLine,
    this.maxLine,
    this.prefixIcon,
    this.isHintVisible = true,
    this.prefixText,
    this.hintText,
    this.autofillHints,
    this.isOutlineInputBorder = true,
  });

  final FocusNode? curFocusNode;
  final FocusNode? nextFocusNode;
  final String? hint;
  final Function(String)? validator;
  final Function(String)? onChanged;
  final Function? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool? obscureText;
  final int? minLine;
  final int? maxLine;
  final Widget? suffixIcon;
  final TextAlign? textAlign;
  final bool? enable;
  final List<TextInputFormatter>? inputFormatter;
  final bool isHintVisible;
  final Widget? prefixIcon;
  final String? prefixText;
  final String? hintText;
  final Iterable<String>? autofillHints;
  final bool? isOutlineInputBorder;

  @override
  _TextFState createState() => _TextFState();
}

class _TextFState extends State<TextF> {
  bool isFocus = false;
  String currentVal = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimens.space12),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isHintVisible)
              Text(
                "${widget.hint} *",
                textScaleFactor: 1.1,
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: Dimens.space8),
              child: TextFormField(
                key: widget.key,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                autofillHints: widget.autofillHints,
                enabled: widget.enable,
                obscureText: widget.obscureText ?? false,
                focusNode: widget.curFocusNode,
                keyboardType: widget.keyboardType,
                controller: widget.controller,
                textInputAction: widget.textInputAction,
                textAlign: widget.textAlign ?? TextAlign.start,
                minLines: widget.minLine ?? 1,
                maxLines: widget.maxLine ?? 10,
                inputFormatters: widget.inputFormatter,
                textAlignVertical: TextAlignVertical.center,
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  prefixText: widget.prefixText,
                  alignLabelWithHint: true,
                  isDense: true,
                  hintText: widget.hintText,
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).hintColor,
                      ),
                  suffixIcon: widget.suffixIcon,
                  /*
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: Dimens.space12),
                    child: widget.prefixIcon,
                  ),
                  prefixIconConstraints: BoxConstraints(
                    minHeight: Dimens.space24,
                    maxHeight: Dimens.space24,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: Dimens.space12,
                    horizontal: Dimens.space16,
                  ),
                  */
                  enabledBorder: widget.isOutlineInputBorder!
                      ? OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius:
                              BorderRadius.circular(Dimens.cornerRadius),
                          borderSide: const BorderSide(
                            color: Palette.gray,
                          ),
                        )
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.primaryWithOpacity,
                          ),
                        ),
                  disabledBorder: widget.isOutlineInputBorder!
                      ? OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius:
                              BorderRadius.circular(Dimens.cornerRadius),
                          borderSide: const BorderSide(
                            color: Palette.gray,
                          ),
                        )
                      : null,
                  errorStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Palette.red,
                      ),
                  focusedErrorBorder: widget.isOutlineInputBorder!
                      ? OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius:
                              BorderRadius.circular(Dimens.cornerRadius),
                          borderSide: const BorderSide(
                            color: Palette.red,
                          ),
                        )
                      : null,
                  errorBorder: widget.isOutlineInputBorder!
                      ? OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius:
                              BorderRadius.circular(Dimens.cornerRadius),
                          borderSide: const BorderSide(
                            color: Palette.red,
                          ),
                        )
                      : null,
                  focusedBorder: widget.isOutlineInputBorder!
                      ? OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius:
                              BorderRadius.circular(Dimens.cornerRadius),
                          borderSide: const BorderSide(
                            color: Palette.primary,
                          ),
                        )
                      : null,
                ),
                validator: widget.validator as String? Function(String?)?,
                onChanged: widget.onChanged,
                onTap: widget.onTap as void Function()?,
                onFieldSubmitted: (value) {
                  setState(() {
                    fieldFocusChange(
                      context,
                      widget.curFocusNode ?? FocusNode(),
                      widget.nextFocusNode,
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode? nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
