import 'package:flutter/cupertino.dart';

import '../../../core/utils/my_controller.dart';
import '../../domain/entities/character_entity.dart';
import '../../domain/services/get_character_by_id_service.dart';

enum CharacterViewState { loading, success, error }

class CharacterViewController extends MyController {
  final GetCharacterByIdService _getCharacterByIdService;

  CharacterViewController(
    this._getCharacterByIdService,
  );

  final ValueNotifier<CharacterViewState> _state = ValueNotifier(CharacterViewState.loading);
  late CharacterEntity _character;

  ValueNotifier<CharacterViewState> get state => _state;
  CharacterEntity get character => _character;

  Future<void> initialize(int characterId) async => _getCharacter(characterId);

  _getCharacter(int characterId) async {
    setValueNotifier(_state, CharacterViewState.loading);
    final request = await _getCharacterByIdService.call(characterId);
    request.fold((l) => setValueNotifier(_state, CharacterViewState.error), (r) => _handlingCharacter(r));
  }

  void _handlingCharacter(r) {
    _character = r;
    setValueNotifier(_state, CharacterViewState.success);
  }
}
