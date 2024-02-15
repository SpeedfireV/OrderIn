import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meatingless/variables/colors.dart';

class SubmitButton extends HookConsumerWidget {
  const SubmitButton({
    super.key,
    required this.function,
    required this.text,
  });
  final Function function;
  final String text;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      style: ButtonStyle(
          minimumSize: const MaterialStatePropertyAll(Size(0, 56)),
          backgroundColor: MaterialStatePropertyAll(AppColors.mainColor),
          surfaceTintColor: MaterialStatePropertyAll(AppColors.mainColor)),
      child: Text(
        text,
        style: TextStyle(
            color: AppColors.lightColor,
            fontWeight: FontWeight.w600,
            fontSize: 16),
      ),
      onPressed: () {
        function.call();
      },
    );
  }
}
