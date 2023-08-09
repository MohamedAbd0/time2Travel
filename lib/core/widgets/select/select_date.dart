// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'base/selection_widget.dart';

class SelectDate extends StatefulWidget {
  final ValueChanged<DateTime> onSelect;
  final String title;
  final String? hintText;
  final DateTime? initValue;
  final DateTime? firstDate;
  const SelectDate({
    Key? key,
    required this.onSelect,
    required this.title,
    this.hintText,
    this.initValue,
    this.firstDate,
  }) : super(key: key);

  @override
  State<SelectDate> createState() => _SelectPikerState();
}

class _SelectPikerState extends State<SelectDate> {
  TextEditingController textEditingController = TextEditingController();

  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.initValue != null) {
      Future.delayed(Duration.zero, () => selectValue(widget.initValue!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectionWidget(
      title: widget.title,
      hintText: widget.hintText,
      icon: Icons.calendar_month,
      value: selectedDate != null
          ? DateFormat('d MMM, yyyy').format(selectedDate!)
          : null,
      onTap: () {
        _showModal(context);
      },
    );
  }

  _showModal(context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: widget.initValue ?? widget.firstDate ?? DateTime.now(),
      firstDate: widget.firstDate ??
          DateTime(
              DateTime.now().year, DateTime.now().month, DateTime.now().day),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      selectValue(pickedDate);
    }
  }

  void selectValue(DateTime value) {
    setState(() {
      selectedDate = value;
      widget.onSelect(value);
    });
  }
}
