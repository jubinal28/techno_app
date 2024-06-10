import 'package:flutter/material.dart';
import 'package:techno_app/constants/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? enabled;
  final String hintText;
  final double height;
  final bool? readOnly;
  final bool? shrink;
  final TextStyle hintStyle;
  final String? errorText;
  final RegExp regex;
  final Color? errorColor;
  final Function(String)? onChanged;
  final Function()? onTap;
  final String? Function(String?)? validator;
  const CustomTextField({
    required Key key,
    required this.height,
    required this.controller,
    this.readOnly = false,
    required this.obscureText,
    this.shrink,
    this.enabled = false,
    this.suffixIcon,
    this.prefixIcon,
    this.errorText,
    required this.hintText,
    required this.hintStyle,
    required this.regex,
    this.onChanged,
    this.onTap,
    this.validator,
    this.errorColor,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.shrink == true ? 0 : widget.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            // color: Colors.grey.shade200,
            color: Colors.white),
        child: TextFormField(
          obscureText: widget.obscureText,
          controller: widget.controller,
          onChanged: widget.onChanged,
          validator: widget.validator,
          enabled: !(widget.readOnly ?? true),
          readOnly: widget.readOnly ?? true,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            errorText: widget.errorText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: _getBorderColor(),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: _getBorderColor(),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1.5,
                color: _getBorderColor(),
              ),
            ),
            hintText: widget.hintText,
            hintStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }

  Color _getBorderColor() {
    if (widget.errorText != null) {
      return widget.errorColor ?? CustomColors.errorColor;
    } else {
      return widget.controller.text.trim().isEmpty
          ? CustomColors.borderColor
          : widget.regex.hasMatch(widget.controller.text.trim())
              ? CustomColors.primaryColor
              : CustomColors.errorColor;
    }
  }
}
