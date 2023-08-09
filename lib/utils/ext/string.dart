import 'dart:developer';

import 'package:time2Travel/core/core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  bool isValidPhoneNumber() {
    return RegExp(
      r'^\+?\d{1,3}-?\d{3}-?\d{3}-?\d{4}$',
    ).hasMatch(this);
  }

  void toToastError(BuildContext context) {
    try {
      final message = isEmpty ? "error" : this;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Palette.red,
          content: Text(message),
          duration: const Duration(seconds: 2),
        ),
      );
    } catch (e) {
      log("error $e");
    }
  }

  String formateDateToTime() {
    try {
      final date = DateTime.parse(this);
      return DateFormat.Hm().format(date);
    } catch (e) {
      log("error $e");
      return "";
    }
  }

  String convertDurationToTime() {
    try {
      final duration = Duration(minutes: int.parse(this));
      return "${duration.inHours}h ${duration.inMinutes.remainder(60)}m";
    } catch (e) {
      log("error $e");
      return "";
    }
  }

  String toDateFormate() {
    try {
      final date = DateTime.parse(this);
      return DateFormat.yMMMd().format(date);
    } catch (e) {
      log("error $e");
      return "";
    }
  }

  String toDayFormate() {
    try {
      final date = DateTime.parse(this);
      return DateFormat.EEEE().format(date);
    } catch (e) {
      log("error $e");
      return "";
    }
  }
}
