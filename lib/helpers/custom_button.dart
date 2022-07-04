import 'package:flutter/material.dart';

// Custom Button UI
class SolidButton extends StatelessWidget {
  const SolidButton({
    Key? key,
    this.name,
    this.color,
    this.onPressed,
  }) : super(key: key);

  final String? name;
  final VoidCallback? onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.015),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: width * 0.045,
            horizontal: width * 0.07,
          ),
          backgroundColor: color ?? Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              width * 0.028,
            ),
          ),
        ),
        child: Text(
          name ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.04,
          ),
        ),
      ),
    );
  }
}

class SmallButton extends StatelessWidget {
  const SmallButton({
    Key? key,
    this.name,
    this.onPressed,
  }) : super(key: key);

  final String? name;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.015),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: width * 0.025,
            horizontal: width * 0.08,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              width * 0.055,
            ),
          ),
        ),
        child: Text(
          name ?? "",
          style: TextStyle(
            color: Colors.white,
            fontSize: width * 0.04,
          ),
        ),
      ),
    );
  }
}
