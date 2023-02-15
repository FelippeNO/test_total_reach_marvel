import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CharactersModule extends Module {
  @override
  final List<Bind> binds = [
    /// ------------------------------ Clients --------------------------------

    /// ------------------------------ Gateways --------------------------------

    /// ---------------------------- Repositories ------------------------------

    /// ------------------------------ Services --------------------------------

    /// ------------------------------ Internationalization --------------------

    /// ------------------------------- State ---------------------------------
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => Container()),
  ];
}
