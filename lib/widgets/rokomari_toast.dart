import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../status.dart';

class StatusMessageWidget extends StatelessWidget {
  final bool showShadow;

  final int? value;

  final String? title, message;

  final MessageStatus status;
  final double? height;

  const StatusMessageWidget(
      {Key? key,
      this.showShadow = false,
      this.title,
      this.value,
      required this.message,
      required this.status,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      margin: const EdgeInsets.only(top: 10),
      decoration: ShapeDecoration(
        color: status == MessageStatus.error
            ? const Color(0xFFFE5050)
            : status == MessageStatus.successful
                ? const Color(0xFF2FA92C)
                : status == MessageStatus.warning
                    ? const Color(0xFFFFA41A)
                    : status == MessageStatus.information
                        ? const Color(0xFF4398FE)
                        : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        shadows: [
          if (showShadow)
            const BoxShadow(
              color: Color(0x14000000),
              blurRadius: 5,
              offset: Offset(2, 2),
              spreadRadius: 1,
            )
        ],
      ),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 8),
        decoration: ShapeDecoration(
          color: status == MessageStatus.error
              ? const Color(0xFFFFF2F0)
              : status == MessageStatus.successful
                  ? const Color(0xFFDEFFDD)
                  : status == MessageStatus.warning
                      ? const Color(0xFFFFEED4)
                      : status == MessageStatus.information
                          ? const Color(0xFFEEF6FF)
                          : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            SvgPicture.asset(
                status == MessageStatus.error
                    ? 'assets/images/cancel.svg'
                    : status == MessageStatus.successful
                        ? 'assets/images/ic_done_filled.svg'
                        : status == MessageStatus.warning
                            ? 'assets/images/warning.svg'
                            : status == MessageStatus.information
                                ? 'assets/images/ic_information.svg'
                                : 'assets/images/cancel.svg',
                height: 16,
                width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 8,
                  bottom: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (title != null && title != '')
                      Text(
                        title ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: status == MessageStatus.error
                                  ? const Color(0xFFFE5050)
                                  : status == MessageStatus.successful
                                      ? const Color(0xFF2FA92C)
                                      : status == MessageStatus.warning
                                          ? const Color(0xFFFFA41A)
                                          : status == MessageStatus.information
                                              ? const Color(0xFF4398FE)
                                              : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    Text(
                      message ?? "",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: const Color(0xFF333333),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.24,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
