

import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'AssPage.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

class appController extends GetxController {

  var dataList = <listDataModel>[].obs;
  var domainData = <String>[].obs;
  var webPageData = <String>[].obs;

  var isLoading = false.obs;


  Future<void> getCategoryApi() async {
    try {
      isLoading.value = true;

      var request = http.Request('GET', Uri.parse('http://universities.hipolabs.com/search'));

      http.StreamedResponse response = await request.send();


      if (response.statusCode == 200) {

        String serverResponse = await response.stream.bytesToString();
        var data = json.decode(serverResponse);

        List<listDataModel> dList = listDataModel.parseList(data);
        dataList.value = dList;

        isLoading.value= false;

       print(serverResponse);

      } else {
    print('Request failed with status: ${response.statusCode}');
    }
    } catch (e) {
    print('Error: $e');
    }
  }

}