import 'package:akgsetu/common/utils/Styles.dart';
import 'package:akgsetu/common/utils/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class getTextFormField extends StatelessWidget {

  getTextFormField({Key? key,
    this.controller,
    this.ontap,
    this.labelText,
    required this.validator,
    this.enableInteractiveSelection,
    this.hintText,
    this.callback,
    this.length,
    this.prefixIcon,
    required this.isObscureText,
    this.passwordButton,
    this.inputType,
    this.enabled,
    this.inputFormatters,
    this.autovalidateMode,
    required this.onChanged,
    this.readMode,
    this.focusNode})
      : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final int? length;
  final String? Function(String?)? validator;
  final VoidCallback? callback;
   bool isObscureText;
  final String? hintText;
  final Widget? passwordButton;
  final Widget? prefixIcon;

  final TextInputType? inputType;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? ontap;
  final FocusNode? focusNode;
  bool? enabled = true;
  bool? enableInteractiveSelection = true;
  bool? readMode = false;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      controller: controller,
      enableInteractiveSelection: enableInteractiveSelection,
      maxLength: length,
      onTap: ontap,
      validator: validator,
      obscureText: isObscureText,
      enabled: enabled,
      focusNode: focusNode,
      style: Styles.midContrassText(value: 16.0),
      cursorColor: Colors.grey,
      keyboardType: inputType,
      readOnly: readMode ?? false,
      decoration: InputDecoration(
        filled: true,
        prefixIcon:prefixIcon,
        fillColor: Colors.white,
        suffixIcon: passwordButton,
        labelText: labelText,
        labelStyle: Styles.TextBoxLableStyle(16.0),
        //  floatingLabelStyle: Styles.TextBoxFlotingLableStyle(16.0),
        contentPadding: EdgeInsets.symmetric(
            vertical: 16.sp,
            horizontal: 16.sp),
        hintText: hintText,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: AppColors.gray70)),
        errorBorder: UnderlineInputBorder(
          //  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: AppColors.red)),
        hintStyle: Styles.TextBoxHintStyle(14.0),
        focusedBorder: UnderlineInputBorder(
          // borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: AppColors.gray70),
        ),
        enabledBorder: UnderlineInputBorder(
          //borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: AppColors.gray70),
        ),
      ),
    );
  }
}

class getenabledTextFormField extends StatelessWidget {

  getenabledTextFormField({Key? key,
    this.controller,
    this.ontap,
    this.labelText,
    required this.validator,
    this.enableInteractiveSelection,
    this.hintText,
    this.callback,
    this.length,
    required this.isObscureText,
    this.passwordButton,
    this.inputType,
    this.enabled,
    this.inputFormatters,
    this.autovalidateMode,
    this.onChanged,
    this.readMode,
    this.focusNode})
      : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final int? length;
  final String? Function(String?)? validator;
  final VoidCallback? callback;
  final bool isObscureText;
  final String? hintText;
  final Widget? passwordButton;
  final TextInputType? inputType;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? ontap;
  final FocusNode? focusNode;
  bool? enabled = true;
  bool? enableInteractiveSelection = true;
  bool? readMode = false;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      controller: controller,
      enableInteractiveSelection: enableInteractiveSelection,
      maxLength: length,
      onTap: ontap,
      validator: validator,
      obscureText: isObscureText,
      enabled: enabled,
      focusNode: focusNode,
      style: Styles.midContrassText(value: 16.0),
      cursorColor: Colors.grey,
      keyboardType: inputType,
      readOnly: readMode ?? false,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: passwordButton,
          labelText: labelText,
          labelStyle: Styles.TextBoxLableStyle(16.0),
          // floatingLabelStyle: Styles.TextBoxFlotingLableStyle(16.0),
          contentPadding: EdgeInsets.symmetric(
              vertical: 16.sp,
              horizontal: 16.sp),
          hintText: hintText,
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.gray70)),
          errorBorder: UnderlineInputBorder(
            //  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: AppColors.red)),
          hintStyle: Styles.TextBoxHintStyle(14.0),
          focusedBorder: UnderlineInputBorder(
            // borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: AppColors.gray70),
          ),
          disabledBorder: UnderlineInputBorder(
            //borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color: AppColors.gray70),
          ),
          enabledBorder: UnderlineInputBorder(
          //borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: AppColors.gray70),
    ),)
    ,
    );
  }
}

class getTransparentTextFormField extends StatelessWidget {

  getTransparentTextFormField({Key? key,
    this.controller,
    this.ontap,
    this.labelText,
    required this.validator,
    this.enableInteractiveSelection,
    this.hintText,
    this.callback,
    this.length,
    required this.isObscureText,
    this.passwordButton,
    this.inputType,
    this.enabled,
    this.inputFormatters,
    this.autovalidateMode,
    required this.onChanged,
    this.minlines,
    this.maxlines,
    this.readMode,
    this.focusNode})
      : super(key: key);

  final TextEditingController? controller;
  final String? labelText;
  final int? length;
  final int? minlines;
  final int? maxlines;

  final String? Function(String?)? validator;
  final VoidCallback? callback;
  final bool isObscureText;
  final String? hintText;
  final Widget? passwordButton;
  final TextInputType? inputType;
  final AutovalidateMode? autovalidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final VoidCallback? ontap;
  final FocusNode? focusNode;

  bool? enabled = true;
  bool? enableInteractiveSelection = true;
  bool? readMode = false;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidateMode,
      inputFormatters: inputFormatters,
      controller: controller,
      enableInteractiveSelection: enableInteractiveSelection,
      maxLength: length,
      onTap: ontap,
      validator: validator,
      obscureText: isObscureText,
      enabled: enabled,
      focusNode: focusNode,
      style: Styles.midContrassText(value: 14.0),
      cursorColor: Colors.grey,
      keyboardType: inputType,
      minLines: minlines,
      maxLines: maxlines,
      readOnly: readMode ?? false,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        suffixIcon: passwordButton,
        labelText: labelText,
        labelStyle: Styles.TextBoxLableStyle(16.0),
        //  floatingLabelStyle: Styles.TextBoxFlotingLableStyle(16.0),
       /* contentPadding: EdgeInsets.symmetric(
            vertical: 16.sp,
            horizontal: 16.sp),*/
        hintText: hintText,
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
        errorBorder: UnderlineInputBorder(
          //  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
            borderSide: BorderSide(color:Colors.transparent)),
        hintStyle:  TextStyle(
            color: AppColors.grayB5,
            fontStyle: FontStyle.normal,
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400),
        focusedBorder: UnderlineInputBorder(
          // borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: UnderlineInputBorder(
          //borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
