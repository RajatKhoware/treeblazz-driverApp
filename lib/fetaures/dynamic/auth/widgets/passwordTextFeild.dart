import 'package:flutter/material.dart';
import 'package:tb_driver/utils/comman/my_text.dart';

class PasswordTextFeild extends StatefulWidget {
  final TextEditingController controller;
  final String headingText;
  final String hintText;

  final FocusNode? focusNode;
  final Function(String)? onSubmit;
  final String? Function(String?)? validator;
  const PasswordTextFeild(
      {super.key,
      required this.controller,
      required this.headingText,
      required this.hintText,
      this.validator,
      this.focusNode,
      this.onSubmit});

  @override
  State<PasswordTextFeild> createState() => _PasswordTextFeildState();
}

class _PasswordTextFeildState extends State<PasswordTextFeild> {
  bool _passVisibility = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    OutlineInputBorder lineBorder = OutlineInputBorder(
      borderSide: BorderSide(
        width: width * 0.002,
        color: Colors.black.withOpacity(0.3),
      ),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.02),
        MyTextPoppines(
          text: widget.headingText,
          fontSize: width * 0.038,
          color: Colors.black.withOpacity(0.4),
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: height * 0.01),
        TextFormField(
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          controller: widget.controller,
          cursorColor: Colors.black,
          autofocus: false,
          obscureText: _passVisibility,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              horizontal: width * 0.03,
              vertical: height * 0.025,
            ),
            hintText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintStyle: TextStyle(
              fontSize: width * 0.038,
              fontWeight: FontWeight.w600,
            ),
            fillColor: Colors.white,
            border: lineBorder,
            enabledBorder: lineBorder,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(width * 0.04),
              borderSide: BorderSide(color: Colors.blue, width: width * 0.004),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
            ),
            focusColor: Colors.black,
            suffixIcon: IconButton(
              icon: _passVisibility
                  ? const Icon(Icons.visibility_off_outlined)
                  : const Icon(Icons.visibility_outlined),
              onPressed: () {
                _passVisibility = !_passVisibility;
                setState(() {});
              },
            ),
          ),
          validator: widget.validator,
          focusNode: widget.focusNode,
          onFieldSubmitted: widget.onSubmit,
        ),
      ],
    );
  }
}
