import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle appTitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.060,
      fontWeight: FontWeight.bold,
    );
TextStyle appSubtitleStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.030,
    );
TextStyle appTermsAndPrivacyStyle(Size size) =>
    GoogleFonts.ubuntu(fontSize: 15, color: Colors.grey, height: 1.5);
TextStyle haveAccountStyle(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      color: Colors.grey,
      height: 1.5,
    );
TextStyle apploginOrSignUp(Size size) => GoogleFonts.ubuntu(
      fontSize: size.height * 0.022,
      fontWeight: FontWeight.w500,
      color: Colors.deepPurpleAccent,
    );
TextStyle appTextFormFieldStyle() => const TextStyle(color: Colors.black);
