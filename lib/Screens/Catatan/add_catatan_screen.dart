import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:grummygram/Screens/Catatan/detail_submit_screen.dart';
import 'package:grummygram/controllers/mood_controller.dart';
import 'package:grummygram/controllers/catatan_controller.dart';
import 'package:grummygram/Utils/mood_utils.dart';
import 'package:grummygram/Widgets/mood_section.dart';
import 'package:grummygram/Widgets/catatan_form.dart';

class CatatanWidget extends StatefulWidget {
  final Function(int)? onNavigate;
  const CatatanWidget({Key? key, this.onNavigate}) : super(key: key);

  @override
  State<CatatanWidget> createState() => _CatatanWidgetState();
}

class _CatatanWidgetState extends State<CatatanWidget> {
  final TextEditingController _catatanTextController = TextEditingController();
  final TextEditingController _judulTextController = TextEditingController();
  final FocusNode _judulFocusNode = FocusNode();
  final FocusNode _catatanFocusNode = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final CatatanController _catatanController = Get.put(CatatanController());
  final MoodController _moodController = Get.put(MoodController());
  int? moodsId;

  @override
  void dispose() {
    _judulTextController.dispose();
    _judulFocusNode.dispose();
    _catatanTextController.dispose();
    _catatanFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                'Catatan',
                style: GoogleFonts.outfit(
                  color: const Color(0xFF15161E),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Ceritakan Perasaan Kamu Hari Ini',
                style: GoogleFonts.outfit(
                  color: const Color(0xFF606A85),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
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
                      CatatanForm(
                          judulController: _judulTextController,
                          catatanController: _catatanTextController,
                          judulFocusNode: _judulFocusNode,
                          catatanFocusNode: _catatanFocusNode),
                      const SizedBox(height: 20.0),
                      MoodSection(
                        title: 'Mood Positif',
                        iconData: moodpositif,
                        selectedMoodId: moodsId,
                        onMoodSelected: (id, mood) {
                          setState(() {
                            moodsId = id;
                          });
                        },
                      ),
                      MoodSection(
                        title: 'Mood Negatif',
                        iconData: moodnegatif,
                        selectedMoodId: moodsId,
                        onMoodSelected: (id, mood) {
                          setState(() {
                            moodsId = id;
                          });
                        },
                      ),
                      MoodSection(
                        title: 'Mood Netral',
                        iconData: moodnetral,
                        selectedMoodId: moodsId,
                        onMoodSelected: (id, mood) {
                          setState(() {
                            moodsId = id;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: Obx(() {
                  return ElevatedButton(
                    onPressed: _catatanController.isButtonDisable.value
                        ? null
                        : () async {
                            _catatanController.isButtonDisable.value = true;
                            var result = await _catatanController.storedaily(
                              judul: _judulTextController.text.trim(),
                              kegiatan: _catatanTextController.text.trim(),
                              idMood: moodsId.toString(),
                            );
                            if (result == true) {
                              Get.snackbar(
                                'Pesan',
                                _catatanController.userData['message'] ??
                                    'Catatan berhasil ditambahkan!',
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
                                messageText: Text(
                                  _catatanController.userData['message'] ??
                                      'Catatan berhasil ditambahkan!',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color:
                                          const Color.fromARGB(255, 0, 0, 0)),
                                ),
                              );

                              Map<String, dynamic> selectedMood = getMoodById(
                                moodsId,
                                [...moodpositif, ...moodnegatif, ...moodnetral],
                              );

                              Get.off(
                                () => DetailSubmitWidget(
                                  kegiatan: _catatanTextController.text,
                                  judul: _judulTextController.text,
                                  moodicon: selectedMood['path'],
                                  detailMood: selectedMood['name'],
                                ),
                                duration: const Duration(milliseconds: 500),
                              );
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
                                messageText: Text(
                                  result.toString(),
                                  style: GoogleFonts.poppins(
                                      fontSize: 14, color: Colors.black),
                                ),
                              );
                            }
                            _catatanController.isButtonDisable.value = false;
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 162, 194, 135),
                      minimumSize: const Size(double.infinity, 48.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                    child: _catatanController.isLoadingPost.value
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : Text(
                            'Simpan',
                            style: GoogleFonts.figtree(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600),
                          ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
