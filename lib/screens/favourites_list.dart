import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:theluxuryshoplaravelbackend/app_theme.dart';
import 'package:theluxuryshoplaravelbackend/screens/selected_favourite_image.dart';


class FavouriteList extends StatefulWidget {
  const FavouriteList({Key? key}) : super(key: key);

  @override
  _FavouriteListState createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  int? selectedId;
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<Materials>>(
            future: DatabaseHelper.instance.getGroceries(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Materials>> snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('Fetching ...'));
              }
              return snapshot.data!.isEmpty
                  ? const Center(child: Text('No Favourites Found .'))
                  : ListView(
                      children: snapshot.data!.map((grocery) {
                        return Center(
                            child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FavouriteMaterialScreen(
                                    imageUrl: grocery.imageUrl,
                                    materialname: grocery.name,
                                  ),
                                ));
                          },
                          onLongPress: () {
                            setState(() {
                              var xyz = grocery.id;
                              if (xyz != null) {
                                DatabaseHelper.instance.remove(xyz);
                              }
                              //DatabaseHelper.instance.remove(grocery.id ?? 1);
                            });
                          },
                          child: Card(
                            color: selectedId == grocery.id
                                ? Colors.white70
                                : Colors.white,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          grocery.name,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 20),
                                        InkWell(
                                          splashColor: Colors.red,
                                          onTap: () {
                                            setState(() {
                                              var xyz = grocery.id;
                                              if (xyz != null) {
                                                DatabaseHelper.instance
                                                    .remove(xyz);
                                              }
                                              //DatabaseHelper.instance.remove(grocery.id ?? 1);
                                            });
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: AppTheme.yellow,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        height: 200,
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                        imageUrl: grocery.imageUrl,
                                      )),
                                )
                              ],
                            ),
                            /* ListTile(
                                title: Text(grocery.name),
                                //subtitle: Text(grocery.imageUrl),
                                onTap: () {
                                  setState(() {
                                    if (selectedId == null) {
                                      textController.text = grocery.name;
                                      selectedId = grocery.id;
                                    } else {
                                      textController.text = '';
                                      selectedId = null;
                                    }
                                  });
                                },
                                onLongPress: () {
                                  setState(() {
                                    DatabaseHelper.instance.remove(grocery.id!);
                                  });
                                },
                              ),*/
                            /*GridView.builder(

                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length,
                              //itemCount: 2,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                              itemBuilder: (context, index) {
                                return Container(
                                    margin: const EdgeInsets.all(3),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MaterialInfoScreen(
                                                    imageUrl: grocery
                                                        .imageUrl,
                                                    materialname:
                                                    grocery.name,
                                                  )),
                                        );
                                      },
                                      child: FadeInImage.memoryNetwork(
                                        fit: BoxFit.cover,
                                        fadeInDuration: const Duration(
                                            milliseconds: 70),
                                        placeholder: kTransparentImage,
                                        image: grocery.imageUrl,
                                      ),
                                    ));
                              })),*/
                          ),
                        ));
                      }).toList(),
                    );
            }),
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

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('materials', where: 'id = ?', whereArgs: [id]);
  }
}
