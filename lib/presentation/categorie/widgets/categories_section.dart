import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:clean_architecture_2/domain/entities/categories.dart';
import 'package:clean_architecture_2/presentation/categorie/viewmodel/categories_viewmodel.dart';

import '../../common/capitilize.dart';
import '../viewmodel/categories_state.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({
    Key? key,
    required this.categories,
    required this.onTap,
  }) : super(key: key);

  final Categories categories;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.all(18.0),
      child: Consumer(
        builder: (context, ref, _) {
          return GestureDetector(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0x00695f85).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: categories.isClicked
                          ? Colors.yellow
                          : Colors.transparent)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(capitalize(categories.title),
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            onTap: onTap,
          );
        },
      ),
    );
  }
}
