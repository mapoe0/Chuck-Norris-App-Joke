import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
            color: const Color(0x00695f85).withOpacity(0.7),
            borderRadius: const BorderRadius.all(Radius.circular(10.0))),
        child: Text(text,
            style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w500)),
      ),
    );
  }
}
