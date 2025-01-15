import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:grummygram/Constant/const.dart';
import 'package:grummygram/Screens/Auth/login.dart';
import 'package:grummygram/Screens/Auth/profiledetail.dart';
import 'package:grummygram/controllers/authentication.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  final session = SessionManager();

  @override
  void initState() {
    super.initState();
    _refreshSession();
  }

  void _refreshSession() async {
    await session.loadUserDetails();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F5FA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF3EAE5),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: const Color(0xFF14181B)),
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.poppins(
            color: const Color(0xFF14181B),
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Header
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            width: double.infinity,
            color: Color(0xFFF3EAE5),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E3E7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      Uri.parse(
                              "$imageurl${session.foto}?timestamp=${DateTime.now().millisecondsSinceEpoch}")
                          .toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      var userData = _authenticationController.userData.value;
                      return Text(
                        "${session.username ?? 'Pengguna'}",
                        // "${userData["username"] ?? 'Pengguna'}",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF14181B),
                        ),
                      );
                    }),
                    const SizedBox(height: 4),
                    Obx(() {
                      var userDetail = _authenticationController.userData.value;
                      return Text(
                        "${session.email ?? 'Email'}",
                        // "${userDetail["email"] ?? 'Email'}",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF4B39EF),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'Account Settings',
              style: GoogleFonts.poppins(
                color: const Color(0xFF57636C),
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(height: 12),

          _buildListItem(
            context,
            icon: Icons.lock_outline,
            text: 'Change Password',
            onTap: () {
              print('Change Password tapped');
            },
          ),
          const SizedBox(height: 12),

          _buildListItem(
            context,
            icon: Icons.person_outline,
            text: 'Edit Profile',
            onTap: () async {
              await Get.to(() => ProfileDetailWidget(
                    nama: session.nama ?? '',
                    notelp: session.notelp ?? '',
                    tgllahir: session.tanggalLahir ?? '',
                    jeniskelamin: session.jeniskelamin ?? '',
                    alamat: session.alamat ?? '',
                  ));
              _refreshSession();
            },
            badge: session.nama == null ||
                session.notelp == null ||
                session.tanggalLahir == null ||
                session.jeniskelamin == null ||
                session.alamat == null,
          ),
          const SizedBox(height: 12),

          Center(
            child: ElevatedButton(
              onPressed: () {
                Get.dialog(
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Material(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 15),
                                Text(
                                  "Anda Yakin Akan Keluar?",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () {
                                          Get.back();
                                        },
                                        style: OutlinedButton.styleFrom(
                                          minimumSize: const Size(0, 45),
                                          side: const BorderSide(
                                            color: Color(0xFF6C757D),
                                            width: 2.0,
                                          ),
                                          backgroundColor:const Color(0xFF6C757D),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          'Batal',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: () async {
                                          var result =
                                              await _authenticationController
                                                  .logout();
                                          if (result == true) {
                                            Get.offAll(
                                                () => const LoginWidget());
                                          } else {
                                            Get.snackbar(
                                              'Error',
                                              result.toString(),
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Colors.red,
                                              colorText: Colors.white,
                                              icon: const Icon(
                                                Icons.error_outline,
                                                color: Colors.white,
                                              ),
                                            );
                                          }
                                        },
                                        style: OutlinedButton.styleFrom(
                                          minimumSize: const Size(0, 45),
                                          side: const BorderSide(
                                            color: Color(0xFFDC3545),
                                            width: 2.0,
                                          ),
                                          backgroundColor:
                                              const Color(0xFFDC3545),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          'Keluar',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
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
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDC3545),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text(
                'Log Out',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context,
      {required IconData icon,
      required String text,
      required VoidCallback onTap,
      bool badge = false}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 5,
              color: Color(0x3416202A),
              offset: Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF57636C)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: GoogleFonts.poppins(
                  color: const Color(0xFF57636C),
                  fontSize: 14,
                ),
              ),
            ),
            if (badge)
              Container(
                margin: const EdgeInsets.only(right: 8),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  '!',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
            const Icon(Icons.arrow_forward_ios,
                color: Color(0xFF57636C), size: 18),
          ],
        ),
      ),
    );
  }
}
