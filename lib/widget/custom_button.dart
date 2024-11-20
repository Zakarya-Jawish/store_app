import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.function,
    required this.text,
    this.color = Colors.white,
    this.colorText = Colors.black,
  });
  final String text;
  final Color color;
  final Function() function;
  final Color colorText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: double.infinity,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
          onPressed: function,
          child: Text(
            text,
            style: TextStyle(fontSize: 25, color: colorText),
          )),
    );
  }
}
