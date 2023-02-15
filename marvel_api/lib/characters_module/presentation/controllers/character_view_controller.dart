import 'package:flutter/cupertino.dart';

import '../../domain/entities/character_entity.dart';
import '../../domain/services/get_character_by_id_service.dart';

enum CharacterViewState { loading, success, error }

class CharacterViewController extends ChangeNotifier {
  final GetCharacterByIdService _getCharacterByIdService;

  CharacterViewController(
    this._getCharacterByIdService,
  );

  final ValueNotifier<CharacterViewState> _state = ValueNotifier(CharacterViewState.loading);
  late CharacterEntity _character;

  ValueNotifier<CharacterViewState> get state => _state;
  CharacterEntity get character => _character;

  Future<void> initialize(int characterId) async {
    _state.value = CharacterViewState.loading;
    _getCharacter(characterId);
    await Future.delayed(const Duration(seconds: 2));
    _state.value = CharacterViewState.success;
  }

  _getCharacter(int characterId) async {
    _state.value = CharacterViewState.loading;
    _state.notifyListeners();
    final request = await _getCharacterByIdService.call(characterId);
    request.fold((l) {
      _state.value = CharacterViewState.error;
      _state.notifyListeners();
    }, (r) {
      _character = r;
      _state.value = CharacterViewState.success;
      _state.notifyListeners();
    });
  }
}
