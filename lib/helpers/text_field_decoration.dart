import 'package:flutter/material.dart';

// Decoration for TextField in UI
class TextFieldDecoration {
  static InputDecoration rRectDecoration({
    final width,
    String? hint,
    String? label,
    Color? fillColor,
  }) {
    return InputDecoration(
      hintText: hint,
      labelText: label,
      labelStyle: TextStyle(color: Colors.grey[500]),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          width * 0.018,
        ),
        borderSide: BorderSide(
          width: width * 0.002,
          color: Colors.grey[100]!,
        ),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          width * 0.018,
        ),
        borderSide: BorderSide(
          width: width * 0.001,
          // color: Colors.grey[100]!,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          width * 0.018,
        ),
        borderSide: BorderSide(
          width: width * 0.002,
          color: Colors.red,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          width * 0.018,
        ),
        borderSide: BorderSide(
          width: width * 0.002,
          color: Colors.grey[500]!,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          width * 0.018,
        ),
        borderSide: BorderSide(
          width: width * 0.002,
          color: Colors.red,
        ),
      ),
      isDense: true,
      contentPadding: EdgeInsets.symmetric(
        vertical: width * 0.04,
        horizontal: width * 0.045,
      ),
      filled: true,
      fillColor: fillColor ?? Colors.grey[100],
    );
  }
}
