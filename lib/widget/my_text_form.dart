import 'package:flutter/material.dart';

class MyTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String ?labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function()? onSuffixIconPressed;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final bool autofocus;
  final TextInputAction textInputAction;

  const MyTextForm({
    super.key,
    required this.controller,
     this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSuffixIconPressed,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.autofocus = false,
    this.textInputAction = TextInputAction.done,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(

      controller: controller,
      decoration: InputDecoration(

        labelText: labelText,
        labelStyle: TextStyle(color: theme.colorScheme.primary),
        hintText: hintText,
        prefixIcon:
            prefixIcon != null
                ? Icon(prefixIcon, color: theme.colorScheme.primary)
                : null,
        suffixIcon:
            suffixIcon != null
                ? IconButton(
                  icon: Icon(suffixIcon, color: theme.colorScheme.primary),
                  onPressed: onSuffixIconPressed,
                )
                : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: theme.colorScheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: theme.primaryColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: theme.primaryColor, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: theme.colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: theme.colorScheme.error, width: 2),
        ),
        //filled: true,
        fillColor: theme.primaryColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      enabled: enabled,
      maxLines: maxLines,
      minLines: minLines,
      autofocus: autofocus,
      textInputAction: textInputAction,

      style: theme.textTheme.bodyMedium?.copyWith(
        color:
            enabled
                ? theme.colorScheme.onSurface
                : theme.colorScheme.onSurface.withOpacity(0.5),
      ),
      cursorColor: theme.colorScheme.primary,
    );
  }
}
