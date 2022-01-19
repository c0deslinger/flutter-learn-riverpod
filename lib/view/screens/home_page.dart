import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn_riverpod/model/character.dart';
import 'package:flutter_learn_riverpod/utils/constants.dart';
import 'package:flutter_learn_riverpod/utils/provider.dart';
import 'package:flutter_learn_riverpod/view/widget/body_builder.dart';
import 'package:flutter_learn_riverpod/view/widget/character_card.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = useProvider(homeProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
      ),
      body: BodyBuilder(
        apiRequestStatus: viewModel.requestStatus,
        loadingWidget: const Center(child: CircularProgressIndicator()),
        reload: () => viewModel.getCharacters(),
        child: ListView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: viewModel.characters.length,
          itemBuilder: (BuildContext context, int index) {
            Character character =
                Character.fromJson(viewModel.characters[index]);
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              child: CharacterCard(character: character),
            );
          },
        ),
      ),
    );
  }
}
