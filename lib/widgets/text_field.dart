// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../utils/text_enum.dart';
import 'text.dart';

class TextFieldCustom extends StatelessWidget {
  final String? titleField;
  final TextAlign? textAlign;
  final Widget? prefix;
  final String? hintText;
  final bool? readOnly;
  final String? suffixText;
  final TextInputType? inputType; //number or text
  final String? Function(String?) validator;
  final bool isMandatory;
  final TextEditingController? controller;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final bool? isGrey;
  final Widget? icon;
  final bool? obsecureText;
  final bool? isRupiahField;
  final void Function()? onEditingComplete;
  final int? maxLength;
  final String? initialValue;
  final int? maxLines;
  final bool? displayCounterText;
  final void Function(String)? onChanged;
  final bool? isFieldOnly;
  final bool? isHidden;
  final double? marginTop;
  final void Function(String?)? onSaved;
  final void Function(String)? onSubmitted;

  const TextFieldCustom({
    this.titleField,
    required this.controller,
    this.hintText,
    required this.validator,
    this.marginTop = 15,
    this.isFieldOnly = false,
    this.isHidden = false,
    this.suffixText,
    this.initialValue = '',
    this.isMandatory = true,
    this.isGrey = false,
    this.isRupiahField = false,
    this.displayCounterText = false,
    this.obsecureText = false,
    this.readOnly = false,
    this.prefix,
    this.onTap,
    this.onEditingComplete,
    this.maxLines = 1,
    this.icon,
    this.inputType = TextInputType.text,
    this.inputFormatters,
    this.onChanged,
    this.textAlign,
    this.maxLength = 9223372036854775807,
    this.onSaved,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: marginTop),
        if (!isFieldOnly!) ...[
          TextCustom(
            text: titleField,
            type: TextEnum.LABEL,
            color: Colors.black,
          ),
          const SizedBox(
            height: 10,
          ),
        ],
        TextFormField(
          onFieldSubmitted: onSubmitted,
          textAlign: isRupiahField ?? false
              ? TextAlign.end
              : textAlign != null
                  ? textAlign!
                  : TextAlign.left,
          initialValue: initialValue == '' ? null : initialValue,
          onChanged: onChanged,
          maxLines: maxLines,
          maxLength: maxLength,
          onSaved: onSaved,
          onTap: onTap ?? () {},
          readOnly: readOnly ?? false,
          onEditingComplete: onEditingComplete,
          inputFormatters: inputFormatters,
          decoration: InputDecoration(
            suffixIconConstraints: const BoxConstraints(
              minWidth: 2,
              minHeight: 2,
            ),
            prefixIcon: isRupiahField ?? false
                ? Container(
                    padding: const EdgeInsets.all(10),
                    child: const TextCustom(
                      text: 'Rp',
                      type: TextEnum.CAPTION,
                    ),
                  )
                : null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 2,
              minHeight: 2,
            ),
            suffixText: suffixText,
            suffixIcon: icon,
            filled: true,
            fillColor: isGrey! || readOnly! ? ColorsCustom.greyBackgroundColor : ColorsCustom.secondaryColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
            ),
            contentPadding: const EdgeInsets.all(20),
            hintText: hintText ?? ("Masukkan ${titleField ?? ""}"),
            counterText: displayCounterText! ? null : "",
            hintStyle: GoogleFonts.nunitoSans().copyWith(
              color: ColorsCustom.greyDarkColor,
              fontSize: 12,
            ),
          ),
          obscureText: obsecureText ?? false,
          style: GoogleFonts.nunitoSans().copyWith(color: Colors.black, fontSize: 12),
          keyboardType: (isRupiahField ?? false) ? TextInputType.number : inputType,
          validator: validator,
          controller: controller,
        ),
      ],
    );
  }
}
