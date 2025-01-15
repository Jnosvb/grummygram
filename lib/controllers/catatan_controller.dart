import 'dart:convert';
import 'package:get/get.dart';
import 'package:grummygram/Constant/const.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:grummygram/Models/Catatan_Model.dart';

class CatatanController extends GetxController {
  Rx<List<CatatanModel>> posts = Rx<List<CatatanModel>>([]);
  Rx<List<LastData>> last = Rx<List<LastData>>([]);
  final isLoading = false.obs;
  final isLoadingPost = false.obs;
  final isButtonDisable = false.obs;
  final box = GetStorage();
  final userData = {}.obs;
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    getDaily();
    getLastDaily();
  }

  Future storedaily({
    required String judul,
    required String kegiatan,
    required String? idMood,
  }) async {
    try {
      isLoadingPost.value = true;
      isButtonDisable.value = true;
      var data = {
        'judul': judul,
        'kegiatan': kegiatan,
        'id_mood': idMood,
      };

      var response = await http.post(
        Uri.parse('${url}store-daily'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        isLoadingPost.value = false;
        isButtonDisable.value = false;
        var responseData = json.decode(response.body);
        final newDaily = json.decode(response.body)['data'];
        print("Catatan berhasil ditambahkan: $newDaily");
        userData['message'] = responseData['message'];
        return true;
      } else {
        isLoadingPost.value = false;
        isButtonDisable.value = false;
        print("Gagal Mengirim Data: ${json.decode(response.body)}");
        var responseData = json.decode(response.body);
        return responseData['message'] ?? 'Gagal Menambahkan Data';
      }
    } catch (e) {
      isLoadingPost.value = false;
      isButtonDisable.value = false;
      print("Error Mengirim Data: $e");
    }
  }

  Future updateDaily({
    required String idCatatan,
    required String judul,
    required String kegiatan,
    required String? idMood,
  }) async {
    try {
      isLoadingPost.value = true;
      var data = {
        'judul': judul,
        'kegiatan': kegiatan,
        'id_mood': idMood,
      };

      var response = await http.put(
        Uri.parse('${url}update-daily/${idCatatan}'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        isLoadingPost.value = false;
        var responseData = json.decode(response.body);
        final newDaily = json.decode(response.body)['data'];
        // posts.value.add(MotivasiModel.fromJson(
        //     newDaily));
        print("Motivasi berhasil ditambahkan: $newDaily");
        userData['message'] = responseData['message'];
        return true;
      } else {
        isLoadingPost.value = false;
        print("Failed to submit daily: ${json.decode(response.body)}");
        var responseData = json.decode(response.body);
        return responseData['message'] ?? 'Gagal Menambahkan Motivasi';
      }
    } catch (e) {
      isLoadingPost.value = false;
      print("Error submitting daily: $e");
    }
  }

  Future deleteDaily({
    required String idCatatan,
  }) async {
    try {
      var response = await http.delete(
        Uri.parse('${url}delete-daily/${idCatatan}'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        isLoadingPost.value = false;
        var responseData = json.decode(response.body);
        final newDaily = json.decode(response.body)['motivasi'];
        // posts.value.add(MotivasiModel.fromJson(
        //     newDaily));
        print("Motivasi berhasil Update: $newDaily");
        userData['message'] = responseData['message'];
        return true;
      } else {
        isLoadingPost.value = false;
        print("Failed to submit daily: ${json.decode(response.body)}");
        var responseData = json.decode(response.body);
        return responseData['message'] ?? 'Gagal Menambahkan Motivasi';
      }
    } catch (e) {
      isLoadingPost.value = false;
      print("Error submitting daily: $e");
    }
  }

  Future getDaily() async {
    try {
      posts.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}getdailyuser'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });

      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body);

        if (content['data'] != null && content['data'] is List) {
          posts.value = List<CatatanModel>.from(
            content['data'].map((item) => CatatanModel.fromJson(item)),
          );
        } else {
          print("Tidak Ada Data Catatan");
          Get.snackbar('Error', 'Tidak Ada Data Catatan',
              snackPosition: SnackPosition.TOP);
        }
      } else {
        isLoading.value = false;
        print("Failed to load data: ${response.statusCode}");
        print("Error Message: ${response.body}");
        Get.snackbar('Error', 'Gagal Mendapatkan Data',
            snackPosition: SnackPosition.TOP);
      }
    } catch (e) {
      // isLoading.value = false;
      print("Error fetching data: $e");
    }
  }

  Future getLastDaily() async {
    try {
      last.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse('${url}getdailyuser'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${box.read('token')}',
      });

      if (response.statusCode == 200) {
        isLoading.value = false;
        final content = json.decode(response.body);
        count.value = content['count'];
        if (content['lastdata'] != null && content['lastdata'] is Map) {
          last.value = [LastData.fromJson(content['lastdata'])];
        }
      } else {
        isLoading.value = false;
        print("Failed to load data: ${response.statusCode}");
        print("Error Message: ${response.body}");
      }
    } catch (e) {
      // isLoading.value = false;
      print("Error fetching data: $e");
      // Get.snackbar('Error', 'Gagal Mendapatkan Data: $e',
      //     snackPosition: SnackPosition.TOP);
    }
  }
}
