import 'package:amritha_ayurveda/core/themes/app_theme.dart';
import 'package:flutter/material.dart';

class PaymentOptionWidget extends StatelessWidget {
  final String options;
  const PaymentOptionWidget({super.key, required this.options});

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(theme.spaces.space_500)),
          child: const CircleAvatar(
            radius: 10,
          ),
        ),
        SizedBox(
          width: theme.spaces.space_100,
        ),
        Text(options)
      ],
    );
  }
}
