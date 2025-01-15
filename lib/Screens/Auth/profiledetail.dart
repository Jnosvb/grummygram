import 'package:flutter/material.dart';
import 'package:grummygram/Screens/Auth/profile.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:grummygram/controllers/authentication.dart';
import 'package:get/get.dart';

class ProfileDetailWidget extends StatefulWidget {
  final String nama;
  final String notelp;
  final String tgllahir;
  final String jeniskelamin;
  final String alamat;

  const ProfileDetailWidget({
    required this.nama,
    required this.notelp,
    required this.tgllahir,
    required this.jeniskelamin,
    required this.alamat,
    Key? key,
  }) : super(key: key);

  @override
  _ProfileDetailWidgetState createState() => _ProfileDetailWidgetState();
}

class _ProfileDetailWidgetState extends State<ProfileDetailWidget> {
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  final session = SessionManager();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  File? _profileImage;
  String? _selectedGender;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _refreshSession();
    _nameController.text = widget.nama;
    _phoneController.text = widget.notelp;
    _birthDateController.text = widget.tgllahir;
    _selectedGender =
        widget.jeniskelamin.isNotEmpty ? widget.jeniskelamin : 'Laki-Laki';
    _addressController.text = widget.alamat;
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
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile Details',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 40,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.grey.shade300,
                            backgroundImage: _profileImage != null
                                ? FileImage(_profileImage!)
                                : null,
                            child: _profileImage == null
                                ? Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey.shade800,
                                    size: 40,
                                  )
                                : null,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: _nameController,
                          label: 'Nama Lengkap',
                          hint: 'Masukkan nama lengkap',
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: _phoneController,
                          label: 'No Telepon',
                          hint: 'Masukkan nomor telepon',
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: _birthDateController,
                          label: 'Tanggal Lahir',
                          hint: 'Pilih tanggal lahir',
                          readOnly: true,
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (selectedDate != null) {
                              setState(() {
                                _birthDateController.text =
                                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                              });
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                        DropdownButtonFormField<String>(
                          value: _selectedGender,
                          style: GoogleFonts.poppins(
                            color: const Color.fromARGB(255, 81, 80, 80),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                          items: const [
                            DropdownMenuItem(
                              
                              value: 'Laki-Laki',
                              child: Text('Laki-Laki'),
                            ),
                            DropdownMenuItem(
                              value: 'Perempuan',
                              child: Text('Perempuan'),
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedGender = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelText: 'Jenis Kelamin',
                            labelStyle: GoogleFonts.poppins(
                              color: const Color.fromARGB(255, 81, 80, 80),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xFFE5E7EB),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color.fromARGB(255, 81, 80, 80),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        _buildTextField(
                          controller: _addressController,
                          label: 'Alamat',
                          hint: 'Masukkan alamat',
                          maxLines: 3,
                        ),
                        const SizedBox(height: 30),
                        Obx(() => ElevatedButton(
                              onPressed: _authenticationController
                                      .isLoading.value
                                  ? null
                                  : () async {
                                      var result =
                                          await _authenticationController
                                              .updatedetail(
                                        nama: _nameController.text.trim(),
                                        notelp: _phoneController.text.trim(),
                                        jeniskelamin: _selectedGender ?? '',
                                        tanggallahir:
                                            _birthDateController.text.trim(),
                                        alamat: _addressController.text.trim(),
                                        foto: _profileImage,
                                      );

                                      if (result == true) {
                                        Get.snackbar(
                                          'Pesan',
                                          'Detail profile berhasil diperbarui!',
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
                                      } else {
                                        Get.snackbar(
                                          'Pesan',
                                          'Gagal memperbarui detail profile.',
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
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 80),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                                backgroundColor:
                                    const Color.fromARGB(255, 162, 194, 135),
                              ),
                              child: _authenticationController.isLoading.value
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2.0,
                                      ),
                                    )
                                  : Text(
                                      'Simpan',
                                      style: GoogleFonts.poppins(
                                          color: Colors.white, fontSize: 16,fontWeight: FontWeight.w600,),
                                    ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    bool readOnly = false,
    VoidCallback? onTap,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.poppins(
          color: const Color(0xFF57636C),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        hintText: hint,
        hintStyle: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 184, 184, 184),
          fontSize: 14,
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
        fillColor: Colors.white,
      ),
      style: GoogleFonts.poppins(
        color: const Color(0xFF101213),
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
