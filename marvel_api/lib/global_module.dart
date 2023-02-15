import 'package:flutter_modular/flutter_modular.dart';

import 'characters_module/characters_module.dart';

class GlobalModule extends Module {
  @override
  List<Module> imports = [
    CharactersModule(),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: CharactersModule()),
  ];
}
