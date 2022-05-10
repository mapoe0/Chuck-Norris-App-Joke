import 'package:clean_architecture_2/domain/entities/categories.dart';
import 'package:clean_architecture_2/presentation/common/capitilize.dart';
import 'package:clean_architecture_2/presentation/joke/viewmodel/joke_state.dart';
import 'package:clean_architecture_2/presentation/joke/viewmodel/joke_viewmodel.dart';
import 'package:clean_architecture_2/presentation/joke/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/joke.dart';

class JokeView extends HookConsumerWidget {
  JokeView({Key? key, required this.categorie}) : super(key: key);
  Categories categorie;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModelState = ref.watch(jokeViewModelProvider);
    final jokeFuture = ref.watch(jokeProvider(categorie.title));
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 8, 28, 66),
      ),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 8, 28, 66),
            title: Text(
              capitalize(categorie.title),
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w400),
            ),
            elevation: 0,
          ),
          backgroundColor: Colors.transparent,
          body: jokeFuture.when(
              data: (joke) => _buildBody(ref, viewModelState, joke),
              error: (error, _) => Text("Erreur"),
              loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ))),
    );
  }

  Widget _buildBody(WidgetRef ref, JokeState state, Joke joke) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            joke.text,
            style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          CustomButton(
              text: "Nouvelle Blague",
              onTap: () {
                ref.refresh(jokeProvider(categorie.title));
                ref.read(jokeViewModelProvider.notifier).reset();
              })
        ],
      ),
    ));
  }
}
