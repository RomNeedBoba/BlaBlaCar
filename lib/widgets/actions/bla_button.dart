import 'package:flutter/material.dart';
import '../../theme/theme.dart';

class BlaButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final IconData? icon;
  final VoidCallback onPressed;

  const BlaButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.isPrimary = true,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: _buttonStyle(),
      onPressed: onPressed,
      child: _buildContent(),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: isPrimary ? BlaColors.primary : Colors.white,
      side: BorderSide(color: BlaColors.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
      ),
    );
  }

  Widget _buildContent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null) Icon(icon, color: _iconColor()),
        if (icon != null) const SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: _iconColor()),
        ),
      ],
    );
  }

  Color _iconColor() => isPrimary ? Colors.white : BlaColors.primary;
}
