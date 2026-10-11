import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glow_on/app/shell/main_shell.dart';

void main() {
  testWidgets('MainShell navega entre as abas', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: MainShell()));

    expect(find.text('Nenhum agendamento'), findsOneWidget);

    await tester.tap(find.text('Clientes'));
    await tester.pumpAndSettle();

    expect(find.text('Nenhuma cliente cadastrada'), findsOneWidget);
  });
}
