import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../variables/colors.dart';
import '../snackbar.dart';

void showInformationalSnackbar(
    {required String text,
    required BuildContext context,
    required WidgetRef ref}) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(
          backgroundColor: AppColors.secondaryColor,
          duration: const Duration(milliseconds: 3000),
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
            ),
          )))
      .closed
      .then((value) => ref.read(snackbarProvider.notifier).state = false);
}
