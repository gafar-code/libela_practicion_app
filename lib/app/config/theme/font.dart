import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:libela_practition/app/config/theme/colors.dart';

import '../../core/utils/screen_size.dart';

// class AppFonts {
//   final BuildContext _context;
//   AppFonts(this._context);
//   TextStyle get f8 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 8), color: Colors.black);
//   TextStyle get f10 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 10), color: Colors.black);
//   TextStyle get f12 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 12), color: Colors.black);
//   TextStyle get f14 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 14), color: Colors.black);
//   TextStyle get f16 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 16), color: Colors.black);
//   TextStyle get f18 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 18), color: Colors.black);
//   TextStyle get f20 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 20), color: Colors.black);
//   TextStyle get f22 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 22), color: Colors.black);
//   TextStyle get f24 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 24), color: Colors.black);
//   TextStyle get f26 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 26), color: Colors.black);
//   TextStyle get f28 => GoogleFonts.inter(
//       fontSize: getResponsiveFontSize(_context, 28), color: Colors.black);
// }

class AppFonts {
  // final BuildContext _context;
  // AppFonts(this._context);
  TextStyle get f8 => GoogleFonts.inter(fontSize: 7.wr, color: Colors.black);
  TextStyle get f10 => GoogleFonts.inter(fontSize: 9.wr, color: Colors.black);
  TextStyle get f12 => GoogleFonts.inter(fontSize: 11.wr, color: Colors.black);
  TextStyle get f14 => GoogleFonts.inter(fontSize: 13.wr, color: Colors.black);
  TextStyle get f16 => GoogleFonts.inter(fontSize: 15.wr, color: Colors.black);
  TextStyle get f18 => GoogleFonts.inter(fontSize: 17.wr, color: Colors.black);
  TextStyle get f20 => GoogleFonts.inter(fontSize: 19.wr, color: Colors.black);
  TextStyle get f22 => GoogleFonts.inter(fontSize: 21.wr, color: Colors.black);
  TextStyle get f24 => GoogleFonts.inter(fontSize: 23.wr, color: Colors.black);
  TextStyle get f26 => GoogleFonts.inter(fontSize: 25.wr, color: Colors.black);
  TextStyle get f28 => GoogleFonts.inter(fontSize: 27.wr, color: Colors.black);
}

extension FontStyleExtensions on TextStyle {
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get semibold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get white => copyWith(color: Colors.white);
  TextStyle get black => copyWith(color: Colors.black);

  TextStyle get primary => copyWith(color: kPrimaryColor);
  TextStyle get secondary => copyWith(color: kSoftGrey);

  TextStyle get red => copyWith(color: Colors.red);
  TextStyle get green => copyWith(color: Colors.green);
  TextStyle get blue => copyWith(color: Colors.blue);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
}
