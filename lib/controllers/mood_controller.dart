import 'dart:convert';

import 'package:get/get.dart';
import 'package:grummygram/Constant/const.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:grummygram/Models/Mood_Model.dart';

class MoodController extends GetxController {
  Rx<List<MoodModel>> posts = Rx<List<MoodModel>>([]);
  final isLoading = false.obs;
  final isLoadingPost = false.obs;

  final box = GetStorage();
  final userData = {}.obs;

  @override
  void onInit() {
    super.onInit();
    getAllMood();
  }

  Future getAllMood() async {
    try {
      posts.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}getmood'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });

      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body);
        if (content['data'] != null && content['data'] is List) {
          for (var item in content['data']) {
            posts.value.add(MoodModel.fromJson(item));
          }
        } else {
          print("No mood data available or invalid format");
          Get.snackbar('Error', 'No mood data available or invalid format',
              snackPosition: SnackPosition.TOP);
        }
      } else {
        isLoading.value = false;
        print("Failed to load data: ${response.statusCode}");
        print("Error Message: ${response.body}");
        Get.snackbar('Error', 'Failed to load mood data',
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      isLoading.value = false;
      print("Error fetching data: $e");
      Get.snackbar('Error', 'Error fetching mood data: $e',
          snackPosition: SnackPosition.TOP);
    }
  }
}
