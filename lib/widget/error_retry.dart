import 'package:flutter/material.dart';

class ErrorRetry extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;

  const ErrorRetry({
    Key? key,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          const Text(
            "Oops!",
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          const Text(
            "Something Went Wrong\nPlease Try Again",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: onPressed,
          )
        ],
      ),
    ));
  }
}
