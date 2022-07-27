import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? hinttext;
  final String? label;
  final TextInputType? textInputType;
  final bool IsPass;
  final TextEditingController? textEditingController;

  const CustomTextField({
    Key? key,
    this.height,
    this.width,
    this.hinttext,
    this.suffixIcon,
    this.prefixIcon,
    this.child,
    this.textInputType,
    this.IsPass=false,
    this.label,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 250,
      height: height ?? 50,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0,
          ),
        ],
        border: Border.all(color: Colors.black12),
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: prefixIcon,
            labelText: label,
            suffixIcon: suffixIcon,
            hintText: hinttext,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          controller: textEditingController,
          obscureText: IsPass,
          keyboardType: textInputType,
        ),
      ),
    );
  }
}
