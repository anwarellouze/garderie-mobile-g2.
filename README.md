# Ma Garderie

Ma Garderie est une application mobile Flutter qui présente les menus d'une
garderie. Elle propose un écran d'accueil, une liste de menus locale et des
interactions simples pour parcourir l'application.

## Fonctionnalités

- Écran de démarrage illustré avec transition automatique après 3 secondes.
- Page d'accueil avec les menus de la journée.
- Menu latéral : Accueil, Menus et À propos.
- Messages de confirmation pour la recherche, les notifications, l'ajout et la
  sélection d'un menu.
- Données statiques définies localement dans le code, sans backend ni base de
  données.

## Technologies

- Flutter et Dart
- Material 3
- `flutter_test` pour les tests de widgets

## Prérequis

- Flutter SDK (Dart 3.13.5 ou version compatible avec `pubspec.yaml`)
- Android Studio avec un émulateur Android, ou un appareil Android connecté

## Installation et exécution

Depuis le dossier du projet :

```bash
flutter pub get
flutter run
```

Pour choisir un appareil :

```bash
flutter devices
flutter run -d <device-id>
```

Lancer les tests et l'analyse statique :

```bash
flutter test
flutter analyze
```

## Captures d'écran

Les captures suivantes sont enregistrées dans [`screenshots/`](./screenshots/)
et montrent l'application sur un émulateur Android.

### Splash Screen

![Écran de démarrage](./screenshots/splash-screen.png)

### Page principale et menus

![Page principale avec la liste des menus](./screenshots/home-page.png)

### Drawer ouvert

![Menu de navigation ouvert](./screenshots/drawer.png)

### Message après une interaction

![Message de confirmation après sélection d'un menu](./screenshots/interaction.png)
