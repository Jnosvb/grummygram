import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:grummygram/Screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); // Inisialisasi GetStorage untuk token

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'GrumpGram',
      debugShowCheckedModeBanner: false,
      home: SplashScreenWidget(), // SplashScreen sebagai halaman awal
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:grummygram/Screens/Auth/login.dart';

// import 'package:grummygram/Screens/home.dart';
// import 'package:grummygram/controllers/authentication.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await GetStorage.init(); // Inisialisasi GetStorage

//   // Membuat instance AuthenticationController
//   final authController = AuthenticationController();
//   // final sessionManager = SessionManager();
//   // Memvalidasi token
//   bool isTokenValid = await authController.validateToken();

//   // Menjalankan aplikasi
//   // runApp(MyApp(isTokenValid: isTokenValid));
//   runApp(MyApp(
//     isTokenValid: isTokenValid,
//   ));
// }

// class MyApp extends StatelessWidget {
//   final bool isTokenValid;

//   const MyApp({required this.isTokenValid, super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'grummygram',
//       debugShowCheckedModeBanner: false,
//       home: isTokenValid ? const HomeScreen() : const LoginWidget(),
//     );
//   }
// }
//   Future<bool> _initializeApp(AuthenticationController authController,
//       SessionManager sessionManager) async {
//     bool isTokenValid = await authController.validateToken();
//     if (isTokenValid) {
//       await sessionManager.loadUserDetails(); // Load data user jika token valid
//     }
//     return isTokenValid;
//   }
// }

//
// import 'package:flutter/material.dart';
// import 'package:grummygram/Screens/Auth/login.dart';
// import 'package:grummygram/Screens/dashboard.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final box = GetStorage();
//     final token = box.read('token');
//     return GetMaterialApp(
//       title: 'GrummyGram',
//       debugShowCheckedModeBanner: false,
//       home: token == null ? const LoginWidget() : const DashboardWidget(),
//     );
//   }
// }

//

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:grummygram/Models/Catatan_Model.dart';
// import 'package:grummygram/Screens/Auth/login.dart';
// import 'package:grummygram/Screens/Auth/profile.dart';
// import 'package:grummygram/Screens/Auth/profiledetail.dart';
// import 'package:grummygram/Screens/dashboard.dart';
// import 'package:grummygram/Screens/catatanku.dart';
// import 'package:grummygram/Screens/detailcatatan.dart';
// import 'screens/rekomendasi.dart'; // pastikan path sesuai dengan struktur folder Anda

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Aplikasi Catatan',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const CatatanDetailWidget(),
//     );
//   }
// }
