import 'package:flutter/material.dart';

import '../shell/main_shell.dart';

abstract final class AppRoutes {
  static const home = '/';
}

abstract final class AppRouter {
  static const initialRoute = AppRoutes.home;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const MainShell(),
        );
      default:
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (_) => const Scaffold(
            body: Center(child: Text('Rota não encontrada')),
          ),
        );
    }
  }
}
