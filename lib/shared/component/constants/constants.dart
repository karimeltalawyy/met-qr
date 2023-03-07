import 'package:flutter/material.dart';

String? uId = '';

const defaultColor = Color(0xFFEE946A);
const surfaceColor = Color(0xFFF5F1EE);
const greyColor = Color(0xFFF6F6F6);
const secondaryColor = Color(0xFF8BAD76);
const whiteColor = Colors.white;
const chipOneColor = Color(0xFFDFE9F5);
const chipOneTextColor = Color(0xFF0077FF);
const chipTwoColor = Color(0xFFFFEED4);
const chipTwoTextColor = Color(0xFFC49047);
const cardAttendColor = Color(0xFF111624);
const surfaceColorOpacity = Color(0xFFFFEED4);
const toastColor = Color(0xFFFFEED4);
final imgContainerColor = const Color(0xFFEE946A).withOpacity(.4);

final InputDecoration defaultDropDownInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderRadius:
    BorderRadius.circular(12),
  ),
);
String networkImage =
    'https://img.freepik.com/free-vector/cute-astronaut-super-flying-cartoon-illustration_138676-3259.jpg?w=826&t=st=1678193909~exp=1678194509~hmac=690e24648a11d3da35ff5dc933dd462a5ff9be032479f27fcff3dbeb15581119';
const double basePadding = 20;
const double baseMargin = 20;
// Column
// (
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Text('Academic Division',
// style: textTheme.labelLarge),
// Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 8),
// child: SizedBox(
// width: MediaQuery.of(context)
//     .size
//     .width *
// .3,
// child:
// DropdownButtonFormField<String>(
// decoration: InputDecoration(
// border:
// ),
// value: selectedItem,
// items: itemsList.map(
// (item) {
// return DropdownMenuItem(
// value: item,
// child: Text(item),
// );
// },
// ).toList(),
// onChanged: (item) {
// setState(
// () {
// selectedItem = item;
// },
// );
// },
// ),
// ),
// ),
// ],
// ),