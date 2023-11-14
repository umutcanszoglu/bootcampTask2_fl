import 'package:flutter/material.dart';

class Numbers extends StatelessWidget {
  const Numbers({super.key, required this.number, required this.color, this.onTap});
  final String number;
  final Color color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(4),
        alignment: Alignment.center,
        width: 110,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 0,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Text(
          number,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
