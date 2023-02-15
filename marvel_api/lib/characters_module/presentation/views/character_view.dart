import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/core/design/widgets/primary_loading_view.dart';

import '../../../core/design/ui/ui_scale.dart';
import '../../../core/design/widgets/primary_failure_view.dart';
import '../controllers/character_view_controller.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({Key? key, required this.characterId}) : super(key: key);
  final int characterId;

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  final CharacterViewController controller = Modular.get();

  @override
  void initState() {
    super.initState();
    controller.initialize(widget.characterId);
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
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0, left: 16.0),
              child: GestureDetector(
                onTap: () => Modular.to.pop(),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: UIScale.width(7),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ValueListenableBuilder<CharacterViewState>(
                  valueListenable: controller.state,
                  builder: (context, state, _) {
                    switch (state) {
                      case CharacterViewState.loading:
                        return const PrimaryLoadingView();
                      case CharacterViewState.success:
                        return const CharacterViewSuccess();
                      case CharacterViewState.error:
                        return PrimaryFailureView(
                          message: 'Não foi possível carregar o personagem.',
                          onRetry: () => controller.initialize(widget.characterId),
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

class CharacterViewSuccess extends StatefulWidget {
  const CharacterViewSuccess({Key? key}) : super(key: key);

  @override
  State<CharacterViewSuccess> createState() => _CharacterViewSuccessState();
}

class _CharacterViewSuccessState extends State<CharacterViewSuccess> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
