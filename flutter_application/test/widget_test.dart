import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application/main.dart';

void main() {
  group('Menu principal', () {
    testWidgets('Deve exibir as opções principais', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(const BrickBreakerApp());

      expect(find.text('BRICK\nBREAKER'), findsOneWidget);

      expect(find.text('Iniciar'), findsOneWidget);

      expect(find.text('Configurações'), findsOneWidget);

      expect(find.text('Desenvolvedores'), findsOneWidget);

      expect(find.text('Sair'), findsOneWidget);
    });

    testWidgets('Deve abrir configurações', (WidgetTester tester) async {
      await tester.pumpWidget(const BrickBreakerApp());

      await tester.tap(find.text('Configurações'));

      await tester.pumpAndSettle();

      expect(find.text('Cor dos tijolos'), findsOneWidget);

      expect(find.text('Tamanho dos tijolos'), findsOneWidget);
    });

    testWidgets('Deve abrir desenvolvedores', (WidgetTester tester) async {
      await tester.pumpWidget(const BrickBreakerApp());

      await tester.tap(find.text('Desenvolvedores'));

      await tester.pumpAndSettle();

      expect(find.text('Desenvolvedores'), findsOneWidget);
    });
  });
}
