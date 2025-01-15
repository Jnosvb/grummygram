import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:grummygram/Screens/Catatan/catatan_screen.dart';
import 'package:grummygram/Screens/home.dart';
import 'package:grummygram/controllers/authentication.dart';
import 'package:grummygram/controllers/mood_controller.dart';
import 'package:grummygram/controllers/catatan_controller.dart';

class CatatanDetailWidget extends StatefulWidget {
  final Function(int)? onNavigate;
  final String idCatatan;
  final String judul;
  final String kegiatan;
  final int mood;

  const CatatanDetailWidget(
      {required this.judul,
      required this.idCatatan,
      required this.kegiatan,
      required this.mood,
      Key? key,
      this.onNavigate})
      : super(key: key);

  @override
  State<CatatanDetailWidget> createState() => _CatatanDetailWidgetState();
}

class _CatatanDetailWidgetState extends State<CatatanDetailWidget> {
  int _selectedIndex = 0;
  final TextEditingController _catatanTextController = TextEditingController();
  final TextEditingController _judulTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthenticationController _authenticationController =
      Get.put(AuthenticationController());
  final CatatanController _catatanController = Get.put(CatatanController());
  final MoodController _moodController = Get.put(MoodController());
  int? moodsId;
  String? idCatatan;

  @override
  void initState() {
    idCatatan = widget.idCatatan;
    _judulTextController.text = widget.judul;
    _catatanTextController.text = widget.kegiatan;
    moodsId = widget.mood;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_moodController.isLoading.value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
                size: 24.0,
              ),
              onPressed: () {
                Get.back();
              },
            ),
            title: Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Detail Catatan',
                style: GoogleFonts.outfit(
                  color: const Color(0xFF15161E),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            elevation: 0.0,
          ),
          body: const Center(child: CircularProgressIndicator()),
        );
      }

      List<Map<String, dynamic>> moodpositif = _moodController.posts.value
          .where((mood) => mood.id_kategori_mood == 1)
          .map((mood) => {
                'id': mood.id,
                'path': 'assets/icongif/${mood.icon}',
                'name': mood.detail_mood ?? 'No Name'
              })
          .toList();

      List<Map<String, dynamic>> moodnegatif = _moodController.posts.value
          .where((mood) => mood.id_kategori_mood == 2)
          .map((mood) => {
                'id': mood.id,
                'path': 'assets/icongif/${mood.icon}',
                'name': mood.detail_mood ?? 'No Name'
              })
          .toList();

      List<Map<String, dynamic>> moodnetral = _moodController.posts.value
          .where((mood) => mood.id_kategori_mood == 3)
          .map((mood) => {
                'id': mood.id,
                'path': 'assets/icongif/${mood.icon}',
                'name': mood.detail_mood ?? 'No Name'
              })
          .toList();

      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          title: Align(
            alignment: AlignmentDirectional.centerStart,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Detail Catatan',
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF15161E),
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Detail Cerita Anda',
                  style: GoogleFonts.outfit(
                    color: const Color(0xFF606A85),
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          elevation: 0.0,
        ),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 22.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _judulTextController,
                          decoration: InputDecoration(
                            labelText: "Judul Cerita Kamu",
                            labelStyle: GoogleFonts.outfit(
                              color: const Color.fromARGB(255, 81, 80, 80),
                              fontSize: 16.0,
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
                            contentPadding: const EdgeInsets.all(16.0),
                          ),
                          style: GoogleFonts.figtree(
                            color: const Color(0xFF15161E),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _catatanTextController,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration(
                            labelText: 'Ceritakan Perasaan Kamu',
                            labelStyle: GoogleFonts.outfit(
                              color: const Color.fromARGB(255, 81, 80, 80),
                              fontSize: 16.0,
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
                            contentPadding: const EdgeInsets.all(16.0),
                          ),
                          style: GoogleFonts.figtree(
                            color: const Color(0xFF15161E),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          maxLines: 9,
                          minLines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Cerita hari ini ga boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        _buildMoodSection(
                          title: 'Mood Positif',
                          iconData: moodpositif,
                        ),
                        _buildMoodSection(
                          title: 'Mood Negatif',
                          iconData: moodnegatif,
                        ),
                        _buildMoodSection(
                          title: 'Mood Netral',
                          iconData: moodnetral,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.dialog(
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
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
                                              "Anda Yakin Akan Mengubah Catatan Ini?",
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
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      minimumSize:
                                                          const Size(0, 45),
                                                      side: const BorderSide(
                                                        color:
                                                            Color(0xFF6C757D),
                                                        width: 2.0,
                                                      ),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFF6C757D),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Batal',
                                                      style:
                                                          GoogleFonts.poppins(
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
                                                          await _catatanController
                                                              .updateDaily(
                                                        idCatatan: idCatatan
                                                            .toString(),
                                                        judul:
                                                            _judulTextController
                                                                .text
                                                                .trim(),
                                                        kegiatan:
                                                            _catatanTextController
                                                                .text
                                                                .trim(),
                                                        idMood:
                                                            moodsId?.toString(),
                                                      );
                                                      if (result == true) {
                                                        Get.snackbar(
                                                          'Pesan',
                                                          _authenticationController
                                                                      .userData[
                                                                  'message'] ??
                                                              'Catatan Berhasil Diupdate!',
                                                          backgroundColor:
                                                              const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                          boxShadows: const [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 8.0,
                                                            ),
                                                          ],
                                                          colorText:
                                                              Colors.black,
                                                          icon: const Icon(
                                                            Icons.notifications,
                                                            color: Colors.green,
                                                          ),
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          messageText: Text(
                                                            _authenticationController
                                                                        .userData[
                                                                    'message'] ??
                                                                'Catatan Berhasil Diupdate!',
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        );
                                                        Get.offAll(
                                                            () => HomeScreen());
                                                      } else {
                                                        Get.snackbar(
                                                          'Pesan',
                                                          result.toString(),
                                                          backgroundColor:
                                                              const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                          boxShadows: const [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 8.0,
                                                            ),
                                                          ],
                                                          colorText:
                                                              Colors.black,
                                                          icon: const Icon(
                                                            Icons.notifications,
                                                            color: Colors.red,
                                                          ),
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          messageText: Text(
                                                            result.toString(),
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      minimumSize:
                                                          const Size(0, 45),
                                                      side: const BorderSide(
                                                        color:
                                                            Color(0xFFFFC823),
                                                        width: 2.0,
                                                      ),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFFFC823),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Update',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        color: Colors.black,
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
                            backgroundColor: const Color(0xFFFFC823),
                            minimumSize: const Size(double.infinity, 48.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          child: Text(
                            'Update',
                            style: GoogleFonts.figtree(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Hapus Button
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.dialog(
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
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
                                              "Anda Yakin Akan Menghapus Catatan Ini?",
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
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      minimumSize:
                                                          const Size(0, 45),
                                                      side: const BorderSide(
                                                        color:
                                                            Color(0xFF6C757D),
                                                        width: 2.0,
                                                      ),
                                                      backgroundColor:
                                                          Color(0xFF6C757D),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Batal',
                                                      style:
                                                          GoogleFonts.poppins(
                                                        fontSize: 16,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 255, 255, 255),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: OutlinedButton(
                                                    onPressed: () async {
                                                      var result =
                                                          await _catatanController
                                                              .deleteDaily(
                                                                  idCatatan:
                                                                      idCatatan
                                                                          .toString());
                                                      if (result == true) {
                                                        Get.snackbar(
                                                          'Pesan',
                                                          _authenticationController
                                                                      .userData[
                                                                  'message'] ??
                                                              'Catatan Berhasil Dihapus!',
                                                          backgroundColor:
                                                              const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                          boxShadows: const [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 8.0,
                                                            ),
                                                          ],
                                                          colorText:
                                                              Colors.black,
                                                          icon: const Icon(
                                                            Icons.notifications,
                                                            color: Colors.green,
                                                          ),
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          messageText: Text(
                                                            _authenticationController
                                                                        .userData[
                                                                    'message'] ??
                                                                'Catatan Berhasil Dihapus!',
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        );
                                                        Get.offAll(
                                                            () => const HomeScreen());
                                                      } else {
                                                        Get.snackbar(
                                                          'Pesan',
                                                          result.toString(),
                                                          backgroundColor:
                                                              const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                          boxShadows: const [
                                                            BoxShadow(
                                                              color: Colors
                                                                  .black26,
                                                              blurRadius: 8.0,
                                                            ),
                                                          ],
                                                          colorText:
                                                              Colors.black,
                                                          icon: const Icon(
                                                            Icons.notifications,
                                                            color: Colors.red,
                                                          ),
                                                          snackPosition:
                                                              SnackPosition.TOP,
                                                          messageText: Text(
                                                            result.toString(),
                                                            style: GoogleFonts
                                                                .poppins(
                                                                    fontSize:
                                                                        14,
                                                                    color: Colors
                                                                        .black),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      minimumSize:
                                                          const Size(0, 45),
                                                      side: const BorderSide(
                                                        color:
                                                            Color(0xFFDC3545),
                                                        width: 2.0,
                                                      ),
                                                      backgroundColor:
                                                          const Color(
                                                              0xFFDC3545),
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      'Hapus',
                                                      style:
                                                          GoogleFonts.poppins(
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
                            minimumSize: const Size(double.infinity, 48.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                          ),
                          child: Text(
                            'Hapus',
                            style: GoogleFonts.figtree(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildMoodSection({
    required String title,
    required List<Map<String, dynamic>> iconData,
    double iconSize = 50.0,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(
            color: const Color(0xFF606A85),
            fontSize: 14.0,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: iconData.map((data) {
            bool isSelected = moodsId == data['id'];
            return GestureDetector(
              onTap: () {
                setState(() {
                  moodsId = data['id'];
                });
              },
              child: Column(
                children: [
                  AnimatedScale(
                    scale: isSelected ? 1.5 : 1.0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        isSelected
                            ? Colors.transparent
                            : Colors.white.withOpacity(1),
                        BlendMode.saturation,
                      ),
                      child: Image.asset(
                        data['path'],
                        width: iconSize,
                        height: iconSize,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    opacity: isSelected ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 300),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        data['name'],
                        style: GoogleFonts.outfit(
                          color: const Color(0xFF15161E),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
