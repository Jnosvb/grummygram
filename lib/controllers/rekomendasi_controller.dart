import 'dart:convert';

import 'package:get/get.dart';
import 'package:grummygram/Constant/const.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class RekomendasiController extends GetxController {
  final isLoadingRespon = false.obs;
  final isButtonDisabled = false.obs;
  final box = GetStorage();
  final rekomendasi = <String>[].obs; // RxList untuk daftar string

  // @override
  // void onInit() {
  //   super.onInit();
  //   getDaily();
  // }

  Future recomendationsend({
    required String mood,
  }) async {
    try {
      isLoadingRespon.value = true;
      isButtonDisabled.value = true;
      var data = {
        'mood': mood,
      };
      var response = await http.post(
        Uri.parse('${url}rekomendasi-kegiatan'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
        body: data,
      );
      if (response.statusCode == 200) {
        isLoadingRespon.value = false;
        isButtonDisabled.value = false;
        // var responseData = json.decode(response.body);
        final recomendation =
            List<String>.from(json.decode(response.body)['recommendations']);
        rekomendasi.assignAll(recomendation);
        rekomendasi.value = recomendation;
        return true;
      } else {
        isLoadingRespon.value = false;
        isButtonDisabled.value = false;
        print("Gagal Mendapatkan Data: ${json.decode(response.body)}");
        var responseData = json.decode(response.body);
        return responseData['message'];
      }
    } catch (e) {
      isLoadingRespon.value = false;
      isButtonDisabled.value = false;
      print("Error Mendapatkan Data: $e");
    }
  }
}
