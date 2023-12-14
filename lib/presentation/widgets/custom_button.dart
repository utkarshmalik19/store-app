
import 'package:flutter/material.dart';
import 'package:store_app/utils/consts.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String buttonText;
  const CustomButton({super.key, this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
      //For Rounded Border
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              //For giving border color
              side: BorderSide(color: AppConstants.textColor)),
      //For Specifying Size
          minimumSize: Size(300, 50),
          backgroundColor: Colors.purple),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyle(
            color: AppConstants.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
    );
  }
}