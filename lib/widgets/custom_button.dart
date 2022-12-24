// ignore_for_file: use_decorated_box

import 'package:flutter/material.dart';
import 'package:trading_journal/utils/text_enum.dart';

import '../utils/colors.dart';
import 'text.dart';

class CustomButton extends StatelessWidget {
  final String? title;
  final bool? isActive;
  final Icon? icon;
  final Function()? onTap;
  final ButtonEnum type;
  const CustomButton({
    this.title,
    this.isActive,
    required this.onTap,
    this.icon,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GestureDetector(
        onTap: isActive ?? false ? onTap : null,
        child: Container(
          decoration: BoxDecoration(
            border: isActive ?? true
                ? Border.all(color: ColorsCustom.mainColor)
                : Border.all(color: const Color(0xFFC7C8CD)),
            color: isActive ?? true
                ? type == ButtonEnum.primary
                    ? ColorsCustom.mainColor
                    : Colors.white
                : ColorsCustom.greyDarkColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null)
                    icon ?? const SizedBox()
                  else
                    const SizedBox(),
                  if (title != null && icon != null)
                    const SizedBox(
                      width: 10,
                    ),
                  if (title != null)
                    TextCustom(
                      text: title,
                      type: TextEnum.BUTTON1,
                      color: type != ButtonEnum.primary
                          ? ColorsCustom.mainColor
                          : Colors.white,
                    )
                  else
                    const SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum ButtonEnum { primary, secondary }

extension ButtonEnumExtension on ButtonEnum {
  String get name {
    switch (this) {
      case ButtonEnum.primary:
        return 'primary';
      case ButtonEnum.secondary:
        return 'secondary';
      default:
        return "";
    }
  }
}
