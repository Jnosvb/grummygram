import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grummygram/Screens/Auth/login.dart';
import 'package:grummygram/Screens/home.dart';
import 'package:grummygram/controllers/authentication.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthenticationController());
    final sessionManager = SessionManager();

    return Scaffold(
      body: FutureBuilder<bool>(
        future: _initializeApp(authController, sessionManager),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoadingScreen();
          } else {
            bool isTokenValid = snapshot.data ?? false;
            return isTokenValid ? const HomeScreen() : const LoginWidget();
          }
        },
      ),
    );
  }

  Future<bool> _initializeApp(AuthenticationController authController,
      SessionManager sessionManager) async {
    bool isTokenValid = await authController.validateToken(); // Validasi token
    if (isTokenValid) {
      await sessionManager
          .loadUserDetails(); // Load detail user jika token valid
    }
    return isTokenValid;
  }

  Widget _buildLoadingScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/image/grumpy.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // const Text(
          //   'Loading...',
          //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          // ),
        ],
      ),
    );
  }
}
