import 'package:flutter/material.dart';
import 'package:orders_system/core/utils/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    this.child,
    this.onPressed,
    this.width = double.infinity,
    this.height = 50,
    this.backgroundColor = AppColors.primaryColor,
    this.borderColor = Colors.white,
    this.foregroundColor = Colors.white,
  });

  final Widget? child;
  final void Function()? onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).elevatedButtonTheme.style!.copyWith(
            minimumSize: MaterialStatePropertyAll(Size(width, height)),
            backgroundColor: MaterialStatePropertyAll(backgroundColor),
            foregroundColor: MaterialStatePropertyAll(foregroundColor),
            side: MaterialStatePropertyAll(
              BorderSide(
                color: borderColor,
              ),
            ),
          ),
      onPressed: onPressed,
      child: child,
    );
  }
}
