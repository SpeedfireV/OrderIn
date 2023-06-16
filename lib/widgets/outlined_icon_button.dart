import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../variables/colors.dart';

class ElevatedIconButton extends ConsumerStatefulWidget {
  const ElevatedIconButton(
      {super.key, required this.icon, required this.function});
  final IconData icon;
  final VoidCallback function;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      OutlinedIconButtonState();
}

class OutlinedIconButtonState extends ConsumerState<ElevatedIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.all(12),
      onPressed: widget.function,
      icon: Icon(
        widget.icon,
        size: 28,
        color: AppColors.mainColor,
      ),
      style: ButtonStyle(
        elevation: MaterialStatePropertyAll(1.5),
        backgroundColor: MaterialStatePropertyAll(AppColors.lightColor),
      ),
    );
  }
}
