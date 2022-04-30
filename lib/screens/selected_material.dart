import 'dart:convert' as cnv;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:theluxuryshoplaravelbackend/screens/models/materials.dart';

import '../app_theme.dart';
import 'selected_material_image.dart';

class SelectedMaterial extends StatefulWidget {
  final String materialName;

  const SelectedMaterial({Key? key, required this.materialName})
      : super(key: key);

  @override
  State<SelectedMaterial> createState() => _SelectedMaterialState();
}

class _SelectedMaterialState extends State<SelectedMaterial> {
  List<MaterialImages>? model;
  final String imageBaseUrl =
      "https://91f6-41-90-71-22.ngrok.io/public/Images/materials";

  /*Future<void> getMaterials() async {
    //Uri url = Uri.https('jsonplaceholder.typicode.com', '/posts');
    Uri url = Uri.https('91f6-41-90-71-22.ngrok.io', 'api/fetchMaterials');

    http.Response res = await http.get(url);
    List<dynamic> body = cnv.jsonDecode(res.body);
    model = body.map((dynamic item) => Materials.fromJson(item)).toList();
    setState(() {});
  }*/

  Future getMaterials(String material_category) async {
    final response = await http.post(
      Uri.parse('https://91f6-41-90-71-22.ngrok.io/api/fetchMaterials'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: cnv.jsonEncode(<String, String>{
        'material_category': material_category,
      }),
    );
    List<dynamic> body = cnv.jsonDecode(response.body);
    model = body.map((dynamic item) => MaterialImages.fromJson(item)).toList();

    setState(() {});
    return model;
  }

  @override
  void initState() {
    super.initState();
    getMaterials(widget.materialName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      /*  */
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.yellow[9000],
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40.0),
                  bottomLeft: Radius.circular(40.0)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 15.0),
                Container(
                  margin: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 15.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            widget.materialName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                letterSpacing: 2.0,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Flexible(
            child: model == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: model?.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MaterialInfoScreen(
                                      imageUrl:
                                          '$imageBaseUrl/abc/${model![index].material_image}',
                                      materialname: model![index]
                                          .material_name
                                          .toString(),
                                      materialCategory: model![index]
                                          .material_category
                                          .toString(),
                                    )),
                          );
                        },
                        child: Container(
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  offset: const Offset(1, 1),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageUrl:
                                  '$imageBaseUrl/abc/${model![index].material_image}',
                            )),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
