import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PinTextFiled extends StatefulWidget {
  final String? initPin;
  final int length;
  final Function(String) onSubmit;
  final double fieldWidth;
  final TextStyle textStyle;
  final Color borderColor;
  final MainAxisAlignment mainAxisAlignment;

  const PinTextFiled({
    super.key,
    this.initPin,
    this.length = 4,
    required this.onSubmit,
    this.fieldWidth = 30,
    this.textStyle = const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    this.borderColor = Colors.blue,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
  }) : assert(length > 0);

  @override
  State<PinTextFiled> createState() => _PinTextFiledState();
}

class _PinTextFiledState extends State<PinTextFiled> {
  late List<String?> _pin;
  late List<FocusNode?> _focusNodes;
  late List<TextEditingController?> _textControllers;

  Widget otpcount = Container();

  @override
  void initState() {
    super.initState();
    _pin = List<String?>.filled(widget.length, null, growable: true);
    _focusNodes = List<FocusNode?>.filled(widget.length, null, growable: true);
    _textControllers = List<TextEditingController?>.filled(widget.length, null,
        growable: true);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.initPin != null) {
          for (var i = 0; i < widget.initPin!.length; i++) {
            _pin[i] = widget.initPin![i];
          }
        }
        otpcount = generateTextcount(context);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget generateTextcount(BuildContext context) {
    List<Widget> textcount = List.generate(widget.length, (int i) {
      return buildTextField(i, context);
    });

    if (_pin.first != null) {
      FocusScope.of(context).requestFocus(_focusNodes[0]);
    }

    return Row(
      mainAxisAlignment: widget.mainAxisAlignment,
      verticalDirection: VerticalDirection.down,
      children: textcount,
    );
  }

  Widget buildTextField(int i, BuildContext context) {
    if (_focusNodes[i] == null) {
      _focusNodes[i] =
          FocusNode(onKeyEvent: (FocusNode focusNode, KeyEvent event) {
        if (event.logicalKey == LogicalKeyboardKey.backspace &&
            event is KeyDownEvent) {
          if (_textControllers[i]!.text.isEmpty) {
            if (i > 0) {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
              _textControllers[i - 1]!.text = '';
            }
          } else {
            _textControllers[i]!.text = '';
          }
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      });
    }
    if (_textControllers[i] == null) {
      _textControllers[i] = TextEditingController();
      if (widget.initPin != null) {
        _textControllers[i]!.text = widget.initPin![i];
      }
    }

    _focusNodes[i]!.addListener(() {
      if (_focusNodes[i]!.hasFocus) {}
    });

    return Container(
      height: widget.fieldWidth,
      width: widget.fieldWidth,
      margin: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 2,
      ),
      child: TextField(
        autofocus: true,
        showCursor: false,
        controller: _textControllers[i],
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        keyboardType: TextInputType.phone,
        textAlign: TextAlign.center,
        style: widget.textStyle,
        focusNode: _focusNodes[i],
        maxLength: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: widget.borderColor,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: widget.borderColor.withOpacity(0.3),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: widget.borderColor.withOpacity(0.3),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: widget.borderColor.withOpacity(0.3),
            ),
          ),
        ),
        onChanged: (String text) {
          setState(() {
            _pin[i] = text;
          });

          if (text.isNotEmpty) {
            if (i < widget.length - 1) {
              FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
            } else {
              FocusScope.of(context).unfocus();
            }
          } else {
            if (i != 0) {
              FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
            }
          }

          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
        onSubmitted: (String text) {
          if (_pin.every((String? digit) => digit != null && digit != '')) {
            widget.onSubmit(_pin.join());
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return otpcount;
  }
}
