import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:grummygram/Screens/Auth/login.dart';
import 'package:grummygram/controllers/authentication.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  late TextEditingController usernameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;
  final _authenticationController = Get.put(AuthenticationController());
  late FocusNode usernameFocusNode;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  late FocusNode passwordConfirmFocusNode;
  bool passwordVisibility = false;
  bool passwordConfirmVisibility = false;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    usernameFocusNode = FocusNode();
    emailController = TextEditingController();
    emailFocusNode = FocusNode();
    passwordController = TextEditingController();
    passwordFocusNode = FocusNode();
    passwordConfirmController = TextEditingController();
    passwordConfirmFocusNode = FocusNode();
  }

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    passwordConfirmFocusNode.dispose();
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
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  width: 100,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  alignment: const AlignmentDirectional(0, -1),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 140,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                            ),
                          ),
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(32, 0, 0, 0),
                            child: Text(
                              'GrumpyGram',
                              style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 66, 66, 66),
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Registrasi akun',
                                  style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 66, 66, 66),
                                    fontSize: 28,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 24),
                                // Username Input
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    width: 370,
                                    child: TextFormField(
                                      controller: usernameController,
                                      focusNode: usernameFocusNode,
                                      // autofocus: true,
                                      autofillHints: const [
                                        AutofillHints.email
                                      ],
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Username',
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 117, 142, 133),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xFFF1F4F8),
                                      ),
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF101213),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    width: 370,
                                    child: TextFormField(
                                      controller: emailController,
                                      focusNode: emailFocusNode,
                                      // autofocus: true,
                                      autofillHints: const [
                                        AutofillHints.email
                                      ],
                                      obscureText: false,
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 117, 142, 133),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xFFF1F4F8),
                                      ),
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xFF101213),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                                // Password Input
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    width: 370,
                                    child: TextFormField(
                                      controller: passwordController,
                                      focusNode: passwordFocusNode,
                                      // autofocus: true,
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 117, 142, 133),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xFFF1F4F8),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            passwordVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: const Color(0xFF57636C),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              passwordVisibility =
                                                  !passwordVisibility;
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
                                  ),
                                ),
                                // Confirm Password Input
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: Container(
                                    width: 370,
                                    child: TextFormField(
                                      controller: passwordConfirmController,
                                      focusNode: passwordConfirmFocusNode,
                                      // autofocus: true,
                                      autofillHints: const [
                                        AutofillHints.password
                                      ],
                                      obscureText: !passwordConfirmVisibility,
                                      decoration: InputDecoration(
                                        labelText: 'Konfirmasi Password',
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
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 117, 142, 133),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        filled: true,
                                        fillColor: const Color(0xFFF1F4F8),
                                        suffixIcon: IconButton(
                                          icon: Icon(
                                            passwordConfirmVisibility
                                                ? Icons.visibility_outlined
                                                : Icons.visibility_off_outlined,
                                            color: const Color(0xFF57636C),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              passwordConfirmVisibility =
                                                  !passwordConfirmVisibility;
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
                                  ),
                                ),
                                // Create Account Button
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 16),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      var result =
                                          await _authenticationController
                                              .register(
                                        username:
                                            usernameController.text.trim(),
                                        email: emailController.text.trim(),
                                        password:
                                            passwordController.text.trim(),
                                        passwordConfirmed:
                                            passwordConfirmController.text
                                                .trim(),
                                      );
                                      if (result == true) {
                                        Get.snackbar(
                                          'Pesan',
                                          _authenticationController
                                                  .userData['message'] ??
                                              'Registrasi berhasil!',
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 255, 255),
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
                                        Get.offAll(() => const LoginWidget());
                                      } else {
                                        // Jika registrasi gagal, tampilkan snackbar dengan pesan error
                                        Get.snackbar(
                                          'Pesan',
                                          result.toString(),
                                          backgroundColor: const Color.fromARGB(
                                              255, 255, 255, 255),
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
                                    child: Obx(() {
                                      return _authenticationController
                                              .isLoading.value
                                          ? const CircularProgressIndicator(
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255))
                                          : Text('Daftar',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ));
                                    }),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 152, 187, 174),
                                      minimumSize: const Size(370, 44),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                  ),
                                ),

                                // arahkan ke login
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 12),
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: 'Sudah Memiliki Akun? ',
                                          style: GoogleFonts.poppins(
                                            color: Color(0xFF57636C),
                                            fontSize: 14,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Masuk Disini!',
                                          style: GoogleFonts.poppins(
                                            color: const Color(0xFFA8C7BB),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.off(
                                                () => const LoginWidget(),
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
