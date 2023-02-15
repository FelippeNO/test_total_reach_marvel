import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/core/design/widgets/primary_loading_view.dart';

import '../../../core/design/ui/ui_scale.dart';
import '../../../core/design/widgets/primary_failure_view.dart';
import '../controllers/characters_view_controller.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  final CharactersViewController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.initialize();
  }

  @override
  Widget build(BuildContext context) {
    UIScale.init(context);
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: UIScale.topDevicePadding + UIScale.height(8),
            color: Colors.red,
          ),
          Expanded(
            child: ValueListenableBuilder<CharactersViewState>(
                valueListenable: controller.state,
                builder: (context, state, _) {
                  switch (state) {
                    case CharactersViewState.loading:
                      return const PrimaryLoadingView();
                    case CharactersViewState.success:
                      return CharactersViewSuccess(controller: controller);
                    case CharactersViewState.error:
                      return PrimaryFailureView(
                        message: 'Não foi possível carregar os personagens.',
                        onRetry: controller.initialize,
                      );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class CharactersViewSuccess extends StatelessWidget {
  const CharactersViewSuccess({
    super.key,
    required this.controller,
  });

  final CharactersViewController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: controller.characters.length,
      itemBuilder: (context, index) {
        final character = controller.characters[index];
        return ListTile(
          title: Text(character.name),
          subtitle: Text(character.description),
          leading: Image.network(character.thumbnailUrl),
        );
      },
    );
  }
}
