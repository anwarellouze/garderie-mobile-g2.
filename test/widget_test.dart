import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ma_garderie/main.dart';

void main() {
  Future<void> openHomePage(WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();
  }

  testWidgets('splash screen opens the home page after three seconds', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Bienvenue dans notre garderie'), findsOneWidget);

    await tester.pump(const Duration(seconds: 3));
    await tester.pumpAndSettle();

    expect(find.text('Menus du jour'), findsOneWidget);
  });

  testWidgets('home page displays all local menus', (tester) async {
    await openHomePage(tester);

    expect(find.text('Petit déjeuner'), findsOneWidget);
    expect(find.text('Lait, céréales et fruits'), findsOneWidget);
    expect(find.text('🥣'), findsOneWidget);
    expect(find.text('Déjeuner'), findsOneWidget);
    expect(find.text('Poulet, riz et légumes'), findsOneWidget);
    expect(find.text('🍲'), findsOneWidget);
    expect(find.text('Goûter'), findsOneWidget);
    expect(find.text('Biscuit et compote de pomme'), findsOneWidget);
    expect(find.text('🍪'), findsOneWidget);
    expect(find.text('Jus de fruits'), findsOneWidget);
    expect(find.text("Jus d'orange naturel"), findsOneWidget);
    expect(find.text('🍊'), findsOneWidget);
    expect(find.text('Fruits frais'), findsOneWidget);
    expect(find.text('Une sélection de fruits de saison'), findsOneWidget);
    expect(find.text('🍎'), findsOneWidget);
  });

  testWidgets('toolbar, menu and drawer interactions display feedback', (
    tester,
  ) async {
    await openHomePage(tester);

    await tester.tap(find.byTooltip('Recherche'));
    await tester.pumpAndSettle();
    expect(find.text('Rechercher un menu'), findsOneWidget);

    await tester.tap(find.byTooltip('Notifications'));
    await tester.pumpAndSettle();
    expect(find.text('Aucune notification'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('Ajouter un menu'), findsOneWidget);

    await tester.tap(find.text('Petit déjeuner'));
    await tester.pumpAndSettle();
    expect(find.text('Petit déjeuner'), findsNWidgets(2));

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Menus'));
    await tester.pumpAndSettle();
    expect(find.text('Menus'), findsOneWidget);

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('À propos'));
    await tester.pumpAndSettle();
    expect(
      find.text(
        'Ma Garderie\nApplication de gestion des menus de la garderie.',
      ),
      findsOneWidget,
    );
    await tester.tap(find.text('Fermer'));
    await tester.pumpAndSettle();
  });
}
