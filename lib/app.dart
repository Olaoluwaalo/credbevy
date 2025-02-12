import 'package:credbevy/Router/c_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CApp extends StatelessWidget {
  const CApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return  MaterialApp.router(
            debugShowCheckedModeBanner: false,
           routerConfig: CRoute.router,
           );
      },
    );

  }
}