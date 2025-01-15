import 'dart:convert';
import 'dart:io';
import 'package:grummygram/Constant/const.dart';
import 'package:grummygram/Screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grummygram/Screens/Auth/Login.dart';

class SessionManager {
  static final SessionManager _instance = SessionManager._internal();

  factory SessionManager() => _instance;

  SessionManager._internal();
  int? usage;
  String? nama;
  String? username;
  String? tanggalLahir;
  String? alamat;
  String? foto;
  String? email;
  String? notelp;
  String? jeniskelamin;

  void setUserData(Map<String, dynamic> userSession) {
    username = userSession['username'];
    nama = userSession['nama'];
    email = userSession['email'];
    tanggalLahir = userSession['tanggal_lahir'];
    alamat = userSession['alamat'];
    foto = userSession['foto'];
    print("User Data Set: $nama, $tanggalLahir, $alamat");
  }

  Future<void> loadUserDetails() async {
    try {
      final box = GetStorage();
      var response = await http.get(
        Uri.parse('${url}user-detail'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        if (responseData['success'] == true && responseData['data'] != null) {
          var usageAI = responseData['usage'];
          var userSession = responseData['data'];
          var userSessionDetail = responseData['data']['user_detail'];
          usage = usageAI;
          username = userSession['username'];
          email = userSession['email'];
          nama = userSessionDetail['nama'];
          notelp = userSessionDetail['no_telp'];
          tanggalLahir = userSessionDetail['tanggal_lahir'];
          jeniskelamin = userSessionDetail['jenis_kelamin'];
          alamat = userSessionDetail['alamat'];
          foto = userSessionDetail['foto'];
        } else {
          throw Exception("User detail tidak ditemukan.");
        }
      } else {
        throw Exception(
            "Gagal memuat user detail. Status: ${response.statusCode}");
      }
    } catch (e) {
      print("Error loading user details: ${e.toString()}");
    }
  }

  void clearSession() {
    nama = null;
    tanggalLahir = null;
    alamat = null;
    foto = null;
  }
}

class AuthenticationController extends GetxController {
  final SessionManager session = SessionManager();
  final isLoading = false.obs;
  final isLoadingDetail = false.obs;
  final token = ''.obs;
  final box = GetStorage();
  final userData = {}.obs;
  final userDetail = {}.obs;
  final userSession = {}.obs;

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'email': email,
        'password': password,
      };

      var response = await http.post(
        Uri.parse('${url}login'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 200) {
        isLoading.value = false;

        var responseData = json.decode(response.body);
        token.value = responseData['token'];
        box.write('token', token.value);

        userData.value = responseData['data'];
        await session.loadUserDetails();
        userData['message'] = responseData['message'];

        Get.offAll(() => const HomeScreen());
        return true;
      } else {
        isLoading.value = false;

        var responseData = json.decode(response.body);
        return responseData['message'] ?? 'Login gagal';
      }
    } catch (e) {
      isLoading.value = false;

      print("Kesalahan: ${e.toString()}");
      const kesalahan = "Terjadi Kesalahan!";
      return kesalahan;
    }
  }

  Future register({
    required String username,
    required String email,
    required String password,
    required String passwordConfirmed,
  }) async {
    try {
      isLoading.value = true;
      var data = {
        'username': username,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmed,
      };
      var response = await http.post(
        Uri.parse('${url}registrasi'),
        headers: {
          'Accept': 'application/json',
        },
        body: data,
      );

      if (response.statusCode == 201) {
        isLoading.value = false;
        var responseData = json.decode(response.body);
        Get.offAll(() => const LoginWidget());
        userData['message'] = responseData['message'];
        return true;
      } else {
        isLoading.value = false;
        var responseData = json.decode(response.body);
        return responseData['message'] ?? 'Registrasi gagal';
      }
    } catch (e) {
      isLoading.value = false;
      // const kesalahan = "Terjadi Kesalahann!";
      print("Kesalahan: ${e.toString()}");
      return e.toString();
    }
  }

  Future logout() async {
    try {
      var response = await http.post(
        Uri.parse('${url}logout'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        },
      );

      if (response.statusCode == 200) {
        box.remove('token');
        print("Data setelah logout: ${box.read('token')}");
        return true;
      } else {
        return json.decode(response.body)['message'] ?? 'Gagal Logout';
      }
    } catch (e) {
      const kesalahan = "Terjadi Kesalahann!";
      return kesalahan;
    }
  }

  Future updatedetail({
    String? nama,
    required String notelp,
    required String tanggallahir,
    String? jeniskelamin,
    String? alamat,
    File? foto,
  }) async {
    try {
      isLoading.value = true;

      var uri = Uri.parse('${url}update-data');
      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll({
          'Accept': 'application/json',
          'Authorization': 'Bearer ${box.read('token')}',
        });
      request.fields['nama'] = nama ?? "-";
      request.fields['no_telp'] = notelp;
      request.fields['tanggal_lahir'] = tanggallahir;
      if (jeniskelamin != null) request.fields['jenis_kelamin'] = jeniskelamin;
      if (alamat != null) request.fields['alamat'] = alamat;

      if (foto != null) {
        request.files.add(
          await http.MultipartFile.fromPath('foto', foto.path),
        );
      }
      var response = await request.send();

      if (response.statusCode == 200) {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseData);
        print("Data berhasil diperbarui: $jsonResponse");
        return true;
      } else {
        var responseData = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseData);
        print("Gagal memperbarui data: $jsonResponse");
        return false;
      }
    } catch (e) {
      print("Error: $e");
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<bool> validateToken() async {
    final savedToken = box.read('token');
    if (savedToken == null || savedToken.isEmpty) {
      return false;
    }

    try {
      var response = await http.get(
        Uri.parse('${url}validate-token'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $savedToken',
        },
      );

      if (response.statusCode == 200) {
        print("Token valid");
        return true; // Token valid
      } else {
        print("Token tidak valid");
        return false; // Token tidak valid
      }
    } catch (e) {
      print("Kesalahan validasi token: ${e.toString()}");
      return false;
    }
  }
}
