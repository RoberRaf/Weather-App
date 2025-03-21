import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/core/helpers/app_consts.dart';
import 'package:weather_app/core/theming/app_colors.dart';
import 'package:weather_app/core/theming/text_styles.dart';
import 'package:weather_app/features/general_widgets/adaptive_progress_indicatior.dart';

export 'package:flutter/services.dart';

class MainTextField extends StatefulWidget {
  const MainTextField({
    super.key,
    required this.controller,
    this.enabled = true,
    this.isLoading = false,
    this.hintText,
    this.label,
    this.style = const TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500),
    this.onChange,
    this.onSubmitting,
    this.validator,
    this.suffix,
    this.suffixWidget,
    this.prefix,
    this.hieght = 50,
    this.width = double.infinity,
    this.isPassword = false,
    this.borderRadius = 20,
    this.borderColor = Colors.white,
    this.bgColor = Colors.white,
    this.isFilled = true,
    this.showBorder = true,
    this.inputFormatters,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    this.showShadow = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.prefixOnTap,
  });
  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final TextStyle style;
  final bool enabled;
  final bool isLoading;
  final Function(String)? onChange;
  final Function(String?)? onSubmitting;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? suffixWidget;
  final Widget? prefix;
  final double hieght;
  final double width;
  final double borderRadius;
  final Color borderColor;
  final bool isPassword;
  final bool isFilled;
  final bool showBorder;
  final Color bgColor;
  final EdgeInsets contentPadding;
  final TextInputFormatter? inputFormatters;
  final bool showShadow;
  final int maxLines;
  final int minLines;
  final VoidCallback? prefixOnTap;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late final ValueNotifier<bool> isObscure;
  late final InputBorder focusedBorder, errorBorder, focusedErrorBorder;

  // bool isInvalid = false;
  bool isValid = true;
  @override
  void initState() {
    isObscure = ValueNotifier<bool>(widget.isPassword);

    focusedBorder = UnderlineInputBorder(
      borderRadius: BorderRadius.circular((widget.borderRadius)),
      borderSide: BorderSide(color: !widget.showBorder ? Colors.transparent : widget.borderColor),
    );
    errorBorder = focusedBorder.copyWith(
      borderSide: BorderSide(color: !widget.showBorder ? Colors.transparent : Colors.red),
    );
    focusedErrorBorder = focusedBorder.copyWith(
      borderSide: BorderSide(color: !widget.showBorder ? Colors.transparent : widget.borderColor),
    );
    super.initState();
  }

  String? validate(String? v) {
    if (widget.validator == null) {
      if (!isValid) setState(() => isValid = true);
      return null;
    }
    if (widget.validator!(widget.controller.text) != null) {
      setState(() => isValid = false);
    } else {
      setState(() => isValid = true);
    }
    return widget.validator!(v);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLoading
        ? SizedBox(height: (widget.hieght), child: const AdaptiveProgressIndicator())
        : ValueListenableBuilder(
          valueListenable: isObscure,
          builder: (context, value, child) {
            bool isFilled = widget.isFilled;
            return TextFormField(
              onTapOutside: (event) {
                FocusScope.of(context).unfocus();
              },
              minLines: widget.minLines,
              maxLines: widget.maxLines,
              cursorColor: Co.primary,
              controller: widget.controller,
              enabled: widget.enabled,
              style: !widget.enabled ? TStyle.greySemi(14) : widget.style,
              validator: (v) {
                if (widget.validator == null) return null;
    
                return validate(v);
              },
              onChanged: widget.onChange,
              onSaved: widget.onSubmitting,
              obscureText: value,
              textInputAction: TextInputAction.next,
              inputFormatters: widget.inputFormatters != null ? [widget.inputFormatters!] : null,
              keyboardType:
                  widget.inputFormatters == FilteringTextInputFormatter.digitsOnly ? TextInputType.number : null,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey.shade500),
                labelText: widget.label,
                labelStyle: widget.style,
                contentPadding: widget.contentPadding,
                prefixIcon:
                    widget.prefix == null
                        ? null
                        : widget.prefixOnTap == null
                        ? Padding(
                          padding: const EdgeInsets.all(5),
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Co.primary, borderRadius: AppConsts.defaultRadius),
                            child: Padding(padding: const EdgeInsets.all(8), child: widget.prefix),
                          ),
                        )
                        : Padding(
                          padding: const EdgeInsets.only(right: 5, left: 0),
                          child: MaterialButton(
                            minWidth: 20,
                            elevation: 0,
                            onPressed: widget.prefixOnTap ?? () {},
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            shape: RoundedRectangleBorder(borderRadius: AppConsts.defaultRadius),
                            color: Co.white,
                            child: widget.prefix,
                          ),
                        ),
                suffix: widget.suffixWidget,
                suffixIcon:
                    widget.suffix == null && !widget.isPassword
                        ? null
                        : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: getSiffixIcon(value),
                        ),
                filled: isFilled,
                fillColor: widget.enabled? widget.bgColor : Colors.grey.shade200,
                focusedBorder: focusedBorder,
                errorBorder: errorBorder,
                focusedErrorBorder: focusedErrorBorder,
                enabledBorder: focusedBorder,
                disabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.borderRadius),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            );
          },
        );
  }

  Widget? getSiffixIcon(value) {
    if (widget.suffix != null) return widget.suffix;
    if (widget.isPassword) {
      return InkWell(
        onTap: () => isObscure.value = !value,
        canRequestFocus: false,
        child: Icon(value ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill, color: Co.lightGrey, size: 20),
      );
    }
    return null;
    // if (isValid == true) {
    //   return const Icon(
    //     CupertinoIcons.check_mark_circled,
    //     color: Co.primary,
    //   );
    // } else {
    //   return const Icon(
    //     CupertinoIcons.xmark_circle,
    //     color: Co.red,
    //   );
    // }
  }
}
