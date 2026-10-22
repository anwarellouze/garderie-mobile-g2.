import 'package:flutter/material.dart';

import '../data/data_menus.dart';

/// Page principale : AppBar, Drawer, Floating Action Button et liste des menus,
/// avec les interactions (Snackbar, sélection dans le Drawer).
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _showMessage(String message) {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  void _onDrawerItemSelected(int index) {
    setState(() => _selectedIndex = index);
    Navigator.of(context).pop(); // ferme le Drawer

    switch (index) {
      case 0:
        _showMessage('Accueil');
        break;
      case 1:
        _showMessage('Menus');
        break;
      case 2:
        showDialog<void>(
          context: context,
          builder: (dialogContext) => AlertDialog(
            title: const Text('À propos'),
            content: const Text(
              'Ma Garderie\nApplication de gestion des menus de la garderie.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(dialogContext).pop(),
                child: const Text('Fermer'),
              ),
            ],
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ma Garderie'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            tooltip: 'Recherche',
            onPressed: () => _showMessage('Rechercher un menu'),
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            tooltip: 'Notifications',
            onPressed: () => _showMessage('Aucune notification'),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Ma Garderie',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Accueil'),
              selected: _selectedIndex == 0,
              onTap: () => _onDrawerItemSelected(0),
            ),
            ListTile(
              leading: const Icon(Icons.restaurant_menu),
              title: const Text('Menus'),
              selected: _selectedIndex == 1,
              onTap: () => _onDrawerItemSelected(1),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('À propos'),
              selected: _selectedIndex == 2,
              onTap: () => _onDrawerItemSelected(2),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMessage('Ajouter un menu'),
        child: const Icon(Icons.add),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Menus du jour',
              style: Theme.of(context).textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 88),
              itemCount: menusData.length,
              itemBuilder: (context, index) {
                final menu = menusData[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: Text(
                      menu['icone'] as String,
                      style: const TextStyle(fontSize: 32),
                    ),
                    title: Text(
                      menu['titre'] as String,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(menu['description'] as String),
                    onTap: () => _showMessage(menu['titre'] as String),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
