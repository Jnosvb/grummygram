import 'dart:convert';
import 'package:get/get.dart';
import 'package:grummygram/Constant/const.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:grummygram/Models/ActivityModel.dart';

class ActivityController extends GetxController {
  RxList<ActivityModel> posts = <ActivityModel>[].obs;
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getLogsUser();
  }

  Future<void> getLogsUser() async {
    try {
      var response = await http.get(
        Uri.parse('${url}get-logs'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        final content = json.decode(response.body) as Map<String, dynamic>;
        if (content['data'] != null && content['data'] is List) {
          posts.value = List<ActivityModel>.from(
            (content['data'] as List).map(
                (item) => ActivityModel.fromJson(item as Map<String, dynamic>)),
          );
        } else {
          posts.value = [];
          // Get.snackbar(
          //   'Info',
          //   'Tidak ada aktivitas ditemukan',
          //   snackPosition: SnackPosition.TOP,
          // );
        }
      } else {
        print("Error Message: ${response.body}");
        // Get.snackbar(
        //   'Error',
        //   'Failed to load data: ${response.statusCode}',
        //   snackPosition: SnackPosition.TOP,
        // );
      }
    } catch (e) {
      print("Error while fetching logs: $e");
      // Get.snackbar(
      //   'Error',
      //   'An error occurred while fetching logs',
      //   snackPosition: SnackPosition.TOP,
      // );
      // // } finally {Tidak Ada Data Terakhir
      //   isLoading.value = false;
    }
  }
}
