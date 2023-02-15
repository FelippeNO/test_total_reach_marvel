import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_api/core/design/widgets/primary_loading_view.dart';

import '../../../core/design/ui/ui_scale.dart';
import '../../../core/design/widgets/primary_failure_view.dart';
import '../controllers/character_view_controller.dart';
import '../widgets/horizontal_carousel_session.dart';

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
            child: ValueListenableBuilder<CharacterViewState>(
                valueListenable: controller.state,
                builder: (context, state, _) {
                  switch (state) {
                    case CharacterViewState.loading:
                      return const PrimaryLoadingView();
                    case CharacterViewState.success:
                      return CharacterViewSuccess(controller: controller);
                    case CharacterViewState.error:
                      return PrimaryFailureView(
                        message: 'Não foi possível carregar o personagem.',
                        onRetry: () => controller.initialize(widget.characterId),
                      );
                  }
                }),
          ),
        ],
      ),
    );
  }
}

class CharacterViewSuccess extends StatefulWidget {
  const CharacterViewSuccess({Key? key, required this.controller}) : super(key: key);
  final CharacterViewController controller;

  @override
  State<CharacterViewSuccess> createState() => _CharacterViewSuccessState();
}

class _CharacterViewSuccessState extends State<CharacterViewSuccess> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: Colors.red,
            child: Image.network(
              height: UIScale.height(30),
              width: UIScale.height(100),
              widget.controller.character.snapshot.thumbnailUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(color: Colors.black)),
              child: Text(
                widget.controller.character.snapshot.name,
                style: TextStyle(fontSize: UIScale.width(5), fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(color: Colors.black)),
              child: Text(
                widget.controller.character.snapshot.description.isEmpty
                    ? 'Sem descrição do personagem'
                    : widget.controller.character.snapshot.description,
              ),
            ),
          ),
          HorizontalCarouselSession(
            sessionName: 'Comics',
            itens: widget.controller.character.comics,
          ),
          HorizontalCarouselSession(
            sessionName: 'Events',
            itens: widget.controller.character.events,
            backgroundColor: Colors.teal.withOpacity(0.38),
          ),
          HorizontalCarouselSession(
            sessionName: 'Series',
            itens: widget.controller.character.series,
            backgroundColor: Colors.yellow.withOpacity(0.38),
          ),
          HorizontalCarouselSession(
            sessionName: 'Stories',
            itens: widget.controller.character.stories,
            backgroundColor: Colors.lime.withOpacity(0.38),
          ),
        ],
      ),
    );
  }
}
