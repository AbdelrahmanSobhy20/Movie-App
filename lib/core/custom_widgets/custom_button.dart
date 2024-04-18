import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.width,
  });

  final String label;
  final void Function()? onPressed;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                fixedSize: Size(width?? MediaQuery.sizeOf(context).width-48, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)
                )
            ),
            onPressed: onPressed,
            child: Text(label , style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).colorScheme.secondary,
            ),)));
  }
}