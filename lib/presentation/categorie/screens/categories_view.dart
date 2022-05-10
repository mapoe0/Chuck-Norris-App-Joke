import 'package:clean_architecture_2/domain/entities/categories.dart';
import 'package:clean_architecture_2/presentation/categorie/viewmodel/categories_state.dart';
import 'package:clean_architecture_2/presentation/categorie/viewmodel/categories_viewmodel.dart';
import 'package:clean_architecture_2/presentation/categorie/widgets/categories_section.dart';
import 'package:clean_architecture_2/presentation/categorie/widgets/category_grid.dart';
import 'package:clean_architecture_2/presentation/joke/screens/joke_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesView extends HookConsumerWidget {
  const CategoriesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelState = ref.watch(categoriesViewModelProvider);
    final categorieFuture = ref.watch(categoriesProvider);
    var toogle = useValueNotifier(List<Categories>);
    return Container(
      color: const Color.fromARGB(255, 8, 28, 66),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 8, 28, 66),
          title: Text(
            "Category",
            style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.w400),
          ),
          elevation: 0,
        ),
        body: Center(
            child: categorieFuture.when(
                data: (categories) => HookBuilder(builder: (context) {
                      return _buildBody(
                          context, ref, viewModelState, categories);
                    }),
                error: (error, _) => const Text("error"),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ))),
      ),
    );
  }

  Widget _buildBody(BuildContext context, WidgetRef ref, CategoriesState state,
      List<Categories> categories) {
    return CategoryGrid(
      categories: categories,
      onTap: (Categories cat) => openJoke(cat, context, state, ref),
    );
  }
/*
  Widget _buildBody(BuildContext context, WidgetRef ref, CategoriesState state,
      List<String> categories) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: ((context, index) {
          return Column(
            children: [
              CategoriesSection(
                  title: categories[index],
                  onTap: () => openJoke(categories[index], context, state)),
              SizedBox(
                height: 20,
              )
            ],
          );
        }));
  }*/

  openJoke(Categories categorie, BuildContext context, CategoriesState state,
      WidgetRef ref) {
    print('categories clicked ${categorie.title}');
    categorie.isClicked = true;
    ref.watch(categoriesViewModelProvider.notifier);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => JokeView(
                  categorie: categorie,
                )));
  }
}
