import 'package:flutter/material.dart';
import 'package:rokomari_toast/status.dart';
import 'package:rokomari_toast/widgets/rokomari_toast.dart';

class ROKOMARIToast {
  final BuildContext context;
  final String message;
  final MessageStatus status;
  final Duration? duration;

  ROKOMARIToast(
      {required this.context,
      required this.status,
      required this.message,
      this.duration});

  show() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: duration ?? const Duration(seconds: 1),
      behavior: SnackBarBehavior.fixed,
      content: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.15),
        child: StatusMessageWidget(
          showShadow: true,
          title: status == MessageStatus.error
              ? "Error"
              : status == MessageStatus.successful
                  ? "Success"
                  : status == MessageStatus.warning
                      ? "Warning"
                      : status == MessageStatus.information
                          ? "Information"
                          : '',
          message: message,
          status: status,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ));
  }
}
