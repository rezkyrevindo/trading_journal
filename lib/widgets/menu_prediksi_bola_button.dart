// ignore_for_file: use_decorated_box

import 'package:flutter/material.dart';
import 'package:trading_journal/utils/text_enum.dart';

import '../utils/colors.dart';
import 'text.dart';

class MenuPrediksiBolaButton extends StatelessWidget {
  final String title;
  final bool? isActive;
  final Function()? onTap;
  const MenuPrediksiBolaButton({
    required this.title,
    this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: isActive ?? true
                ? Border.all(color: ColorsCustom.mainColor)
                : Border.all(color: const Color(0xFFC7C8CD)),
            color: isActive ?? true ? Colors.white : Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: TextCustom(
                text: title,
                type: TextEnum.LABEL,
                color: isActive ?? true
                    ? ColorsCustom.mainColor
                    : ColorsCustom.greyDarkColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
