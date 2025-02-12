import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericScreen extends StatelessWidget {
  const GenericScreen({
    super.key,
    this.appBar,
    required this.children, this.crossAxisAlignment= CrossAxisAlignment.center, this.bottomSheet,
  });
  final PreferredSizeWidget? appBar;
  final List<Widget> children;
  final Widget? bottomSheet;
final  CrossAxisAlignment crossAxisAlignment ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 10.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        ),
      )),
      bottomSheet:bottomSheet ,
    );
  }
}
