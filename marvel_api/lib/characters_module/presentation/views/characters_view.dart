import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/characters_module/domain/entities/character_snapshot_entity.dart';
import 'package:marvel_api/core/design/widgets/primary_loading_view.dart';
import 'package:marvel_api/core/navigation/core_navigator.dart';

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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          onRetry: () => controller.initialize(),
                        );
                    }
                  }),
            ),
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
        return CharacterSnapshotCard(
          characterSnapshot: character,
        );
      },
    );
  }
}

class CharacterSnapshotCard extends StatefulWidget {
  const CharacterSnapshotCard({Key? key, required this.characterSnapshot}) : super(key: key);
  final CharacterSnapshotEntity characterSnapshot;

  @override
  State<CharacterSnapshotCard> createState() => _CharacterSnapshotCardState();
}

class _CharacterSnapshotCardState extends State<CharacterSnapshotCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () => CoreNavigator.characters.goToCharacterView(widget.characterSnapshot.id),
        child: Container(
          height: UIScale.height(22),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: UIScale.width(22),
                height: UIScale.height(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(widget.characterSnapshot.thumbnailUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.characterSnapshot.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.characterSnapshot.description,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
