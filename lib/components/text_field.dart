import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextfieldsWidget extends StatefulWidget {
  final String? fieldName;
  final Icon? iconName;
  final bool isObscure;
  final TextInputType? keyboardType;
  final TextEditingController? controller;

  const TextfieldsWidget({
    Key? key,
    this.fieldName,
    this.iconName,
    required this.isObscure,
    this.keyboardType,
    this.controller,
  }) : super(key: key);

  @override
  _TextfieldsWidgetState createState() => _TextfieldsWidgetState();
}

class _TextfieldsWidgetState extends State<TextfieldsWidget> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 10,
      ),
      child: SizedBox(
        height: 50,
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.isObscure && obscureText,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            hintText: widget.fieldName,
            hintStyle: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            prefixIcon: widget.iconName,
            suffixIcon: widget.isObscure
                ? Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () => setState(() => obscureText = !obscureText),
                      child: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : null,
            suffixIconConstraints: BoxConstraints(maxHeight: Get.height * 0.05),
          ),
        ),
      ),
    );
  }
}
