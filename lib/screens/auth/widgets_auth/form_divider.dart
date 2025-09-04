import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';


class WFormDivider extends StatelessWidget {
  const WFormDivider({
    super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            child: Divider(
              color: WColors.tprimary,
              thickness: 0.5,
              indent: 60,
              endIndent: 5,
            )),
        Text(
          dividerText,
          style: const TextStyle(color: WColors.tdark,fontSize: 14)
          // Theme.of(context).textTheme.labelMedium,

        ),
         Flexible(
            child: Divider(
              color: WColors.tprimary,

              thickness: 0.5,
              indent: 5,
              endIndent: 60,
            )),
      ],
    );
  }
}