import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PFAppTypography {
  static TextStyle get regular =>
      GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w400);

  static TextStyle get small =>
      GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle get bold =>
      GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w700);

  static TextStyle get semiBold =>
      GoogleFonts.inter(fontSize: 17, fontWeight: FontWeight.w600);
}
