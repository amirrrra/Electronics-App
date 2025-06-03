import 'package:electronics_app/core/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatefulWidget {
  final String hint;
  final void Function(String?)? onSaved;

  const PasswordFieldWidget({super.key, required this.hint, this.onSaved});

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextfieldWidget(
      onSaved: widget.onSaved,
      obscureText: isObscure,
      hint: widget.hint,
      textInputType: TextInputType.visiblePassword,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        icon: Icon(
          isObscure ? Icons.visibility_off : Icons.visibility,
          color: Color(0xFFC9CECF),
        ),
      ),
    );
  }
}
