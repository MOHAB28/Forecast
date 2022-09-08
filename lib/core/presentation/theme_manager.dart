import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_manager.dart';
import 'fonts_manager.dart';
import 'styles_manager.dart';

ThemeData? lightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      systemOverlayStyle:
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      titleTextStyle: getBoldStyle(
        color: Colors.white,
        fontSize: FontSize.s22,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedLabelStyle: TextStyle(fontSize: 0.0),
      elevation: 0.0,
      unselectedLabelStyle: TextStyle(fontSize: 0.0),
    ),
    drawerTheme: const DrawerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      backgroundColor: ColorManager.lightDrawerBackground,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 28.0,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: getBoldStyle(
        color: Colors.white,
        fontSize: FontSize.s22,
      ),
      titleMedium: getBoldStyle(
        color: Colors.black,
        fontSize: FontSize.s20,
      ),


      titleSmall: getBoldStyle(
        color: Colors.white,
        fontSize: FontSize.s16,
      ),
      displayLarge: getBoldStyle(
        color: Colors.white,
        fontSize: FontSize.s65,
      ),
      displayMedium: getRegularStyle(
        color: Colors.white,
        fontSize: FontSize.s20,
      ),
      bodyLarge: getLightStyle(color: Colors.white,fontSize: FontSize.s22,),
      displaySmall: getRegularStyle(
        color: Colors.white,
        fontSize: FontSize.s18,
      ),
      bodyMedium: getMediumStyle(color: Colors.white, fontSize: FontSize.s16),
      bodySmall: getLightStyle(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey.withOpacity(0.1),
      filled: true,
      hintStyle: getLightStyle(
        color: Colors.grey,
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 22.0,horizontal: 10.0),
      suffixIconColor: Colors.white,
      prefixIconColor: Colors.white,
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: BorderSide.none),
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: BorderSide.none),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: BorderSide.none),
      disabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),borderSide: BorderSide.none),
    ),
  );
}

ThemeData? darkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.darkBackgroundScaffold,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      backgroundColor: ColorManager.darkBackgroundScaffold,
      elevation: 0.0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15.0),
          bottomRight: Radius.circular(15.0),
        ),
      ),
      backgroundColor: ColorManager.darkBackgroundScaffold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 28.0,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 25.0,
        fontWeight: FontWeight.w400,
      ),
      titleSmall: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 70.0,
        fontWeight: FontWeight.w100,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 11.0,
        vertical: 8,
      ),
      fillColor: ColorManager.textFieldFilledColor,
      filled: true,
      hintStyle: const TextStyle(
        fontSize: 16.0,
        color: ColorManager.hintTextFieldFilledColor,
      ),
      enabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
      disabledBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
    ),
  );
}
