import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordReq extends StatelessWidget {
  const PasswordReq({
    super.key,
    required this.containsUpperCase,
    required this.containsLowerCase,
    required this.containsNumber,
    required this.containsSpecialChar,
    required this.contains8Length,
  });

  final bool containsUpperCase;
  final bool containsLowerCase;
  final bool containsNumber;
  final bool containsSpecialChar;
  final bool contains8Length;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon(
          //   Icons.lock,
          //   color: Theme.of(context).colorScheme.onBackground,
          // ),
          SizedBox(width: 1.w),
          Text(
            'password requirements',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      // leading: Icon(Icons.arrow_drop_down),
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "⚈  1 uppercase",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: containsUpperCase
                          ? Colors.green
                          : Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "⚈  1 lowercase",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: containsLowerCase
                          ? Colors.green
                          : Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "⚈  1 number",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: containsNumber
                          ? Colors.green
                          : Theme.of(context).colorScheme.onBackground),
                ),
                SizedBox(height: 10.h),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "⚈  1 special character",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: containsSpecialChar
                          ? Colors.green
                          : Theme.of(context).colorScheme.onBackground),
                ),
                Text(
                  "⚈  8 minimum character",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: contains8Length
                          ? Colors.green
                          : Theme.of(context).colorScheme.onBackground),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
