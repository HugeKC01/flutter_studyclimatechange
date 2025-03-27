import 'package:flutter/material.dart';
import 'package:climatechange/style/style.dart';


class NextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  const NextButton({
    super.key,
    required this.onPressed,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;

  const BackButton({
    super.key,
    required this.onPressed,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: onPressed,
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}


//template for custom button
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final double width;
  final double height;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.width = 200,
    this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}