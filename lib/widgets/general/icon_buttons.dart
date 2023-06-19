import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../variables/colors.dart';

class ElevatedIconButton extends ConsumerStatefulWidget {
  const ElevatedIconButton(
      {super.key, required this.icon, required this.function});
  final IconData icon;
  final VoidCallback function;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      ElevatedIconButtonState();
}

class ElevatedIconButtonState extends ConsumerState<ElevatedIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.all(12),
      onPressed: widget.function,
      icon: Icon(
        widget.icon,
        size: 28,
        color: AppColors.mainColor,
      ),
      style: ButtonStyle(
        elevation: const MaterialStatePropertyAll(1.5),
        backgroundColor: MaterialStatePropertyAll(AppColors.lightColor),
      ),
    );
  }
}

class OutlinedIconButton extends ConsumerStatefulWidget {
  const OutlinedIconButton(
      {super.key,
      required this.icon,
      required this.function,
      this.size,
      this.padding});
  final IconData icon;
  final VoidCallback function;
  final double? size;
  final double? padding;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OutlinedIconButtonState();
}

class _OutlinedIconButtonState extends ConsumerState<OutlinedIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: widget.size ?? 28,
      padding: EdgeInsets.all(widget.padding ?? 12),
      onPressed: widget.function,
      icon: Icon(
        widget.icon,
        size: widget.size ?? 28,
        color: AppColors.mainColor,
      ),
      style: ButtonStyle(
        minimumSize: const MaterialStatePropertyAll(Size(0, 0)),
        side: MaterialStatePropertyAll(
            BorderSide(color: AppColors.mainColorReversed)),
        backgroundColor: MaterialStatePropertyAll(AppColors.lightColor),
      ),
    );
  }
}
