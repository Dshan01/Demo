import 'dart:convert';

import 'package:ass_ajna/AppController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';


class ass extends StatefulWidget {
  const ass({Key? key}) : super(key: key);

  @override
  State<ass> createState() => _assState();
}

class _assState extends State<ass> {

// appController demoController = Get.find();
var demoController = Get.put(appController());

@override
  void initState() {
    demoController.getCategoryApi();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
          return Stack(
            children: [
              SafeArea(
                  child: ListView.builder(
                      itemCount: demoController.dataList.value.length,
                      itemBuilder: (context, index){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Card(
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.27,
                                        child: Text("Domain",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15),
                                        ).paddingOnly(left: 10),
                                      ),
                                      Text(":",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ).marginOnly(left: 20),
                                      Expanded(
                                        child: Text(demoController.dataList.value[index].domains!.toString(), style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),).marginOnly(left: 20),
                                      ),
                                    ],
                                  ),
                                  5.height,
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.27,
                                        child: Text(
                                          'Alpha code',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15),
                                        ).paddingOnly(left: 10),
                                      ),
                                      Text(":",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ).marginOnly(left: 20),
                                      Expanded(
                                        child: Text(demoController.dataList.value[index].alphaTwoCode!, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),).marginOnly(left: 20),
                                      ),
                                    ],
                                  ),
                                  5.height,
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.27,
                                        child: Text(
                                          'Name',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15),
                                        ).paddingOnly(left: 10),
                                      ),
                                      Text(":",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ).marginOnly(left: 20),
                                      Expanded(
                                        child: Text(demoController.dataList.value[index].name!, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),).marginOnly(left: 20),
                                      ),
                                    ],
                                  ),
                                  5.height,
                                  Row(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.27,
                                        child: Text(
                                          'Web Page',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15),
                                        ).paddingOnly(left: 10),
                                      ),
                                      Text(":",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15),
                                      ).marginOnly(left: 20),
                                      Expanded(
                                        child: Text(demoController.dataList.value[index].webPages!.toString(), style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),).marginOnly(left: 20),
                                      ),
                                    ],
                                  ),
                                  5.height,
                                ],
                              ).paddingAll(10),

                            ).paddingOnly(left: 10,right: 10),
                          ],
                        );
                      }).paddingOnly(top: 20)
              ),
              demoController.isLoading.value?  Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator()):Container(),
            ],
          );
        }
      ),
    );
  }
}

class listDataModel {
  String? name;
  List<String>? webPages;
  List<String>? domains;
  String? alphaTwoCode;
  String? country;
  String? stateProvince;

  listDataModel(
      {this.name,
        this.webPages,
        this.domains,
        this.alphaTwoCode,
        this.country,
        this.stateProvince});

  listDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    webPages = json['web_pages'].cast<String>();
    domains = json['domains'].cast<String>();
    alphaTwoCode = json['alpha_two_code'];
    country = json['country'];
    stateProvince = json['state-province'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['web_pages'] = this.webPages;
    data['domains'] = this.domains;
    data['alpha_two_code'] = this.alphaTwoCode;
    data['country'] = this.country;
    data['state-province'] = this.stateProvince;
    return data;
  }

  static List<listDataModel> parseList(dynamic json) {
    if (json.toString().isNotEmpty) {
      return json
          .map<listDataModel>(
              (tagJson) => listDataModel.fromJson(tagJson))
          .toList();
    } else {
      return <listDataModel>[];
    }
  }

// static List<listDataModel> parseList(dynamic json){
//   return json.map<listDataModel>((tagJson) => listDataModel.fromJson(tagJson)).toList();
// }

}


class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {


  var demo2 = Get.put(appController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          demo2.getCategoryApi();
          },child: Text("ok"),),
      ),
    );
  }
}
