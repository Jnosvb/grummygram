import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:grummygram/Screens/Auth/register.dart';
import 'package:grummygram/Screens/home.dart';
import 'package:grummygram/controllers/authentication.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();
  final FocusNode emailAddressFocusNode = FocusNode();

  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();

  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());

  bool passwordVisibility = false;

  @override
  void dispose() {
    emailController.dispose();
    emailAddressFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'GrumpyGram',
                      style: GoogleFonts.poppins(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 66, 66, 66),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Selamat Datang',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 66, 66, 66),
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextField(
                      controller: emailController,
                      focusNode: emailAddressFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: GoogleFonts.poppins(
                          color: const Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 117, 142, 133),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF1F4F8),
                      ),
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF101213),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: passwordController,
                      focusNode: passwordFocusNode,
                      obscureText: !passwordVisibility,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: GoogleFonts.poppins(
                          color: const Color(0xFF57636C),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color(0xFFF1F4F8),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 117, 142, 133),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: Color(0xFFF1F4F8),
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisibility
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisibility = !passwordVisibility;
                            });
                          },
                        ),
                      ),
                      style: GoogleFonts.poppins(
                        color: const Color(0xFF101213),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () async {
                        var userData = _authenticationController.userData.value;
                        var result = await _authenticationController.login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim());

                        if (result == true) {
                          Get.snackbar(
                            'Pesan',
                            _authenticationController.userData['message'] ??
                                'Login berhasil!',
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            boxShadows: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8.0,
                              ),
                            ],
                            colorText: Colors.black,
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.green,
                            ),
                            snackPosition: SnackPosition.TOP,
                          );
                          Get.offAll(() => const HomeScreen());
                        } else {
                          Get.snackbar(
                            'Pesan',
                            result.toString(),
                            backgroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            boxShadows: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8.0,
                              ),
                            ],
                            colorText: Colors.black,
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.red,
                            ),
                            snackPosition: SnackPosition.TOP,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 152, 187, 174),
                        foregroundColor: Colors.white,
                        minimumSize: Size(370, 44),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: Obx(() {
                        return _authenticationController.isLoading.value
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Masuk',
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500),
                              );
                      }),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Belum punya akun? ',
                          style: GoogleFonts.poppins(
                            color: Color(0xFF101213),
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {
                            Get.off(() => const RegisterWidget());
                          },
                          child: Text(
                            'Daftar disini!',
                            style: GoogleFonts.poppins(
                              color: Color(0xFFA8C7BB),
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
