import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const _corFundo = Colors.black87;//Color(0xFF1A237E); // indigo900

final vThemeApp = ThemeData(
  brightness: Brightness.dark,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.blue,
  //fontFamily: GoogleFonts.firaCode(fontSize: 12).fontFamily,
  fontFamily: GoogleFonts.baiJamjuree(fontSize: 12).fontFamily,
  //fontFamily: GoogleFonts.kalam(fontSize: 12).fontFamily,

  primaryColor: Colors.black,
  primaryColorLight: Colors.black38,
  canvasColor: _corFundo,//Colors.black,

  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.primary,   
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: _corFundo, 
  ),
  
);