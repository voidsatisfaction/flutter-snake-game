import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter/material.dart';
import 'package:snake_game/screen/game_screen/main.dart';
import 'package:snake_game/db_model.dart';

const APP_VERSION = "1.0.0";
const DB_VERSION = 1;

Future<Database> initDatabase(String fileName) async {
  WidgetsFlutterBinding.ensureInitialized();

  String databasesPath = await getDatabasesPath();

  final Future<Database> database = openDatabase(
    join(databasesPath, fileName),
    version: DB_VERSION,
    onCreate: (db, version) {
      INIT_SCRIPTS.forEach((script) async => await db.execute(script));
    },
    onUpgrade: (db, oldVersion, newVersion) {
      MIGRATION_SCRIPTS.forEach((script) async => await db.execute(script));
    },
  );

  return database;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final database = await initDatabase('snake_database.db');

  runApp(SnakeGameApp());
}

class SnakeGameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreenWidget(),
    );
  }
}

class HomeScreenWidget extends StatefulWidget {
  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  int _selectedIndex = 0;
  final List<Widget> _screenList = [
    MyHomePage(),
    Text('Score'),
    Text('Board'),
  ];

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snake game'),
      ),
      body: Center(
        child: _screenList[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: 'Game',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Score',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Board',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onNavBarTapped,
      ),
    );
  }
}
