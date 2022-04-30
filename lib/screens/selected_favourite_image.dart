import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:theluxuryshoplaravelbackend/app_theme.dart';
import 'package:url_launcher/url_launcher.dart';

class FavouriteMaterialScreen extends StatefulWidget {
  final String imageUrl;
  final String materialname;

  const FavouriteMaterialScreen({
    required this.imageUrl,
    required this.materialname,
  });

  @override
  _FavouriteMaterialScreenState createState() =>
      _FavouriteMaterialScreenState();
}

class _FavouriteMaterialScreenState extends State<FavouriteMaterialScreen>
    with TickerProviderStateMixin {
  final double infoHeight = 364.0;
  late AnimationController animationController;
  late Animation<double> animation;

  double opacity1 = 0.0;
  double opacity2 = 0.0;
  double opacity3 = 0.0;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: const Interval(0, 1.0, curve: Curves.fastOutSlowIn)));
    setData();
    super.initState();
  }

  Future<void> setData() async {
    animationController.forward();
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity1 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity2 = 1.0;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    setState(() {
      opacity3 = 1.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.nearlyWhite,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text("The Luxury Shop"),
          titleTextStyle: const TextStyle(
            letterSpacing: 2.0,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          centerTitle: true,
          backgroundColor: Colors.yellow[9000],
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Column(
              children: [
                AspectRatio(
                  aspectRatio: 0.6,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    imageUrl: widget.imageUrl,
                  ),
                ),
              ],
            ),
            Positioned(
              top: (MediaQuery.of(context).size.width / 0.7),
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.nearlyWhite,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(52.0),
                      topRight: Radius.circular(52.0)),
                  boxShadow: [
                    BoxShadow(
                        color: AppTheme.grey.withOpacity(0.9),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 90.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0, left: 18, right: 16),
                              child: Text(
                                widget.materialname,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                  letterSpacing: 2.0,
                                  color: AppTheme.darkerText,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, left: 18, right: 16),
                              child: Text(
                                widget.materialname,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  letterSpacing: 1.2,
                                  color: AppTheme.darkerText,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Center(
                              child: AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: opacity1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const <Widget>[
                                      Icon(
                                        Icons.check_box,
                                        color: Colors.green,
                                        size: 25,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "In Stock",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          letterSpacing: 0.27,
                                          color: AppTheme.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 500),
                          opacity: opacity3,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 16, bottom: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppTheme.yellow,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(16.0),
                                      ),
                                      border: Border.all(
                                          color: AppTheme.yellow
                                              .withOpacity(0.9)),
                                    ),
                                    child: const Icon(
                                      Icons.favorite,
                                      color: AppTheme.nearlyWhite,
                                      size: 28,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      //TODO
                                      await launch(
                                          "https://wa.me/243810000274}?text=Hello, I would Link to inquire about ${widget.materialname} ");
                                    },
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppTheme.yellow,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(16.0),
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color: AppTheme.yellow
                                                  .withOpacity(0.9),
                                              offset: const Offset(1.1, 1.1),
                                              blurRadius: 16.0),
                                        ],
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'Inquire on whatsapp now',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18,
                                            letterSpacing: 0.0,
                                            color: AppTheme
                                                .nearlyWhite,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Materials {
  final int? id;
  final String name;
  final String imageUrl;

  Materials({this.id, required this.name, required this.imageUrl});

  factory Materials.fromMap(Map<String, dynamic> json) => Materials(
        id: json['id'],
        name: json['name'],
        imageUrl: json['imageUrl'],
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
    };
  }
}

class DatabaseHelper {
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'favourites.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE materials(
          id INTEGER PRIMARY KEY,
          name TEXT,
          imageUrl TEXT
      )
      ''');
  }

  Future<List<Materials>> getGroceries() async {
    Database db = await instance.database;
    var groceries = await db.query('materials', orderBy: 'name');
    List<Materials> groceryList = groceries.isNotEmpty
        ? groceries.map((c) => Materials.fromMap(c)).toList()
        : [];
    return groceryList;
  }

  Future<int> add(Materials grocery) async {
    Database db = await instance.database;
    return await db.insert('materials', grocery.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('materials', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Materials grocery) async {
    Database db = await instance.database;
    return await db.update('materials', grocery.toMap(),
        where: "id = ?", whereArgs: [grocery.id]);
  }
}
