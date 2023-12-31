import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DefaultTextFormField extends StatelessWidget {
  String? text;
  IconData? prefixicon;
  String? Function(String?)? validate;
  void Function()? onTap;
  TextEditingController? controller;

  DefaultTextFormField({
    super.key,
    required this.text,
    required this.prefixicon,
    required this.validate,
    this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
          hintText: text,
          prefixIcon: Icon(
            prefixicon,
          ),
        ),
        validator: validate,
        onTap: onTap,
      ),
    );
  }
}
