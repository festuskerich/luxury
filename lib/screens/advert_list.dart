import 'dart:convert' as cnv;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:theluxuryshoplaravelbackend/screens/models/advert.dart';
import 'package:theluxuryshoplaravelbackend/screens/screens.dart';
import 'package:theluxuryshoplaravelbackend/screens/utils/default_app_theme.dart';

class AdvertList extends StatefulWidget {
  const AdvertList({Key? key}) : super(key: key);

  @override
  State<AdvertList> createState() => _AdvertListState();
}

class _AdvertListState extends State<AdvertList> {
  List<Adverts>? model;

  Future<void> getData() async {
    Uri url = Uri.https('91f6-41-90-71-22.ngrok.io', 'api/adverts');

    http.Response res = await http.get(url);
    List<dynamic> body = cnv.jsonDecode(res.body);
    model = body.map((dynamic item) => Adverts.fromJson(item)).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: model == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: const Offset(1, 1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    child: Column(
                      children: [
                        CachedNetworkImage(
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                          imageUrl:
                              "https://91f6-41-90-71-22.ngrok.io/public/Images/materials/abc/${model![index].image.toString()}",
                        ),
                        Container(
                          color:
                              DefaultAppTheme.buildLightTheme().backgroundColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          model![index].bodyContent.toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: model?.length,
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow[9000],
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const NavigationHomeScreen()));
        },
        tooltip: 'Go to Home page ',
        child: const Icon(
          Icons.arrow_forward,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
