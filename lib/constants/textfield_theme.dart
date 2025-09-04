import 'package:flutter/material.dart';

import 'app_colors.dart';

class WTextFormFieldTheme{
 WTextFormFieldTheme._();

static InputDecorationTheme inputTheme =InputDecorationTheme(
errorMaxLines: 3,
  prefixIconColor: WColors.tsecondary,
  suffixIconColor: WColors.tsecondary,

  labelStyle: const TextStyle().copyWith(fontSize: 14, color: WColors.tsecondary),
  hintStyle: const TextStyle().copyWith(fontSize: 12, color: WColors.tsecondary),
  errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
  floatingLabelStyle: const TextStyle().copyWith(color: WColors.tdark.withOpacity(0.8)),

  border: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(width: 1, color: WColors.tprimary ),
  ),
  enabledBorder: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(width: 1, color: WColors.tprimary),
  ),
  focusedBorder: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(12),
    borderSide: const BorderSide(width: 2, color: WColors.tdark),
  ),

 /* errorBorder: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(),
    borderSide: const BorderSide(width: 1, color: WColors.warning),
  ),

  focusedErrorBorder: const OutlineInputBorder().copyWith(
    borderRadius: BorderRadius.circular(),
    borderSide: const BorderSide(width: 2, color: WColors.warning),
  ),*/
);


}