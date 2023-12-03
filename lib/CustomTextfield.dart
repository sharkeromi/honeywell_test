import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honeywell_test/const.dart';

class CustomModifiedTextField extends StatelessWidget {
  final String? label, hint, errorText;
  final bool autoFocus, obscureText, readOnly;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final ValueChanged<String>? onSubmit;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength, maxLines, minLines;
  final Function(String)? onChanged;
  final Widget? counter;
  final FocusNode? focusNode;
  final Function()? onSuffixPress;
  final IconData? prefixIcon, suffixIcon;
  final TextStyle? textInputStyle, textHintStyle;
  final Color? fillColor;
  final bool? isFilled;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final InputBorder? border;

  const CustomModifiedTextField({
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixPress,
    this.counter,
    this.autoFocus = false,
    this.obscureText = false,
    this.readOnly = false,
    this.focusNode,
    this.maxLength = 255,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters = const [],
    required this.controller,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.onSubmit,
    this.onChanged,
    Key? key,
    this.errorText,
    this.textInputStyle,
    this.textHintStyle,
    this.contentPadding,
    this.fillColor,
    this.isFilled,
    this.borderRadius,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var inputStyle = regular16TextStyle(cBlackColor);
    var hintStyle = regular16TextStyle(cPlaceHolderColor);
    return Theme(
      data: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused) || controller.text.isNotEmpty) {
            return cBlackColor;
          }
          return cIconColor;
        }),
        suffixIconColor: MaterialStateColor.resolveWith((Set<MaterialState> states) {
          if (states.contains(MaterialState.focused) || controller.text.isNotEmpty) {
            return cBlackColor;
          }
          return cIconColor;
        }),
      )),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        obscureText: obscureText,
        textAlign: TextAlign.start,
        textCapitalization: TextCapitalization.sentences,
        style: textInputStyle ?? inputStyle,
        readOnly: readOnly,
        focusNode: focusNode,
        autofocus: autoFocus,
        maxLength: maxLength,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        cursorColor: cBlackColor,
        decoration: InputDecoration(
          errorText: errorText,
          errorStyle: regular12TextStyle(cRedColor),
          isDense: true,
          filled: isFilled ?? true,
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Transform.scale(
                    scale: .85,
                    child: Icon(
                      prefixIcon,
                      size: 20,
                    ),
                  ),
                )
              : null,
          prefixIconConstraints: const BoxConstraints(),
          suffixIconConstraints: const BoxConstraints(),

          // fillColor: fillColor ?? cGreyBoxColor,
          alignLabelWithHint: true,
          labelText: label,
          hintText: hint,
          labelStyle: hintStyle,
          hintStyle: textHintStyle ?? hintStyle,
          counter: (counter == null) ? const SizedBox.shrink() : counter,
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 4),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
          errorBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
          focusedBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
          focusedErrorBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
          disabledBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
          enabledBorder: border ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              ),
        ),
        autocorrect: false,
        keyboardType: inputType,
        textInputAction: inputAction,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        inputFormatters: inputFormatters,
      ),
    );
  }
}
