import 'package:flutter/material.dart';


Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  ValueChanged<String>? onChanged,
  VoidCallback? onTap,
  Function? suffixPressed,
  AutovalidateMode? autoValidate,
  required Function validate,
  required String? label,
  required String? hint,
  required IconData? prefix,
  IconData? suffix,
  bool isPassword = false,
  bool isClickable = true,
  bool isHidden = true,
}) =>
    TextFormField(
      autovalidateMode: autoValidate,
      obscureText: isPassword,
      controller: controller,
      onChanged: onChanged,
      // onTap: onTap,
      onFieldSubmitted: (s) {
        onSubmit;
      },
      keyboardType: type,
      validator: (s) {
        return validate(s);
      },
      enabled: isClickable,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () => suffixPressed!(),
              )
            : null,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          fontFamily: 'SF regular',
          color: Colors.grey[400],
        ),
        labelText: label,
        labelStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          fontFamily: 'SF regular',
        ),
        border: const OutlineInputBorder(),
      ),
    );

Widget presetFormField() => TextFormField(
      decoration: const InputDecoration(
        // border: InputBorder.none,
        hintText: 'Enter your email address',
        hintStyle: TextStyle(
          fontSize: 17.0,
          fontFamily: 'SF regular',
        ),
        prefixIcon: Icon(Icons.email_outlined),
      ),
    );

Widget defaultButton({
  Color? backgroundColor = Colors.deepPurple,
  double? width = 360,
  bool isUpperCase = true,
  double radius = 6.0,
  required String text,
  required Function function,
}) =>
    Container(
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(
            radius,
          )),
      width: width,
      height: 53,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            fontFamily: 'SF regular',
          ),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

Widget buildMyDivider() => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        color: Colors.grey[300],
        height: 1.0,
      ),
    );

// void showToast({
//   required String message,
//   required ToastStates state,
// }) =>
//     Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: chooseToastColor(state),
//       textColor: Colors.white,
//       fontSize: 16.0,
//     );

enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
