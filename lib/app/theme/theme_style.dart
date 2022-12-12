import 'package:flutter/material.dart';
import 'package:marlo_task/app/constants/color_const.dart';

abstract class Themes {
  static ThemeData themeData(isDarkTheme, BuildContext context) {
    return ThemeData(
        iconTheme: IconThemeData(color: isDarkTheme.value ? white : dark),
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: isDarkTheme.value ? dark : scaffoldWhite),
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: isDarkTheme.value ? white : dark,
            ),
        scaffoldBackgroundColor: isDarkTheme.value ? dark : scaffoldWhite,
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(
            buttonColor: isDarkTheme.value ? Colors.grey : Colors.black),
        primaryColor: isDarkTheme.value ? white : dark,
        hintColor: isDarkTheme.value ? white : dark,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: skyBlue,
            unselectedItemColor: grey,
            backgroundColor: isDarkTheme.value ? lightGrey : scaffoldWhite),
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
                color: themeController.darkTheme.value ? white : dark),
            color: isDarkTheme.value ? dark : scaffoldWhite,
            elevation: 0));
  }
}
